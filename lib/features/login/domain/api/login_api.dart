import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_stock_opname/features/login/data/login_request_model.dart';
import 'package:mobile_stock_opname/features/login/data/login_response_model.dart';
import 'package:mobile_stock_opname/utility/url_util.dart';

class LoginApi {
  LoginResponseModel loginResponseModel = LoginResponseModel();

  UrlUtil urlUtil = UrlUtil();

  Future<LoginResponseModel> attemptLogin(
      LoginRequestModel loginRequestModel) async {
    final Map<String, String> header = urlUtil.getHeaderTypeForm();

    try {
      final res = await http.post(Uri.parse(urlUtil.getUrlLogin()),
          body: {
            'username': loginRequestModel.username,
            'password': loginRequestModel.password,
          },
          headers: header);
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
}
