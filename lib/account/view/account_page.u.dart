import 'package:flutter/material.dart';

import 'package:revup_core/core.dart';

import '../model/user_model.dart';
import 'account_view.u.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final aUser = AppUser.consumer(
      uuid: '1a',
      firstName: 'Nam',
      lastName: 'Ngoc',
      phone: '0866199497',
      dob: DateTime.now(),
      addr: 'Ninh Binh',
      email: 'namngoc231@gmail.com',
      active: true,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280s.jpg',
      createdTime: DateTime.now(),
      lastUpdatedTime: DateTime.now(),
      vac: const VideoCallAccount(
        id: '',
        username: '',
        pwd: '',
        email: '',
      ),
    );

    return AccountView(user: UserModel.fromDto(aUser), model: aUser);
  }
}
