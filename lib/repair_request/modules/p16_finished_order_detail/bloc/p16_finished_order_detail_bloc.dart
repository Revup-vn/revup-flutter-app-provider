import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/pending_service_model.dart';

part 'p16_finished_order_detail_bloc.freezed.dart';
part 'p16_finished_order_detail_event.dart';
part 'p16_finished_order_detail_state.dart';

class P16FinishedOrderDetailBloc
    extends Bloc<P16FinishedOrderDetailEvent, P16FinishedOrderDetailState> {
  P16FinishedOrderDetailBloc(this.services)
      : super(const P16FinishedOrderDetailState.initial()) {
    on<P16FinishedOrderDetailEvent>((event, emit) {
      event.when(
        started: () => unit,
        populateData: () => emit(
          P16FinishedOrderDetailState.loadSuccess(
            services: services,
          ),
        ),
      );
    });
  }
  final List<PendingServiceModel> services;
}
