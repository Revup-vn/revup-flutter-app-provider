import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/pending_service_model.dart';

part 'p12_detail_bloc.freezed.dart';
part 'p12_detail_event.dart';
part 'p12_detail_state.dart';

class P12DetailBloc extends Bloc<P12DetailEvent, P12DetailState> {
  P12DetailBloc(this._ips, this.id, this._irr, this.sr)
      : super(const P12DetailState.initial()) {
    on<P12DetailEvent>(_onEvent);
    _s = _ips.collection().snapshots().listen((event) {
      add(const P12DetailEvent.fetched());
    });
  }

  FutureOr<void> _onEvent(
    P12DetailEvent event,
    Emitter<P12DetailState> emit,
  ) async {
    await event.when(
      submitted: (onRoute) async => (await _irr.get(id)).fold(
        (l) => emit(const P12DetailState.failure()),
        (r) => onRoute(r.vehicle),
      ),
      fetched: () async {
        final maybeRepairRecord = (await _irr.get(id))
            .map<Option<RepairRecord>>(
              (r) => r.maybeMap(
                orElse: none,
                started: some,
              ),
            )
            .fold<Option<RepairRecord>>((l) => none(), (r) => r);
        if (maybeRepairRecord.isNone()) {
          emit(const P12DetailState.failure());
        } else {
          final record =
              maybeRepairRecord.getOrElse(() => throw NullThrownError());
          final services = (await _ips.all())
              .toOption()
              .fold<IList<PendingServiceModel>>(
                nil,
                (a) => a.map(
                  (a) => a.map(
                    pending: (v) =>
                        PendingServiceModel.fromDto(paymentService: v),
                    paid: (v) => PendingServiceModel.fromDto(paymentService: v),
                    needToVerify: (v) =>
                        PendingServiceModel.fromDto(paymentService: v),
                  ),
                ),
              )
              .sort(orderBy(StringOrder.reverse(), (a) => a.status))
              .toList();
          final svProvider = (await sr
                  .repairServiceRepo(
                    AppUserDummy.dummyProvider(record.pid),
                    RepairCategoryDummy.dummy(
                      record.vehicle == 'car' ? 'Oto' : 'Xe máy',
                    ),
                  )
                  .all())
              .fold<IList<RepairService>>((l) => nil(), (r) => r);
          final listServiceImg = services
              .map(
                (e) => e.copyWith(
                  imageUrl: svProvider
                      .find((a) => a.name == e.name)
                      .fold(() => e.imageUrl, (a) => a.img),
                ),
              )
              .toList();
          emit(P12DetailState.populated(services: listServiceImg));
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await _s?.cancel();
    return super.close();
  }

  final IStore<PaymentService> _ips;
  final String id;
  final IStore<RepairRecord> _irr;
  final StoreRepository sr;
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _s;
}
