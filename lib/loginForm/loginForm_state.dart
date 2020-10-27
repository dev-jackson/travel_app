import 'package:control_travel/model/enum/field_error.dart';
import 'package:equatable/equatable.dart';

class LoginFormState {
  final bool isBusy;
  final FieldError userError;
  final FieldError passwordError;
  final bool submissionSuccess;
  LoginFormState({
    this.isBusy: false,
    this.userError,
    this.passwordError,
    this.submissionSuccess,
  });
}
