import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:searchable_menu/authentication_screen/create_new_password_screen.dart';
import 'package:searchable_menu/components/dt_textFormFiled.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../components/dt_button.dart';
import '../components/dt_color.dart';

List<OtpFieldController> controllerOTPVerificationList = [];

class OTPVerificationScreen extends StatefulWidget {
  final int identifier;
  final OtpFieldController formController;

  OTPVerificationScreen(
      {required this.identifier, required this.formController});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  List<Widget> widgetList = [];

  OtpFieldController otpController = OtpFieldController();
  OtpTimerButtonController controller = OtpTimerButtonController();

  @override
  void initState() {
    super.initState();
    controllerOTPVerificationList.add(OtpFieldController());
    widgetList.add(OTPVerificationScreen(
        identifier: 0, formController: controllerOTPVerificationList[0]));
  }

  _requestOtp() {
    controller.loading();
    Future.delayed(Duration(seconds: 2), () {
      controller.startTimer();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(top: 166),
        child: SingleChildScrollView(
          child: Column(
            children: [
            Align(
            alignment: Alignment.center,
                child: SizedBox(
                    height: 90,
                    width: 90,
                    child: CircleAvatar(
                        backgroundColor: Color(0xFF3BA3F8),
                        child: SvgPicture.asset(
                          'assets/icons/otp.svg',
                          height: 44,
                          width: 44,
                        ))),
              ),
              SizedBox(height: 40,),
              const SizedBox(
                  width: 157,
                  height: 27,
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF505050),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  width: 320,
                  height: 44,
                child: Text(
                  'Enter the 6 digit verification code received on\n                        your mobile device',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF808080),
                  ),
                ),
              ),
              const SizedBox(
                  height: 56,
                ),
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width*0.9,
                  outlineBorderRadius: 5,
                  fieldWidth: 45,
                  otpFieldStyle: OtpFieldStyle(borderColor: Color(0xFFC4C4C4)),
                  // otpFieldStyle: ,
                  style: TextStyle(fontSize: 17,color: Color(0xFF808080)),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
                const SizedBox(height: 13,),

                OtpTimerButton(
                  controller: controller,
                  onPressed: () => _requestOtp(),
                  text: Text('Code valid upto :',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Color(0xFF3BA3F8)),),
                  duration: 178,
                  buttonType: ButtonType.text_button,
              ),
               SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 19,right: 19),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      SizedBox(
                        width: 125,
                        height: 19,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            ' Didn’t receive OTP?',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(
                                0xFF505050,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 115,),

                      SizedBox(
                        width: 82,
                        height: 19,
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(
                              0xFF3BA3F8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                DTButton(
                  width: 320,
                  height: 50,
                  borderColor: Color(0xFF505050),
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateNewPasswordScreen(
                              formController: controllerCreateNewPasswordList[0],
                              identifier: 0)),
                    );
                  },
                  textColor: DTColor.white,
                  label: 'Verify',
                  textFont: FontWeight.w700,
                  textSize: 16,
                  textAlign: TextAlign.center,
                  borderRadius: 5,
                  buttonColor: Color(0xFF3BA3F8),
                ),
              ],
            ),
        ),
        ),
      );
  }
}

class OtpFieldController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var formData = <String, dynamic>{}.obs;

  updateFormData(String keyName, dynamic value) {
    formData[keyName] = value;
  }
}
