import 'package:mobile_stock_opname/features/additional_request_detail_form/data/submit_request_model.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/upload_doc_request_model.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/domain/api/submit_add_req_api.dart';
import 'package:mobile_stock_opname/features/login/data/general_response_model.dart';

class SubmitAddReqRepo {
  final SubmitAddReqApi submitAddReqApi = SubmitAddReqApi();

  Future<GeneralResponseModel?> attemptSubmit(
          SubmitRequestModel submitRequestModel) =>
      submitAddReqApi.attemptSubmit(submitRequestModel);
  Future<GeneralResponseModel?> attemptUpload(
          UploadDocRequestModel uploadDocRequestModel) =>
      submitAddReqApi.attemptUpload(uploadDocRequestModel);
}
