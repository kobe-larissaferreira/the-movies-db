// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdbmovies/app/controller/login_controller.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.5, 1),
                colors: <Color>[
                  Color(0xff60368A),
                  Color(0xff000000),
                  Color(0xff000000),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24),
                children: [
                  Hero(
                    tag: "hero",
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 48.0,
                  ),
                  TextFormField(
                    controller: _loginController.emailTextController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Por favor, digite seu email.";
                      } else if (!GetUtils.isEmail(value)) {
                        return "Digite um email v??lido";
                      }
                      return null;
                    },

                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    style: TextStyle(color: AppColors.shape),
                    //initialValue: "emailteste@gmail.com",
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Digite seu Email",

                      hintStyle:
                          TextStyle(color: AppColors.shape, fontSize: 12),
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.shape),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _loginController.passwordTextController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Por favor, digite uma senha.";
                      } else if (value.length < 6) {
                        return "Digite uma senha maior que 5 caracteres";
                      }
                      return null;
                    },
                    autofocus: false,
                    obscureText: true,
                    style: TextStyle(color: AppColors.shape),
                    //initialValue: "emailteste@gmail.com",
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Digite sua Senha",

                      hintStyle:
                          TextStyle(color: AppColors.shape, fontSize: 12),
                      // ignore: prefer_const_constructors
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.shape,
                          ),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _loginController.login();
                        }
                      },
                      padding: EdgeInsets.all(12),
                      color: AppColors.primary,
                      child: Text(
                        "Acessar",
                        style: TextStyle(color: AppColors.shape, fontSize: 12),
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Esqueceu a senha?",
                        style: TextStyle(color: AppColors.shape),
                      )),
                  FlatButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text(
                        "Cadastrar-se",
                        style: TextStyle(color: AppColors.shape),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
