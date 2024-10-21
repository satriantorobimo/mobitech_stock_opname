import 'package:equatable/equatable.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/data/submit_request_model.dart';

abstract class SubmitAddReqEvent extends Equatable {
  const SubmitAddReqEvent();
}

class SubmitAddReqAttempt extends SubmitAddReqEvent {
  const SubmitAddReqAttempt({required this.submitRequestModel});
  final SubmitRequestModel submitRequestModel;

  @override
  List<Object> get props => [submitRequestModel];
}
