import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/servicerawdata.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());
  Future<Unit> searchByKeyword(
    String keyword,
  ) async {
    emit(const SearchState.loading());
    return unit;
  }
}
