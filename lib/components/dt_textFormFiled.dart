import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DTTextFormField extends StatefulWidget {
  final ValueChanged<dynamic> onChange;
  String? attribute;
  Key? key;
  final String? Function(String?)? validator;
  final dynamic initialValue;
  final Color fillColor;
  final String placeholder;
  final String hintText;
  final bool readOnly;
  String? prefixText;
  final double width;
  final double height;
  final bool isCurrency;
  final Color? textColor;
  final TextInputType keyboardType;
  List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  Widget? suffixIcon;
  Widget? prefixIcon;
  final bool obscureText;
  int? maxLength;
  final bool isNumber;
  String? errorMessage;
  EdgeInsets? contentPadding;
  final bool allowClear;
  Color? borderColor;
  double? borderWidth;
  TextStyle? hintStyle;
  TextStyle? textStyle;

  DTTextFormField(
      {required this.onChange,
      this.key,
      this.initialValue,
      this.fillColor = Colors.white,
      this.textColor,
      this.placeholder = "",
      this.isNumber = false,
      this.isCurrency = false,
      this.hintText = "",
      this.readOnly = false,
      this.maxLength,
      this.errorMessage,
      this.obscureText = false,
      this.prefixText,
      this.keyboardType = TextInputType.name,
      this.suffixIcon,
      this.prefixIcon,
      this.inputFormatters,
      this.width = double.infinity,
      this.height = double.infinity,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction = TextInputAction.next,
      this.attribute,
      this.validator,
      this.textStyle,
      this.allowClear = true,
      this.contentPadding,
      this.borderColor,
      this.borderWidth = 0,
      this.hintStyle});

  @override
  _DTTextFormFieldState createState() => _DTTextFormFieldState();
}

class _DTTextFormFieldState extends State<DTTextFormField> {
  Key k = new GlobalKey();

  TextEditingController? textCtrl;

  @override
  Widget build(BuildContext context) {
    EdgeInsets? textContentPadding = widget.contentPadding;
    textContentPadding ??= const EdgeInsets.all(11);
    return FormBuilderField(
        key: widget.key ??
            Key("${widget.attribute ?? 'ss'} ${widget.placeholder} as"),
        name: widget.attribute!,
        validator: widget.validator,
        builder: (FormFieldState<String> state) {
          if (state.value != widget.initialValue &&
              (null != widget.initialValue)) {
            Future.delayed(Duration(milliseconds: 100), () {
              state.didChange(widget.initialValue);
              textCtrl = TextEditingController(text: widget.initialValue);
            });
          }
          return Container(
            width: widget.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                  key: k,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText,
                  onEditingComplete: () {},
                  controller: textCtrl,
                   style: TextStyle(color: Colors.black),
                  maxLength: widget.maxLength,
                  textCapitalization: widget.textCapitalization,
                  textInputAction: widget.textInputAction,
                  readOnly: widget.readOnly,
                  decoration: InputDecoration(
                    contentPadding: textContentPadding,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.borderColor ?? Colors.transparent,
                          width: widget.borderWidth ?? 0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.borderColor ?? Colors.transparent,
                          width: widget.borderWidth ?? 0),
                    ),
                    filled: true,


                    fillColor: widget.fillColor,

                    suffixIcon: (widget.allowClear)
                        ? ((widget.initialValue?.length ?? 0) > 0)
                            ? InkWell(
                                onTap: () {
                                  state.didChange("");
                                  widget.onChange("");
                                  textCtrl = TextEditingController(text: "");
                                },
                                child: const Icon(
                                  FontAwesomeIcons.timesCircle,
                                  color: Colors.black38,
                                ),
                              )
                            : widget.suffixIcon
                        : widget.suffixIcon,
                    prefixIcon: (widget.allowClear) ? ((widget.initialValue?.length ?? 0) > 0)
                        ? InkWell(
                      onTap: () {
                        state.didChange("");
                        widget.onChange("");
                        textCtrl = TextEditingController(text: "");
                      },
                      child: const Icon(
                        FontAwesomeIcons.timesCircle,
                        color: Colors.black38,
                      ),
                    )
                        : widget.prefixIcon:widget.prefixIcon,
                    prefixText: widget.prefixText,
                    counterText: "",
                    hintText: widget.placeholder,
                    hintStyle: widget.hintStyle,
                    labelStyle: const TextStyle(height: 1,color: Colors.red),
                  ),
                  onChanged: (val) {
                    if (widget.isCurrency) {
                      // val = maskFormatter.getUnmaskedDouble().toString();
                    }

                    if (null != state) {
                      state.didChange(val);
                    }
                    if (widget.onChange != null) {
                      widget.onChange(val);
                    }
                    // textCtrl.text = v;
                  },
                ),
                if ((null != state && state.hasError) ||
                    (null != widget.errorMessage))
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      (null != widget.errorMessage)
                          ? widget.errorMessage!
                          : state.errorText ?? "",
                      style: const TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  )
              ],
            ),
          );
        });
  }
}
