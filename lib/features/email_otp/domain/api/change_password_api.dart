import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_stock_opname/features/email_otp/data/change_password_request_model.dart';
import 'package:mobile_stock_opname/features/email_otp/data/change_password_response_model.dart';
import 'package:mobile_stock_opname/utility/url_util.dart';

class ChangePasswordApi {
  ChangePasswordResponseModel changePasswordResponseModel =
      ChangePasswordResponseModel();

  UrlUtil urlUtil = UrlUtil();

  Future<ChangePasswordResponseModel> attemptReqChangePassword(
      String userName) async {
    List a = [];

    final Map<String, String> header = urlUtil.getHeaderType();

    final Map mapData = {};
    mapData['p_username'] = userName;
    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlChangePassword()),
          body: json, headers: header);
      if (res.statusCode == 200) {
        changePasswordResponseModel =
            ChangePasswordResponseModel.fromJson(jsonDecode(res.body));
        return changePasswordResponseModel;
      } else {
        changePasswordResponseModel =
            ChangePasswordResponseModel.fromJson(jsonDecode(res.body));
        throw changePasswordResponseModel.message!;
      }
    } catch (ex) {
      throw ex.toString();
    }
  }

  Future<ChangePasswordResponseModel> attemptChangePassword(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    List a = [];

    final Map<String, String> header = urlUtil.getHeaderType();

    final Map mapData = {};
    mapData['p_username'] = changePasswordRequestModel.username;
    mapData['p_new_password'] = changePasswordRequestModel.password;
    mapData['p_confirm_new_password'] =
        changePasswordRequestModel.confirmPassword;
    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlConfirmPassword()),
          body: json, headers: header);
      if (res.statusCode == 200) {
        changePasswordResponseModel =
            ChangePasswordResponseModel.fromJson(jsonDecode(res.body));
        return changePasswordResponseModel;
      } else {
        changePasswordResponseModel =
            ChangePasswordResponseModel.fromJson(jsonDecode(res.body));
        throw changePasswordResponseModel.message!;
      }
    } catch (ex) {
      throw ex.toString();
    }
  }
}
