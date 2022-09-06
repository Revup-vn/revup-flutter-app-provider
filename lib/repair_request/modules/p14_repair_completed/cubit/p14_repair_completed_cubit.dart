import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/models.dart';

part 'p14_repair_completed_cubit.freezed.dart';
part 'p14_repair_completed_state.dart';

class P14RepairCompletedCubit extends Cubit<P14RepairCompletedState> {
  P14RepairCompletedCubit(
    this._irr,
    this._rid,
    this._sb,
    this._sr,
    this._iau,
    this._user,
  ) : super(const P14RepairCompletedState.initial());
  final IStore<RepairRecord> _irr;
  final IStore<AppUser> _iau;
  final AppUser _user;
  final StoreRepository _sr;
  final StorageBloc _sb;
  final String _rid;

  List<StorageFile> imgs = [];
  // ignore: use_setters_to_change_properties
  void setImgs(List<StorageFile> files) => imgs = files;

  Future<Unit> submit(
    List<PendingServiceModel> finished,
    List<PaidServicesModel> paid,
    Function4<String, String, String, String, void> sendMessage,
    Function0<void> onRoute,
  ) async {
    final currRecord =
        await _irr.get(_rid); // The record must have type started

    currRecord.fold((l) => emit(const P14RepairCompletedState.failed()),
        (repairRecord) async {
      // Save images
      final imgLinks = await _auxUploadImage(imgs);

      // Update service status
      final _irp = _sr.repairPaymentRepo(repairRecord);

      for (final e in finished) {
        (await _irp.get(e.name)).fold(
          (l) => unit,
          (r) => r
              .maybeMap<Option<PaymentService>>(
                // Must be pending Type
                pending: (val) => some(
                  PaymentService.paid(
                    moneyAmount: val.moneyAmount,
                    paidIn: DateTime.now(),
                    products: val.products,
                    serviceName: val.serviceName,
                  ),
                ),
                orElse: none,
              )
              .traverseFuture((a) async => _irp.update(a)),
        );
      }

      // Update record
      await _irr.update(
        repairRecord.maybeMap(
          orElse: () => throw NullThrownError(),
          started: (val) => RepairRecord.finished(
            id: val.id,
            cid: val.cid,
            pid: val.pid,
            created: val.created,
            desc: val.desc,
            vehicle: val.vehicle,
            money: (paid.isEmpty
                    ? 0
                    : paid
                        .map((e) => e.price)
                        .reduce((value, element) => value + element)) +
                (paid.isEmpty
                    ? 0
                    : finished
                        .map((e) => e.price)
                        .reduce((value, element) => value + element)),
            moving: val.moving,
            started: val.started,
            completed: DateTime.now(),
            imgs: imgLinks,
            feedback:
                ReportFeedbackDummy.dummy(), // Consumer will overwrite this
            from: val.from,
            to: val.to,
          ),
        ),
      );

      _iau.updateFields(
        _user.maybeMap(
          orElse: () => throw NullThrownError(),
          provider: (p) => p.copyWith(
            online: true,
          ),
        ),
        cons(AppUserDummy.field(AppUserFields.Online), nil()),
      );
      final tokens = (await _sr
              .userNotificationTokenRepo(
                AppUserDummy.dummyConsumer(repairRecord.cid),
              )
              .all())
          .map(
            (r) => r.sort(
              orderBy(StringOrder.reverse(), (a) => a.created.toString()),
            ),
          )
          .fold((l) => throw NullThrownError(), (r) => r.toList());
      log('TOKEN:${tokens.first.token}');
      sendMessage(
        tokens.first.token,
        repairRecord.pid,
        'completedRepair',
        repairRecord.id,
      );
      onRoute();
    });
    return unit;
  }

  Future<List<String>> _auxUploadImage(List<StorageFile> imgs) async {
    if (imgs.isEmpty) {
      return Future.value([]);
    }
    final isUploadCompleted = Completer<List<String>>();
    _sb.add(StorageEvent.uploadMany(files: IList.from(imgs)));
    final _l = _sb.stream.listen(
      (event) => event.maybeMap(
        orElse: () => unit,
        success: (value) => isUploadCompleted.complete(
          value.eitherFailuresOrUrls
              .filter((a) => a.isRight())
              .map(
                (a) => a.getOrElse(
                  () => throw NullThrownError(),
                ),
              )
              .toList(),
        ),
      ),
    );
    await isUploadCompleted.future;
    await _l.cancel();
    return isUploadCompleted.future;
  }
}
