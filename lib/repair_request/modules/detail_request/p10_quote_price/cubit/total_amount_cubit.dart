import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_amount_cubit.freezed.dart';
part 'total_amount_state.dart';

class TotalAmountCubit extends Cubit<TotalAmountState> {
  TotalAmountCubit(this.pendingAmount)
      : super(TotalAmountState.refresh(total: pendingAmount));

  Future<Unit> updateTotal(int quotePrice) async {
    emit(TotalAmountState.refresh(total: state.total + quotePrice));
    return unit;
  }

  final int pendingAmount;
}
