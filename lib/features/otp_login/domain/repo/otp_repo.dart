import 'package:mobile_stock_opname/features/login/data/general_response_model.dart';
import 'package:mobile_stock_opname/features/login/data/login_response_model.dart';
import 'package:mobile_stock_opname/features/otp/data/otp_validate_request_model.dart';
import 'package:mobile_stock_opname/features/otp_login/domain/api/otp_api.dart';

class OtpRepo {
  final OtpApi otpApi = OtpApi();

  Future<LoginResponseModel?> attemptValidateOtp(
          OtpValidateRequestModel otpValidateRequestModel) =>
      otpApi.attemptValidateOtp(otpValidateRequestModel);

  Future<GeneralResponseModel?> attemptResendOtp(String userName) =>
      otpApi.attemptResendOtp(userName);
}
