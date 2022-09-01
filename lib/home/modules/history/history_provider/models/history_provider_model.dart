import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'history_provider_model.freezed.dart';

@freezed
class HistoryProviderModel with _$HistoryProviderModel {
  const factory HistoryProviderModel({
    required String orderNumber,
    required int vehicleType,
    required DateTime timeCreated,
    required int orderStatus,
    required String userName,
    required String imgUrl,
  }) = _HistoryProviderModel;

  factory HistoryProviderModel.fromProviderModel(
    RepairRecord rp,
    AppUser appUser,
  ) =>
      HistoryProviderModel(
        orderNumber: rp.id,
        vehicleType: rp.vehicle == 'motorbike' ? 0 : 1,
        timeCreated: rp.created,
        orderStatus: rp.maybeMap(
          orElse: () => 2,
          aborted: (value) => 0,
          finished: (value) => 1,
        ),
        imgUrl: appUser.avatarUrl,
        userName: '${appUser.firstName} ${appUser.lastName}',
      );
}
