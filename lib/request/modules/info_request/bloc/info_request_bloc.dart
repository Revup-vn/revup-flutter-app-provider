import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/models.dart';

part 'info_request_bloc.freezed.dart';
part 'info_request_event.dart';
part 'info_request_state.dart';

class InfoRequestBloc extends Bloc<InfoRequestEvent, InfoRequestState> {
  InfoRequestBloc() : super(const _Initial()) {
    on<InfoRequestEvent>(_onEvent);
  }
  // TODO(tcmhoang): depressed cannot review this file
  /// someone please help me

  Future<void> _onEvent(
    InfoRequestEvent event,
    Emitter<InfoRequestState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const InfoRequestState.loading());

        final infoRequestModel = InfoRequestModel(
          user: AppUser.consumer(
            uuid: '1a',
            firstName: 'Nam',
            lastName: 'Ngoc',
            phone: 'XXX-XXX-XXXX',
            dob: DateTime.now(),
            addr: 'Ninh Binh',
            email: 'huyxam@huyxam.cm',
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
          ),
          distance: 2.7,
          feeTransport: 15000,
          vehicleType: 'xe máy',
          message: 'Em đặt hộ bạn, anh gọi vào số này nhé 0989888999',
          totalService: 3,
        );

        emit(
          InfoRequestState.success(infoRequestModel: infoRequestModel),
        );
      },
    );
  }
}
