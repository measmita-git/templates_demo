import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/components/dt_button.dart';

import '../components/dt_color.dart';
import '../components/dt_textFormFiled.dart';
import 'otp_verification_screen.dart';

List<LoginViaMobileScreenController> controllerLoginViaMobileList = [];

class LoginViaMobileScreen extends StatefulWidget {
  final int identifier;

  final LoginViaMobileScreenController formController;

  LoginViaMobileScreen(
      {required this.formController, required this.identifier});

  @override
  State<LoginViaMobileScreen> createState() => _LoginViaMobileScreenState();
}

class _LoginViaMobileScreenState extends State<LoginViaMobileScreen> {
  List<Widget> widgetList = [];

  Widget defaultImage = Image.asset('assets/icons/flag.png',height: 32,width: 32,);
  Image? selectedImage;

  @override
  void initState() {
    super.initState();
    controllerLoginViaMobileList.add(LoginViaMobileScreenController());

    widgetList.add(LoginViaMobileScreen(
        identifier: 0, formController: controllerLoginViaMobileList[0]));
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 214, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Obx(
                () => FormBuilder(
              key: widget.formController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height:62,width:62,child: Image.asset('assets/icons/logo.png',))
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 155,
                      height: 27,
                      child: Text(
                        'Login via Mobile',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF000000
                            )),
                      ),
                    ),

                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 66,
                      width: 320,
                      child: Text(
                        'Flexible easy to access learning opportunities\ncan bring a significant change in how individuals prefer to learn! ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF808080

                            )),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTTextFormField(
                      attribute: 'Enter your phone number_${widget.identifier}',
                      initialValue: widget.formController.formData[
                      'Enter your phone number_${widget.identifier}'],
                      width: 320,
                      height: 50,
                      placeholder: 'Enter your phone number',

                      hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFFA9A9A9)),
                      borderColor: Color(0xFFC4C4C4),
                      fillColor: Colors.white,

                      prefixIcon: Padding(
                        padding:  EdgeInsets.only(left: 20.0),
                        child: DropdownButton<Widget>(
                          elevation: 2,
                          // iconSize: 20,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Icon(FontAwesomeIcons.angleDown,size: 20,color: Color(0xFF808080),),
                          ),
                          underline:DropdownButtonHideUnderline(child: Text(''),),
                          value: selectedImage ?? defaultImage,
                          items: [
                            DropdownMenuItem<Widget>(
                              value: defaultImage,
                              child: defaultImage,
                            ),
                          ],
                          onChanged: (Widget? value) {
                            selectedImage = value as Image?;
                          },
                        ),
                      ),
                      keyboardType: TextInputType.phone,
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
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DTButton(
                      borderColor: Color(0xFF505050),
                      width: 320,
                      height: 50,
                      onClick: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPVerificationScreen(
                                  formController: controllerOTPVerificationList[0],
                                  identifier: 0)),
                        );
                      },
                      textColor: DTColor.white,
                      textAlign: TextAlign.center,
                      label: 'Continue',
                      textFont: FontWeight.w700,
                      textSize: 16,
                      borderRadius: 5,
                      buttonColor: Color(0xFF3BA3F8),



                    ),
                  ),
                  SizedBox(height: 22,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: 320,
                        height: 44,
                        child: Text(
                          'By tapping continue, you are indicating that you\nagree to the Privacy Policy and Terms of Usage.',
                          style:
                              TextStyle(fontSize: 13, fontWeight: FontWeight.w500,color: Color(0xFF808080)),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginViaMobileScreenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var formData = <String, dynamic>{}.obs;

  updateFormData(String keyName, dynamic value) {
    formData[keyName] = value;
  }
}
