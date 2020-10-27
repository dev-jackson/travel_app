import 'package:control_travel/loginForm/loginForm_bloc.dart';
import 'package:control_travel/loginForm/loginForm_state.dart';
import 'package:control_travel/model/enum/field_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Clean Code",
      home: BlocProvider(
        create: (_) => LoginFormBloc(),
        child: MainApp(),
      ),
      theme: ThemeData(fontFamily: "Abel"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  LoginFormBloc _logBloc;
  final _userController = TextEditingController();
  final _passowordController = TextEditingController();
  bool isCheck;
  FocusNode oneFocusNode;
  FocusNode twoFocusNode;
  @override
  void initState() {
    this._logBloc = LoginFormBloc();
    super.initState();
    isCheck = false;
    oneFocusNode = FocusNode();
    twoFocusNode = FocusNode();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    _userController.dispose();
    _passowordController.dispose();
    _logBloc.close();
    oneFocusNode.dispose();
    twoFocusNode.dispose();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginFormBloc, LoginFormState>(
      listener: (context, state) {
        if (state.submissionSuccess) {}
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/Ilogo.png",
                    height: size.height / 4,
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          "Iniciar Session",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          controller: this._userController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          onFieldSubmitted: (val) {
                            oneFocusNode.unfocus();
                            FocusScope.of(context).requestFocus(twoFocusNode);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            focusNode: twoFocusNode),
                        Container(
                            width: size.width,
                            child: Row(
                              children: [
                                Checkbox(
                                  visualDensity: VisualDensity.compact,
                                  onChanged: (v) => {
                                    setState(() {
                                      isCheck = v;
                                    })
                                  },
                                  value: isCheck,
                                ),
                                Text("Recordarmelo"),
                              ],
                            )),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        FlatButton(
                          height: 45.0,
                          minWidth: size.width * .6,
                          color: Colors.blue[400],
                          child: Text(
                            "Ingresar",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder _renderBorder(LoginFormState state) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
            color: this._hasUserNameError(state) ? Colors.red : Colors.black,
            width: 1),
      );

  bool _hasUserNameError(LoginFormState state) => state.userError != null;

  bool _hasPassowrdError(LoginFormState state) => state.passwordError != null;
  String _userNameErrorText(FieldError error) {
    switch (error) {
      case FieldError.Empy:
        return 'You need to enter an user address';
      case FieldError.Invalid:
        return 'User address invalid';
      default:
        return '';
    }
  }

  String _passwordErrorText(FieldError error) {
    switch (error) {
      case FieldError.Empy:
        return 'You need to enter an pws address';
      case FieldError.Invalid:
        return 'Password address invalid';
      default:
        return '';
    }
  }
}
