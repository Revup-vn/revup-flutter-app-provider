import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../model/history_provider_model.dart';

part 'history_provider_bloc.freezed.dart';
part 'history_provider_event.dart';
part 'history_provider_state.dart';

class HistoryProviderBloc
    extends Bloc<HistoryProviderEvent, HistoryProviderState> {
  HistoryProviderBloc() : super(const _Initial()) {
    on<HistoryProviderEvent>(_onEventHistory);
  }
  Future<void> _onEventHistory(
    HistoryProviderEvent event,
    Emitter<HistoryProviderState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const HistoryProviderState.loading());
        final histories = [
          HistoryProviderModel(
            isComplete: false,
            orderNumber: '12345',
            vehicleType: 'xe máy',
            serviceName: 'Thay săm xe',
            serviceStartBooking: DateTime.now(),
            orderStatusNotification: 'Khách đã hủy',
            user: AppUser.consumer(
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
            ),
          ),
          HistoryProviderModel(
            isComplete: true,
            orderNumber: '23456',
            vehicleType: 'ô tô',
            serviceName: 'Hết xăng',
            serviceStartBooking: DateTime.now(),
            orderStatusNotification: 'Thanh toán thành công',
            user: AppUser.consumer(
              uuid: '1a',
              firstName: 'Nam',
              lastName: 'Ngoc',
              phone: '0866199497',
              dob: DateTime.now(),
              addr: 'Ninh Binh',
              email: 'namngoc231@gmail.com',
              active: true,
              avatarUrl:
                  'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
              createdTime: DateTime.now(),
              lastUpdatedTime: DateTime.now(),
              vac: const VideoCallAccount(
                id: '',
                username: '',
                pwd: '',
                email: '',
              ),
            ),
          ),
          HistoryProviderModel(
            isComplete: false,
            orderNumber: '34567',
            vehicleType: 'xe máy',
            serviceName: 'Thay phanh xe',
            serviceStartBooking: DateTime.now(),
            orderStatusNotification: 'Bạn đã từ chối yêu cầu',
            user: AppUser.consumer(
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
            ),
          ),
        ];
        emit(
          HistoryProviderState.success(histories),
        );
      },
    );
  }
}
