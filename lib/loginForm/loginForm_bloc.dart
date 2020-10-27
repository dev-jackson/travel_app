import 'package:control_travel/loginForm/loginForm_event.dart';
import 'package:control_travel/loginForm/loginForm_state.dart';
import 'package:control_travel/model/enum/field_error.dart';
import 'package:control_travel/model/mixins/validation_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState>
    with ValidationMixin {
  LoginFormBloc() : super(null);
  @override
  LoginFormState get initialState => LoginFormState();

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event) async* {
    if (event is LoginFormEventSubmit) {
      yield LoginFormState(isBusy: true);

      if (this.isFieldEmpty(event.userName) &&
          this.isFieldEmpty(event.password)) {
        yield LoginFormState(
            userError: FieldError.Empy, passwordError: FieldError.Empy);
        return;
      }
      if (this.isFieldEmpty(event.password)) {
        yield LoginFormState(passwordError: FieldError.Empy);
        return;
      } else if (this.isFieldEmpty(event.userName)) {
        yield LoginFormState(userError: FieldError.Empy);
        return;
      }

      yield LoginFormState(submissionSuccess: true);
    }
  }
}
