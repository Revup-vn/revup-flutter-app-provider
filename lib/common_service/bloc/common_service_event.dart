part of 'common_service_bloc.dart';

@freezed
class CommonServiceEvent with _$CommonServiceEvent {
  const factory CommonServiceEvent.started() = _Started;
  const factory CommonServiceEvent.submited({
    required List<
            Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
        saveList,
  }) = _Submited;
}
