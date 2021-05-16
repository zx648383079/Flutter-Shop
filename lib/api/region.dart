import 'package:flutter_shop/models/region.dart';
import 'package:flutter_shop/utils/http.dart';

class RegionApi {
  static void getList(int id, Function(RegionData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/region', data: {'id': id},
        success: (res) {
      success(RegionData.fromJson(res));
    }, error: error);
  }
}
