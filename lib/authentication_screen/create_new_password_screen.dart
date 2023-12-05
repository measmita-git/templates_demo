import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:searchable_menu/authentication_screen/Login_Screen.dart';
import 'package:searchable_menu/components/dt_textFormFiled.dart';
import '../components/dt_button.dart';
import '../components/dt_color.dart';

List<CreateNewPasswordScreenController> controllerCreateNewPasswordList = [];

class CreateNewPasswordScreen extends StatefulWidget {

  final int identifier;
  final CreateNewPasswordScreenController formController;



  CreateNewPasswordScreen({required this.identifier,required this.formController});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  List<Widget> widgetList = [];
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;

  @override
  void initState() {
    super.initState();
    controllerCreateNewPasswordList.add(CreateNewPasswordScreenController());
    widgetList.add(CreateNewPasswordScreen(
        identifier: 0, formController: controllerCreateNewPasswordList[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(top: 166),
        child: SingleChildScrollView(
          child: Obx(
            () => FormBuilder(
              key: widget.formController.formKey,
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
                                'assets/icons/create_password.svg',
                                height: 44,
                                width: 44,
                              )))),
                  SizedBox(height: 40,),
                  const SizedBox(
                    width: 189,
                    height: 25,
                    child: Text(
                      'Create New Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF505050),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  const SizedBox(
                    width: 320,
                    height: 44,
                    child: Text(
                      'Create your new password by entering password\n                       and confirm password',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  DTTextFormField(
                    attribute: 'Enter Full name_${widget.identifier}',
                    initialValue: widget.formController.formData[
                    'Enter your Email Address_${widget.identifier}'],
                    width: 320,

                    placeholder: 'Enter your password',
                    hintStyle: TextStyle(color: Color(0xFF808080),fontSize: 13,fontWeight: FontWeight.w400),
                    obscureText: !_passwordVisible1,
                    borderColor: Color(0xFFC4C4C4),
                    fillColor: Colors.white,
                    prefixIcon: Transform.scale(scale:0.5,child: SvgPicture.asset('assets/icons/lock.svg',color: Color(0xFF303030))),
                    suffixIcon: IconButton(
                      splashRadius: 2,
                      onPressed: () {
                        setState(() {
                          _passwordVisible1 = !_passwordVisible1;
                        });
                      },
                      icon: Icon(
                        _passwordVisible1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                  const SizedBox(height: 20,),
                  DTTextFormField(
                    attribute: 'Enter Full name_${widget.identifier}',
                    initialValue: widget.formController.formData[
                    'Enter your Email Address_${widget.identifier}'],
                    width: 320,
                    placeholder: 'Enter your password',
                    hintStyle: TextStyle(color: Color(0xFF808080),fontWeight: FontWeight.w400,fontSize: 13),
                    obscureText: !_passwordVisible2,
                    borderColor: Color(0xFFC4C4C4),
                    fillColor: Colors.white,
                    prefixIcon: Transform.scale(scale:0.5,child: SvgPicture.asset('assets/icons/lock.svg',color: Color(0xFF303030),)),
                    suffixIcon: IconButton(
                      splashRadius: 2,
                      onPressed: () {
                        setState(() {
                          _passwordVisible2 = !_passwordVisible2;
                        });
                      },
                      icon: Icon(
                        _passwordVisible2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                  SizedBox(height: 20,),
                  DTButton(
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
                    label: 'Verify',
                    textAlign: TextAlign.center,
                    textSize: 16,
                    textFont: FontWeight.w700,
                    borderRadius: 5,
                    buttonColor: Color(0xFF3BA3F8),

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

class CreateNewPasswordScreenController extends GetxController{
  final formKey = GlobalKey<FormBuilderState>();
  var formData = <String,dynamic>{}.obs;

  updateFormData(String keyName, dynamic value){
    formData[keyName] = value;
  }

}