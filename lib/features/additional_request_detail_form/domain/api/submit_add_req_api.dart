import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/submit_request_model.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/upload_doc_request_model.dart';
import 'package:mobile_stock_opname/features/login/data/general_response_model.dart';
import 'package:mobile_stock_opname/utility/shared_pref_util.dart';
import 'package:mobile_stock_opname/utility/url_util.dart';

class SubmitAddReqApi {
  GeneralResponseModel generalResponseModel = GeneralResponseModel();

  UrlUtil urlUtil = UrlUtil();

  Future<GeneralResponseModel> attemptSubmit(
      SubmitRequestModel submitRequestModel) async {
    List a = [];
    final String? token = await SharedPrefUtil.getSharedString('token');
    final String? uid = await SharedPrefUtil.getSharedString('uid');
    String reversedString = uid!.split('').reversed.join('');
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(reversedString);
    final Map<String, String> header =
        urlUtil.getHeaderTypeWithToken(token!, encoded);

    final Map mapData = {};
    mapData['p_item_code'] = submitRequestModel.pItemCode;
    mapData['p_purchase_condition'] = submitRequestModel.pPurchaseCondition;
    mapData['p_pic_code'] = submitRequestModel.pPicCode;
    mapData['p_remarks_mobile'] = submitRequestModel.pRemarksMobile;

    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlSubmitAddReq()),
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

  Future<GeneralResponseModel> attemptUpload(
      UploadDocRequestModel uploadDocRequestModel) async {
    List a = [];
    final String? token = await SharedPrefUtil.getSharedString('token');
    final String? uid = await SharedPrefUtil.getSharedString('uid');
    String reversedString = uid!.split('').reversed.join('');
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(reversedString);
    final Map<String, String> header =
        urlUtil.getHeaderTypeWithToken(token!, encoded);
    File file = File(uploadDocRequestModel.filePath!);
    Uint8List bytes = file.readAsBytesSync();
    String base64Image = base64Encode(bytes);
    final Map mapData = {};
    mapData['p_asset_register_code'] = uploadDocRequestModel.pAssetRegisterCode;
    mapData['p_file_name'] = uploadDocRequestModel.pFileName;
    mapData['p_base64'] = base64Image;

    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlUploadDocReq()),
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
