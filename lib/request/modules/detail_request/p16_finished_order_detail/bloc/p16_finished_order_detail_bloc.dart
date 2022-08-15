import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../../models/models.dart';

part 'p16_finished_order_detail_event.dart';
part 'p16_finished_order_detail_state.dart';
part 'p16_finished_order_detail_bloc.freezed.dart';

class P16FinishedOrderDetailBloc
    extends Bloc<P16FinishedOrderDetailEvent, P16FinishedOrderDetailState> {
  P16FinishedOrderDetailBloc(this.data)
      : super(const P16FinishedOrderDetailState.initial()) {
    on<P16FinishedOrderDetailEvent>((event, emit) {
      event.when(
        started: () => unit,
        populateData: () => emit(
          P16FinishedOrderDetailState.loadSuccess(
            paid: data.tail,
            unpaid: data.head,
          ),
        ),
      );
    });
  }
  final Tuple2<List<PendingServiceModel>, List<PaidServicesModel>> data;
}
