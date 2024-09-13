import 'package:equatable/equatable.dart';
import 'package:mobile_stock_opname/features/email_otp/data/change_password_response_model.dart';

abstract class ResendOtpState extends Equatable {
  const ResendOtpState();

  @override
  List<Object> get props => [];
}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpLoaded extends ResendOtpState {
  const ResendOtpLoaded({required this.changePasswordResponseModel});
  final ChangePasswordResponseModel changePasswordResponseModel;

  @override
  List<Object> get props => [changePasswordResponseModel];
}

class ResendOtpError extends ResendOtpState {
  const ResendOtpError(this.error);
  final String? error;

  @override
  List<Object> get props => [error!];
}

class ResendOtpException extends ResendOtpState {
  const ResendOtpException(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
