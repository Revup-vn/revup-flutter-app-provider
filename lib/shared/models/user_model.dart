import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String email,
    required String phone,
    required DateTime date,
    required String address,
    required String urlImage,
    required bool onlineStatus,
  }) = _UserModel;

  factory UserModel.fromDto(AppUser user) => UserModel(
        name: '${user.firstName} ${user.lastName}',
        email: user.email,
        phone: user.phone,
        date: user.dob,
        address: user.addr,
        urlImage: user.avatarUrl,
        onlineStatus: user.maybeMap(
          orElse: () => false,
          provider: (value) => value.online,
        ),
      );
}
