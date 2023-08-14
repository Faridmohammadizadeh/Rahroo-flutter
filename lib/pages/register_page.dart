import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;
  final _registerFormKey = GlobalKey<FormState>();

  String? _email, _password, _name;

  File? _image;

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleWidget(),
              _profileImage(),
              _registerationForm(),
              _registerButton(),
              _loginPageLink()
            ],
          ),
        ),
      )),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "ثبت نام در راهرو",
      style: TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
    );
  }

  Widget _registerButton() {
    return MaterialButton(
      onPressed: _registerUser,
      minWidth: _deviceWidth! * 0.35,
      height: _deviceHeight! * 0.07,
      color: Color.fromARGB(255, 0, 219, 102),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: const Text(
        "ثبت نام",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  void _registerUser() {
    if (_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
      print("valid");
      Navigator.pushNamed(context, "login");
    }
  }

  Widget _registerationForm() {
    return Container(
      child: Form(
          key: _registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_nameField(), _emailField(), _passwordField()],
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

  Widget _nameField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "نام"),
      onSaved: (_value) {
        setState(() {
          _password = _value;
        });
      },
      validator: (_value) => _value!.length > 4 ? null : "نام خود را وارد کنید",
    );
  }

  Widget _loginPageLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "login"),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("وارد شوید",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 219, 102),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          Text("قبلا ثبت نام کردید؟ ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _profileImage() {
    var _imageProvider = _image != null
        ? FileImage(_image!)
        : const NetworkImage(
            "https://wallpapers-clan.com/wp-content/uploads/2023/01/darth-vader-art-wallpaper-2.jpg");

    return GestureDetector(
      onTap: () {
        FilePicker.platform.pickFiles(type: FileType.image).then((_result) {
          setState(() {
            _image = File(_result!.files.first.path!);
          });
        });
      },
      child: Container(
          height: _deviceHeight! * 0.2,
          width: _deviceHeight! * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: _imageProvider as ImageProvider),
              border: Border.all(
                  color: Color.fromARGB(255, 0, 219, 102), width: 2.0),
              borderRadius: BorderRadius.circular(18.0))),
    );
  }
}
