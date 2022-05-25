// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class LoginPage extends StatelessWidget {
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
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  //initialValue: "emailteste@gmail.com",
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: AppColors.shape),
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
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  //initialValue: "emailteste@gmail.com",
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "Senha",
                    hintStyle: TextStyle(color: AppColors.shape),
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
                        borderRadius: BorderRadius.circular(32)),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.all(12),
                    color: AppColors.primary,
                    child: Text(
                      "Acessar",
                      style: TextStyle(color: AppColors.shape),
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Esqueceu a senha",
                      style: TextStyle(color: AppColors.shape),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
