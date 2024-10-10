import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_stock_opname/features/asset_opname_detail/data/asset_grow_request_model.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/data/asset_grow_response_model.dart';
import 'package:mobile_stock_opname/features/login/data/general_response_model.dart';
import 'package:mobile_stock_opname/utility/shared_pref_util.dart';
import 'package:mobile_stock_opname/utility/url_util.dart';

class AssetGrowApi {
  AssetGrowResponseModel assetGrowResponseModel = AssetGrowResponseModel();
  GeneralResponseModel generalResponseModel = GeneralResponseModel();

  UrlUtil urlUtil = UrlUtil();

  Future<AssetGrowResponseModel> attemptAssetGrow(
      AssetGrowRequestModel assetGrowRequestModel) async {
    List a = [];
    final String? token = await SharedPrefUtil.getSharedString('token');
    final String? uid = await SharedPrefUtil.getSharedString('uid');
    String reversedString = uid!.split('').reversed.join('');
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(reversedString);
    final Map<String, String> header =
        urlUtil.getHeaderTypeWithToken(token!, encoded);

    final Map mapData = {};
    mapData['p_code'] = assetGrowRequestModel.pCode;
    mapData['p_type_input_code'] = assetGrowRequestModel.pTypeInputCode;
    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlAssetGrow()),
          body: json, headers: header);
      if (res.statusCode == 200) {
        assetGrowResponseModel =
            AssetGrowResponseModel.fromJson(jsonDecode(res.body));
        return assetGrowResponseModel;
      } else {
        assetGrowResponseModel =
            AssetGrowResponseModel.fromJson(jsonDecode(res.body));
        throw assetGrowResponseModel.message!;
      }
    } catch (ex) {
      throw ex.toString();
    }
  }

  Future<GeneralResponseModel> attemptReserved(String assetCode) async {
    List a = [];
    final String? token = await SharedPrefUtil.getSharedString('token');
    final String? uid = await SharedPrefUtil.getSharedString('uid');
    String reversedString = uid!.split('').reversed.join('');
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(reversedString);
    final Map<String, String> header =
        urlUtil.getHeaderTypeWithToken(token!, encoded);

    final Map mapData = {};
    mapData['p_asset_code'] = assetCode;
    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlReserved()),
          body: json, headers: header);
      if (res.statusCode == 200) {
        generalResponseModel =
            GeneralResponseModel.fromJson(jsonDecode(res.body));
        return generalResponseModel;
      } else {
        generalResponseModel =
            GeneralResponseModel.fromJson(jsonDecode(res.body));
        throw generalResponseModel.message!;
      }
    } catch (ex) {
      throw ex.toString();
    }
  }
}
