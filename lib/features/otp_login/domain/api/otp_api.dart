import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_stock_opname/features/login/data/general_response_model.dart';
import 'package:mobile_stock_opname/features/login/data/login_response_model.dart';
import 'package:mobile_stock_opname/features/otp/data/otp_validate_request_model.dart';
import 'package:mobile_stock_opname/utility/url_util.dart';

class OtpApi {
  GeneralResponseModel generalResponseModel = GeneralResponseModel();

  LoginResponseModel loginResponseModel = LoginResponseModel();

  UrlUtil urlUtil = UrlUtil();

  Future<LoginResponseModel> attemptValidateOtp(
      OtpValidateRequestModel otpValidateRequestModel) async {
    List a = [];

    final Map<String, String> header = urlUtil.getHeaderType();

    final Map mapData = {};
    mapData['p_username'] = otpValidateRequestModel.username;
    mapData['p_otp_code'] = otpValidateRequestModel.otp;
    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlValidateOtpLogin()),
          body: json, headers: header);
      if (res.statusCode == 200) {
        loginResponseModel = LoginResponseModel.fromJson(jsonDecode(res.body));
        return loginResponseModel;
      } else {
        loginResponseModel = LoginResponseModel.fromJson(jsonDecode(res.body));
        throw loginResponseModel.message!;
      }
    } catch (ex) {
      throw ex.toString();
    }
  }

  Future<GeneralResponseModel> attemptResendOtp(String userName) async {
    List a = [];

    final Map<String, String> header = urlUtil.getHeaderType();

    final Map mapData = {};
    mapData['p_username'] = userName;
    a.add(mapData);

    final json = jsonEncode(a);

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlResendOtpLogin()),
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
