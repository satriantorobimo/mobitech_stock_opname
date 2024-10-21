import 'package:equatable/equatable.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/upload_doc_request_model.dart';

abstract class UploadDocReqEvent extends Equatable {
  const UploadDocReqEvent();
}

class UploadDocReqAttempt extends UploadDocReqEvent {
  const UploadDocReqAttempt({required this.uploadDocRequestModel});
  final UploadDocRequestModel uploadDocRequestModel;

  @override
  List<Object> get props => [uploadDocRequestModel];
}
