import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/components/dt_button.dart';
import '../components/dt_color.dart';
import '../components/dt_textFormFiled.dart';
import 'Login_Screen.dart';
import 'login_via_mobile_screen.dart';

List<RegistrationScreenController> controllerRegistrationList = [];

class RegistrationScreen extends StatefulWidget {
  final int identifier;

  final RegistrationScreenController formController;

  RegistrationScreen({required this.formController, required this.identifier});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<Widget> widgetList = [];

  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;

  @override
  void initState() {
    super.initState();
    controllerRegistrationList.add(RegistrationScreenController());
    // _passwordVisible1 = false;

    widgetList.add(RegistrationScreen(
        identifier: 0, formController: controllerRegistrationList[0]));
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
                        width: 62,
                        height: 62,
                        child: Image.asset('assets/icons/logo.png')),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 211,
                      height: 27,
                      child: Text(
                        'Register new account',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF000000)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTTextFormField(
                      placeholder: 'Enter full name',
                      attribute: 'Enter Full name_${widget.identifier}',
                      initialValue: widget.formController.formData[
                          'Enter your Email Address_${widget.identifier}'],
                      borderColor: Color(0xFFC4C4C4),
                      fillColor: Colors.white,
                      width: 320,
                      height: 50,
                      hintText: 'Enter full name',
                      hintStyle: TextStyle(
                        color: Color(0xFF808080),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xFF303030),
                      ),
                      keyboardType: TextInputType.name,
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
                      placeholder: 'Enter your Email Address',
                      attribute:
                          'Enter your Email Address_${widget.identifier}',
                      initialValue: widget.formController.formData[
                          'Enter your Email Address_${widget.identifier}'],
                      borderColor: Color(0xFFC4C4C4),
                      fillColor: Colors.white,
                      height: 50,
                      width: 320,
                      hintText: 'Enter your Email Address',
                      hintStyle: TextStyle(
                          color: Color(0xFF808080),
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Color(0xFF303030)),
                      keyboardType: TextInputType.visiblePassword,
                      isCurrency: true,
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
                      attribute: 'Enter your password_${widget.identifier}',
                      initialValue: widget.formController
                          .formData['Enter your password_${widget.identifier}'],
                      borderColor: Color(0xFFC4C4C4),
                      width: 320,
                      height: 50,
                      hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF808080)),
                      fillColor: Colors.white,
                      obscureText: !_passwordVisible1,
                      prefixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            'assets/icons/lock.svg',
                            color: Color(0xFF303030),
                          )),
                      suffixIcon: IconButton(
                        splashRadius: 2,
                        onPressed: () {
                          setState(() {
                            _passwordVisible1 = !_passwordVisible1;
                          });
                        },
                        icon: Icon(
                          _passwordVisible1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
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
                      attribute: 'Enter your password_${widget.identifier}',
                      initialValue: widget.formController
                          .formData['Enter your password_${widget.identifier}'],
                      borderColor: Color(0xFFC4C4C4),
                      // fillColor: Colors.transparent,
                      obscureText: !_passwordVisible2,
                      height: 50,
                      width: 320,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF808080)),
                      prefixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            'assets/icons/lock.svg',
                            color: Color(0xFF303030),
                          )),
                      suffixIcon: IconButton(
                        splashRadius: 2,
                        onPressed: () {
                          setState(() {
                            _passwordVisible2 = !_passwordVisible2;
                          });
                        },
                        icon: Icon(
                          _passwordVisible2
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      isCurrency: true,
                      isNumber: true,
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
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTButton(
                      width: 320,
                      height: 50,
                      borderColor: Color(0xFF505050),
                      onClick: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                  formController: controllerList[0],
                                  identifier: 0)),
                        );
                      },
                      textColor: DTColor.white,
                      textAlign: TextAlign.center,
                      textFont: FontWeight.w700,
                      textSize: 16,
                      label: 'Register your account',
                      borderRadius: 5,
                      buttonColor: Color(0xFF3BA3F8),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
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
                        borderRadius: 5,
                        height: 50,
                        width: 320,
                        borderColor: Color(0xFF505050),
                        label: 'Sign-in with google',
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            'assets/icons/gmail.svg',
                            height: 14,
                            width: 20,
                          ),
                        ),
                        textSize: 14,
                        textFont: FontWeight.w400,
                        isOutlined: true,
                        buttonColor: Color(0xFF3BA3F8),
                        textColor: Color(0xFF495057),
                        onClick: () {
                          for (var x in controllerRegistrationList) {
                            x.formKey.currentState?.reset();
                          }
                          setState(() {
                            controllerRegistrationList.clear();
                            widgetList.clear();
                            controllerRegistrationList
                                .add(RegistrationScreenController());
                            widgetList.add(RegistrationScreen(
                                identifier: 0,
                                formController: controllerRegistrationList[0]));
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTButton(
                        borderRadius: 5,
                        height: 50,
                        width: 320,
                        label: 'Sign-in with Mobile',
                        isOutlined: true,
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            'assets/icons/vector.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        textSize: 14,
                        textFont: FontWeight.w400,
                        textColor: Color(0xFF495057),
                        buttonColor: Color(0xFF3BA3F8),
                        borderColor: Color(0xFF505050),
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginViaMobileScreen(
                                    formController:
                                        controllerLoginViaMobileList[0],
                                    identifier: 0)),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  SizedBox(
                    height: 19,
                    width: 316,
                    child: Row(
                      children: [
                        Text(
                          'Already have an account?',
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
                                  builder: (context) => LoginScreen(
                                      formController: controllerList[0],
                                      identifier: 0)),
                            );
                          },
                          child: Text(
                            ' Login to your Account',
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

class RegistrationScreenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var formData = <String, dynamic>{}.obs;

  updateFormData(String keyName, dynamic value) {
    formData[keyName] = value;
  }
}
