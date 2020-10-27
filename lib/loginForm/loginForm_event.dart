abstract class LoginFormEvent {}

class LoginFormEventSubmit extends LoginFormEvent {
  final String userName;
  final String password;
  LoginFormEventSubmit(this.userName, this.password);
}
