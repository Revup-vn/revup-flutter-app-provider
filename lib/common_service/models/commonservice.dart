import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../shared/shared.dart';

part 'commonservice.freezed.dart';

@freezed
class CommonService with _$CommonService {
  factory CommonService({
    required String sName,
    required int sFee,
    required String sImg,
    required List<RepairProduct> products,
  }) = _CommonService;

  factory CommonService.fromDto(
    RepairService r,
    List<Map<String, dynamic>> list,
  ) =>
      CommonService(
        sName: r.name,
        sFee: r.fee,
        sImg: r.img ?? kFallbackServiceImg,
        products: list
            .map(
              (e) => RepairProduct(
                name: e['name'].toString(),
                desc: e['desc'].toString(),
                img: e['img'].toString(),
                price: int.parse(e['price'].toString()),
              ),
            )
            .toList(),
      );
}
