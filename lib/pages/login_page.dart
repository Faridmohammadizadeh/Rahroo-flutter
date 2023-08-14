import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;

  final _loginFormKey = GlobalKey<FormState>();

  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _titleWidget(),
            _loginForm(),
            _loginButton(),
            _registerPageLink()
          ],
        )),
      )),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "ورود به راهرو",
      style: TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: _loginUser,
      minWidth: _deviceWidth! * 0.35,
      height: _deviceHeight! * 0.07,
      color: Color.fromARGB(255, 0, 219, 102),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: const Text(
        "ورود",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      // height: _deviceHeight! * 0.40,
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_emailField(), _passwordField()],
          )),
    );
  }

  Widget _emailField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "ایمیل"),
      onSaved: (_value) {
        setState(() {
          _email = _value;
        });
      },
      validator: (_value) {
        bool _result = _value!.contains(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
        return _result ? null : "ایمیل نامعتبر";
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "رمزعبور"),
      onSaved: (_value) {
        setState(() {
          _password = _value;
        });
      },
      validator: (_value) => _value!.length > 6 ? null : "رمز عبور کوتاه است",
    );
  }

  void _loginUser() {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      Navigator.pushNamed(context, "home");
    }
  }

  Widget _registerPageLink() {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, "register"),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ثبت نام کنید",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 219, 102),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Text("اکانت ندارید؟ ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ));
  }
}
