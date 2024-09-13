import 'dart:convert';

class UrlUtil {
  static String baseUrl = 'http://149.129.243.237/';

  static Map<String, String> headerType() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  static Map<String, String> headerTypeBasicAuth(
          String username, String password) =>
      {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$username:$password'))}'
      };

  static Map<String, String> headerTypeWithToken(String token, String userId) =>
      {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Userid': userId
      };

  static Map<String, String> headerTypeWithTokenNoUserId(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  static Map<String, String> headerTypeForm() => {
        'Content-Type': 'application/x-www-form-urlencoded',
      };

  Map<String, String> getHeaderTypeWithToken(String token, String userId) {
    return headerTypeWithToken(token, userId);
  }

  Map<String, String> getHeaderTypeWithTokenNoUserId(String token) {
    return headerTypeWithTokenNoUserId(token);
  }

  Map<String, String> getHeaderTypeBasicAuth(String username, String password) {
    return headerTypeBasicAuth(username, password);
  }

  Map<String, String> getHeaderTypeForm() {
    return headerTypeForm();
  }

  Map<String, String> getHeaderType() {
    return headerType();
  }

  static String urlLogin() => 'Token_SOMobile/api/Authenticate/request';

  String getUrlLogin() {
    final String getUrlLogin2 = urlLogin();
    return baseUrl + getUrlLogin2;
  }

  static String urlChangePassword() =>
      'eBase_api/api/SysCompanyUserMainExternal/ExecSpForRequestChangePassword';

  String getUrlChangePassword() {
    final String urlChangePassword2 = urlChangePassword();
    return baseUrl + urlChangePassword2;
  }

  static String urlValidateOtp() =>
      'eBase_api/api/SysCompanyUserMainExternal/ExecSpForValidateOTPChangePassword';

  String getUrlValidateOtp() {
    final String urlValidateOtp2 = urlValidateOtp();
    return baseUrl + urlValidateOtp2;
  }

  static String urlResendOtp() =>
      'eBase_api/api/SysCompanyUserMainExternal/ExecSpForResendOTPChangePassword';

  String getUrlResendOtp() {
    final String urlResendOtp2 = urlResendOtp();
    return baseUrl + urlResendOtp2;
  }

  static String urlConfirmPassword() =>
      'eBase_api/api/SysCompanyUserMainExternal/ExecSpForChangePassword';

  String getUrlConfirmPassword() {
    final String urlConfirmPassword2 = urlConfirmPassword();
    return baseUrl + urlConfirmPassword2;
  }
}
