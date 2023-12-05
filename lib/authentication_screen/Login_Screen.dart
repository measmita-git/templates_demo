import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/authentication_screen/forgot_password_screen.dart';
import 'package:searchable_menu/authentication_screen/login_via_mobile_screen.dart';
import 'package:searchable_menu/authentication_screen/registration_screen.dart';
import 'package:searchable_menu/components/dt_button.dart';
import '../bottom_navigation/floating_action_botton.dart';
import '../components/dt_textFormFiled.dart';

List<LoginScreenController> controllerList = [];

class LoginScreen extends StatefulWidget {
  final int identifier;

  final LoginScreenController formController;

  LoginScreen({required this.formController, required this.identifier});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Widget> widgetList = [];
  int? selectedOption;

  bool _passwordVisible = false;
  bool isCheck = false;

  @override
  void initState() {
    super.initState();
    controllerList.add(LoginScreenController());

    widgetList
        .add(LoginScreen(identifier: 0, formController: controllerList[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 75, left: 30, right: 14),
        child: SingleChildScrollView(
          child: Obx(
            () => FormBuilder(
              key: widget.formController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 62,
                      width: 62,
                      child: Image.asset(
                        'assets/icons/logo.png',

                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 265,
                      height: 27,
                      child: Text(
                        'Welcome to company name',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF000000)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 66,
                      width: 320,
                      child: Text(
                        'Flexible easy to access learning opportunities\ncan bring a significant change in how individuals\nprefer to learn! ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF808080)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTTextFormField(
                      placeholder: 'Enter your Email Address',
                      attribute:
                          'Enter your Email Address_${widget.identifier}',
                      initialValue: widget.formController.formData[
                          'Enter your Email Address_${widget.identifier}'],
                      borderColor: Color(0xFFC4C4C4),
                      fillColor: Colors.white,
                      width: 320,
                      height: 50,
                      textColor: Colors.black,
                      hintStyle: TextStyle(
                          color: Color(0xFFC4C4C4),
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xFF303030),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      isCurrency: true,
                      isNumber: true,
                      allowClear: false,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      onChange: (val) {
                        widget.formController.updateFormData(
                            'total_amount_${widget.identifier}', val);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTTextFormField(
                      placeholder: 'Enter your password',
                      obscureText: !_passwordVisible,

                      attribute: 'share_quantity_${widget.identifier}',
                      initialValue: widget.formController
                          .formData['share_quantity_${widget.identifier}'],
                      borderColor: Color(0xFFC4C4C4),
                      hintStyle: TextStyle(
                          color: Color(0xFFC4C4C4),
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                      fillColor: Colors.white,
                      prefixIcon: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(
                          'assets/icons/lock.svg',
                          color: Color(0xFF303030),

                        ),
                      ),
                      width: 320,
                      height: 50,
                      suffixIcon: IconButton(
                        splashRadius: 2,
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      isCurrency: true,
                      allowClear: true,

                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      onChange: (val) {
                        widget.formController.updateFormData(
                            'total_amount_${widget.identifier}', val);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            child: Checkbox(
                          activeColor: Colors.red,
                          checkColor: Colors.white,
                          value: isCheck,
                          side: BorderSide(
                              color: Color(0xFF505050),
                              width: 1.0,
                              style: BorderStyle.solid),
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue!;
                            });
                          },
                        )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      const SizedBox(
                        width: 87,
                        height: 18,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Text(
                            'Remember me',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF505050)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 72,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(
                                  formController:
                                      controllerForgotPasswordList[0],
                                  identifier: 0),
                            ),
                          );
                        },
                        child: const SizedBox(
                          width: 117,
                          height: 18,
                          child: Text(
                            'Forgot Passwords?',
                            style: TextStyle(
                                color: Color(0xFF3BA3F8),
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTButton(
                      width: 320,
                      height: 50,
                      borderColor: Color(0xFF505050),
                      onClick: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationTabBar(),
                          ),
                              (route) => false,
                        );

                      },
                      textColor: Color(0xFFFFFFFF),
                      textFont: FontWeight.w700,
                      textSize: 16,
                      textAlign: TextAlign.center,
                      label: 'Login to your account',
                      borderRadius: 5,
                      buttonColor: Color(0xFF3BA3F8),
                    ),
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  const SizedBox(
                      height: 22,
                      width: 100,
                      child: Text(
                        'Or Login with',
                        style: TextStyle(
                            color: Color(
                              0xFF505050,
                            ),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTButton(
                      width: 320,
                      height: 50,
                      borderColor: Color(0xFF505050),
                      isOutlined: true,
                      onClick: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed('/');
                      },
                      textColor: Color(0xFF495057),
                      icon: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset('assets/icons/gmail.svg'),
                      ),
                      textFont: FontWeight.w400,
                      textSize: 14,
                      label: 'Sign-in with Google',
                      borderRadius: 5,
                      buttonColor: Color(0xFF3BA3F8),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTButton(
                      width: 320,
                      height: 50,
                      borderColor: Color(0xFF505050),
                      isOutlined: true,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginViaMobileScreen(
                                  formController:
                                      controllerLoginViaMobileList[0],
                                  identifier: 0)),
                        );
                      },
                      textColor: Color(0xFF495057),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset('assets/icons/vector.svg'),
                      ),
                      textFont: FontWeight.w400,
                      textSize: 14,
                      label: 'Sign-in with mobile',
                      borderRadius: 5,
                      buttonColor: Color(0xFF3BA3F8),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  SizedBox(
                    height: 19,
                    width: 289,
                    child: Row(
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen(
                                      formController:
                                          controllerRegistrationList[0],
                                      identifier: 0)),
                            );
                          },
                          child: Text(
                            ' Create new account',
                            style: TextStyle(
                                color: Color(0xFF3BA3F8),
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var formData = <String, dynamic>{}.obs;

  updateFormData(String keyName, dynamic value) {
    formData[keyName] = value;
  }
}
