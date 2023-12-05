import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/authentication_screen/otp_verification_screen.dart';
import 'package:searchable_menu/components/dt_button.dart';

import '../components/dt_color.dart';
import '../components/dt_textFormFiled.dart';

List<ForgotPasswordScreenController> controllerForgotPasswordList = [];

class ForgotPasswordScreen extends StatefulWidget {
  final int identifier;

  final ForgotPasswordScreenController formController;

  ForgotPasswordScreen(
      {required this.formController, required this.identifier});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    controllerForgotPasswordList.add(ForgotPasswordScreenController());

    widgetList.add(ForgotPasswordScreen(
        identifier: 0, formController: controllerForgotPasswordList[0]));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 214, left: 30, right: 14),
        child: SingleChildScrollView(
          child: Obx(
            () => FormBuilder(
              key: widget.formController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Align(
                    alignment: Alignment.center,
                      child: SizedBox(
                          width: 90,
                          height: 90,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF3BA3F8),
                            
                            child: SvgPicture.asset(
                              'assets/icons/forgotPassword.svg',
                              width: 44,
                              height: 44,


                            ),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xFF000000)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: 320,
                    height: 44,
                    child: Text(
                      'Enter the verified email address to change the\n '
                          '                                password',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF808080)),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTTextFormField(
                      attribute: 'Enter Full name_${widget.identifier}',
                      initialValue: widget.formController.formData[
                      'Enter your Email Address_${widget.identifier}'],

                      width: 320,
                      placeholder: 'Enter your Email Address',
                      hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Color(0xFF808080)),

                      borderColor: Color(0xFFC4C4C4),
                      fillColor: Colors.white,

                      prefixIcon: Icon(Icons.email_outlined,color: Color(0xFF303030),),
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
                    child: DTButton(
                      width: 320,
                      height: 50,
                      borderColor: Color(0xFF505050),
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPVerificationScreen(
                                  formController: controllerOTPVerificationList[0],
                                  identifier: 0)),
                        );
                      },
                      textColor: DTColor.white,
                      label: 'Verify Email Address',
                      textAlign: TextAlign.center,
                      textSize: 16,
                      textFont: FontWeight.w700,
                      borderRadius: 5,
                      buttonColor: Color(0xFF3BA3F8),
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

class ForgotPasswordScreenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var formData = <String, dynamic>{}.obs;

  updateFormData(String keyName, dynamic value) {
    formData[keyName] = value;
  }
}
