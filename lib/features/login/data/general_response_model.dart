class GeneralResponseModel {
  int? status;
  String? message;
  int? result;

  GeneralResponseModel({this.status, this.message, this.result});

  GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['result'] = result;
    data['message'] = message;
    return data;
  }
}
