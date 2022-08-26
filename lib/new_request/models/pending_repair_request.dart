import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'pending_repair_request.freezed.dart';

@freezed
class PendingRepairRequest with _$PendingRepairRequest {
  const factory PendingRepairRequest({
    required String id,
    required String cid,
    required String pid,
    required DateTime created,
    required String desc,
    required String vehicle,
    required int money,
    required Location from,
    required Location to,
    List<OptionalService>? optionalServices,
    String? recordType,
  }) = _PendingRepairRequest;

  factory PendingRepairRequest.fromDto({required RepairRecord repairRecord}) =>
      repairRecord.maybeMap(
        pending: (v) => PendingRepairRequest(
          id: repairRecord.id,
          cid: repairRecord.cid,
          pid: repairRecord.pid,
          created: repairRecord.created,
          desc: repairRecord.desc,
          vehicle: repairRecord.vehicle,
          money: repairRecord.money,
          from: repairRecord.from,
          to: repairRecord.to,
          optionalServices: v.services,
          recordType: 'pending',
        ),
        accepted: (v) => PendingRepairRequest(
          id: repairRecord.id,
          cid: repairRecord.cid,
          pid: repairRecord.pid,
          created: repairRecord.created,
          desc: repairRecord.desc,
          vehicle: repairRecord.vehicle,
          money: repairRecord.money,
          from: repairRecord.from,
          to: repairRecord.to,
          recordType: 'pending',
        ),
        arrived: (v) => PendingRepairRequest(
          id: repairRecord.id,
          cid: repairRecord.cid,
          pid: repairRecord.pid,
          created: repairRecord.created,
          desc: repairRecord.desc,
          vehicle: repairRecord.vehicle,
          money: repairRecord.money,
          from: repairRecord.from,
          to: repairRecord.to,
          recordType: 'arrived',
        ),
        orElse: () => throw NullThrownError(),
      );
}
