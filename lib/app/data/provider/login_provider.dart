// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:tmdbmovies/app/data/model/user_model.dart';

class LoginApiClient {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('login_firebase');

  // Retornar usuário que está logado
  Stream<User> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged
      .map((FirebaseUser currentUser) => User.fromSnapshot(currentUser));

  // Criar o usuário
  Future<User> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      // Atualizando o nome do usuário
      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      await currentUser.updateProfile(userUpdateInfo);
      await currentUser.reload();

      return User.fromSnapshot(currentUser);
    } catch (e) {
      print(e.code);
      Get.back();
      switch (e.code) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Contas anônimas não estão habilitadas"),
              ));
          break;
        case "ERROR_WEAK_PASSWORD":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sua senha é muito fraca"),
              ));
          break;
        case "ERROR_INVALID_EMAIL":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Seu email é inválido"),
              ));
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Text("O e-mail já está em uso em outra conta"));
          break;
        case "ERROR_INVALID_CREDENTIAL":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Seu email é inválido"),
              ));
          break;
        default:
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Ocorreu um erro indefinido."),
              ));
      }
      return null;
    }
  }

  // Fazer Login
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return User.fromSnapshot(currentUser);
    } catch (e) {
      print(e.code);
      Get.back();
      switch (e.code) {
        case "ERROR_USER_NOT_FOUND":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Usuário não encontrado."),
              ));
          break;
        case "ERROR_WRONG_PASSWORD":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Senha não confere com o cadastrado."),
              ));
          break;
        case "ERROR_USER_DISABLED":
          Get.defaultDialog(
              title: "Ops, algo deu errado ",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Este usuário foi desativado."),
              ));
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Muitos solicitações. Tente novamente mais tarde."),
              ));
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Este login com e-mail e senha não foi permitida."),
              ));
          break;
        default:
          Get.defaultDialog(
              title: "Ops, algo deu errado",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$e"),
              ));
          break;
      }
      return null;
    }
  }

  // Fazer Logoff
  signOut() {
    box.write("auth", null);
    //box.erase();
    return _firebaseAuth.signOut();
  }
}
