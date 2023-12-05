import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/authentication_screen/create_new_password_screen.dart';
import 'package:searchable_menu/authentication_screen/forgot_password_screen.dart';
import 'package:searchable_menu/authentication_screen/login_via_mobile_screen.dart';
import 'package:searchable_menu/authentication_screen/otp_verification_screen.dart';
import 'package:searchable_menu/authentication_screen/registration_screen.dart';
import 'package:searchable_menu/controller/theme_controller.dart';
import 'authentication_screen/Login_Screen.dart';


void main() {
  controllerList.add(LoginScreenController());
  controllerRegistrationList.add(RegistrationScreenController());
  controllerForgotPasswordList.add(ForgotPasswordScreenController());
  controllerLoginViaMobileList.add(LoginViaMobileScreenController());
  controllerCreateNewPasswordList.add(CreateNewPasswordScreenController());
  controllerOTPVerificationList.add(OtpFieldController());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(
      () => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.themeMode,
          home: LoginScreen(formController: controllerList[0], identifier: 0)),
    );
  }
}
