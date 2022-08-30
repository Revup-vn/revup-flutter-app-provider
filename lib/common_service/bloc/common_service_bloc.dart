import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/commonservice.dart';

part 'common_service_bloc.freezed.dart';
part 'common_service_event.dart';
part 'common_service_state.dart';

class CommonServiceBloc extends Bloc<CommonServiceEvent, CommonServiceState> {
  CommonServiceBloc(
    this.providerID,
    this.sortType,
  ) : super(const _Initial()) {
    on<CommonServiceEvent>(_onEvent);
  }
  final String providerID;
  final int sortType;

  FutureOr<void> _onEvent(
    CommonServiceEvent event,
    Emitter<CommonServiceState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const CommonServiceState.loading());
        final data = await readJson();
        final cate = data['category'] as List<dynamic>;
        final categoriesList = ((json.decode(json.encode(cate[sortType]))
                as Map<String, dynamic>)['service'] as List)
            .cast<Map<String, dynamic>>();
        final listServiceCate = categoriesList
            .map(
              (e) => CommonService.fromDto(
                RepairService(
                  name: e['name'].toString(),
                  fee: int.parse(e['fee'].toString()),
                  img: e['img'].toString(),
                ),
                (e['product'] as List).cast<Map<String, dynamic>>(),
              ),
            )
            .toList();

        emit(
          CommonServiceState.success(
            list: listServiceCate,
            providerID: providerID,
          ),
        );
      },
      submited: () async {},
    );
  }

  Future<Map<String, dynamic>> readJson() async {
    final response = await rootBundle.loadString('assets/common_service.json');
    final data = json.decode(response) as Map<String, dynamic>;
    return data;
  }
}
