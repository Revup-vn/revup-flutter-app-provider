import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/notification_provider_model.dart';

part 'notification_provider_bloc.freezed.dart';
part 'notification_provider_event.dart';
part 'notification_provider_state.dart';

class NotificationProviderBloc
    extends Bloc<NotificationProviderEvent, NotificationProviderState> {
  NotificationProviderBloc() : super(const _Initial()) {
    on<NotificationProviderEvent>(_onEventNotification);
  }

  Future<void> _onEventNotification(
    NotificationProviderEvent event,
    Emitter<NotificationProviderState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const NotificationProviderState.loading());
        final notifications = [
          NotificationProviderModel(
            orderStatusNotification: 'Khách hàng xác nhận sửa chữa',
            orderNumber: '34567',
            serviceStartBooking: DateTime.now(),
          ),
          NotificationProviderModel(
            orderStatusNotification: 'Khách hàng yêu cầu cung cấp giá',
            orderNumber: '34567',
            serviceStartBooking: DateTime.now(),
          ),
          NotificationProviderModel(
            orderStatusNotification: 'Khách hàng yêu cầu sửa chữa',
            orderNumber: '34567',
            serviceStartBooking: DateTime.now(),
          ),
        ];

        emit(
          NotificationProviderState.success(notifications),
        );
      },
    );
  }
}
