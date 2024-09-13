import 'package:mobile_stock_opname/features/login/data/login_request_model.dart';
import 'package:mobile_stock_opname/features/login/data/login_response_model.dart';
import 'package:mobile_stock_opname/features/login/domain/api/login_api.dart';

class LoginRepo {
  final LoginApi loginApi = LoginApi();

  Future<LoginResponseModel?> attemptLogin(
          LoginRequestModel loginRequestModel) =>
      loginApi.attemptLogin(loginRequestModel);
}
