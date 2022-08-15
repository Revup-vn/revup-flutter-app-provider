import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/models.dart';

part 'overview_record_state.dart';
part 'overview_record_cubit.freezed.dart';

class OverviewRecordCubit extends Cubit<OverviewRecordState> {
  OverviewRecordCubit(this._irr, this._rid, this._sb, this._sr)
      : super(const OverviewRecordState.initial());
  final IStore<RepairRecord> _irr;
  final StoreRepository _sr;
  final StorageBloc _sb;
  final String _rid;

  List<StorageFile> imgs = [];
  void setImgs(List<StorageFile> files) => imgs = files;

  Future<Unit> submit(
    List<PendingServiceModel> finished,
    List<PaidServicesModel> paid,
  ) async {
    final currRecord =
        await _irr.get(_rid); // The record must have type started
    currRecord.fold((l) => emit(const OverviewRecordState.failed()), (r) async {
      // Save images
      final imgLinks = await _auxUploadImage(imgs);

      // Update service status
      final _irp = _sr.repairPaymentRepo(r);
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
        r.maybeMap(
          orElse: () => throw NullThrownError(),
          started: (val) => RepairRecord.finished(
              id: val.id,
              cid: val.cid,
              pid: val.pid,
              created: val.created,
              desc: val.desc,
              vehicle: val.vehicle,
              money: paid
                      .map((e) => e.price)
                      .reduce((value, element) => value + element) +
                  finished
                      .map((e) => e.price)
                      .reduce((value, element) => value + element),
              moving: val.moving,
              started: val.started,
              completed: DateTime.now(),
              imgs: imgLinks,
              feedback:
                  ReportFeedbackDummy.dummy(), // Consumer will overwrite this
              from: val.from,
              to: val.to),
        ),
      );
    });

    return unit;
  }

  Future<List<String>> _auxUploadImage(List<StorageFile> imgs) async {
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
