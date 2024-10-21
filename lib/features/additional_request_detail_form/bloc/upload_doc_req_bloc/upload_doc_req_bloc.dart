import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/domain/repo/submit_add_req_repo.dart';

import 'bloc.dart';

class UploadDocReqBloc extends Bloc<UploadDocReqEvent, UploadDocReqState> {
  UploadDocReqState get initialState => UploadDocReqInitial();
  SubmitAddReqRepo submitAddReqRepo = SubmitAddReqRepo();
  UploadDocReqBloc({required this.submitAddReqRepo})
      : super(UploadDocReqInitial()) {
    on<UploadDocReqEvent>((event, emit) async {
      if (event is UploadDocReqAttempt) {
        try {
          emit(UploadDocReqLoading());
          final generalResponseModel =
              await submitAddReqRepo.attemptUpload(event.uploadDocRequestModel);
          if (generalResponseModel!.result == 1) {
            emit(
                UploadDocReqLoaded(generalResponseModel: generalResponseModel));
          } else if (generalResponseModel.result == 0) {
            emit(UploadDocReqError(generalResponseModel.message));
          } else {
            emit(const UploadDocReqException('error'));
          }
        } catch (e) {
          emit(UploadDocReqException(e.toString()));
        }
      }
    });
  }
}
