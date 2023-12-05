import 'package:flutter/material.dart';

import 'dt_color.dart';

class DTButton extends StatelessWidget {
  String? label;
  Function onClick;
  final bool disabled;
  final bool loading;
  final double borderRadius;
  Widget? prefixIcon;
  final double height;
  final Color buttonColor;
  final Color textColor;
  FontWeight? textFont;
  final double width;
  final Widget? icon;
  final bool isOutlined;
  final Color borderColor;
  TextAlign? textAlign;
  final double? textSize;



  Gradient? gradient;

  DTButton(
      {Key? key,
      this.label,
      required this.onClick,
      this.textAlign,
      this.icon,
      this.textSize,

        this.prefixIcon,
      this.disabled = false,
      this.loading = false,
      this.width = double.infinity,
      this.borderRadius = 10,
      this.height = 60,
      this.buttonColor = Colors.blue,
      this.textColor = Colors.white,
       this.textFont,
      this.gradient,
       required this.borderColor,
      this.isOutlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (disabled || loading) ? 0.6 : 1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: gradient,
            color: isOutlined ? Colors.transparent : buttonColor,
            border:
                isOutlined ? Border.all(width: 2, color: borderColor) : null),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (disabled || loading)
                ? null
                : () {
                    if (null != this.onClick) {
                      this.onClick();
                    }
                  },
            child: Container(
                alignment: Alignment.center,
                height: height,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (null != this.icon)
                      Padding(
                          padding: EdgeInsets.only(left: 82, right: 5),
                          child: icon),
                    Expanded(
                      child: Text(
                        this.label ?? "Button",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: textFont,
                          fontSize: textSize,
                        ),
                        textAlign: textAlign,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class DTRestButton extends StatelessWidget {
  final String? label;
  final Function onClick;
  final bool? disabled;
  final bool? loading;
  final double borderRadius;
  final double height;
  final Color buttonColor;
  final Color textColor;
  final double width;
  Gradient? gradient;
  final Widget restChild;

  DTRestButton(
      {Key? key,
      this.label,
      required this.onClick,
      this.disabled,
      this.loading,
      this.width = double.infinity,
      this.borderRadius = 10,
      this.height = 42,
      this.buttonColor = DTColor.primary,
      this.textColor = DTColor.white,
      this.gradient,
      required this.restChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: buttonColor,
        gradient: gradient,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              if (null != this.onClick) {
                this.onClick();
              }
            },
            child: Center(child: restChild)),
      ),
    );
  }
}

class DTIconButton extends StatelessWidget {
  final String? label;
  final Function onClick;
  final bool? disabled;
  final bool? loading;
  final double borderRadius;
  final double height;
  final Color buttonColor;
  final Color? iconColor;
  final Widget? icon;
  final double width;

  const DTIconButton(
      {Key? key,
      this.label,
      required this.onClick,
      this.icon,
      this.disabled,
      this.loading,
      this.width = double.infinity,
      this.borderRadius = 10,
      this.height = 42,
        this.buttonColor = DTColor.primary,

      this.iconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (null != onClick) {
            onClick();

          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: this.icon ??
              SizedBox(
                height: 0,
                width: 0,
              ),
        ),
      ),
    ));
  }
}

class DTOutlinedButton extends StatelessWidget {
  final String? label;
  final Function onClick;
  final bool? disabled;
  final bool? loading;
  final double borderRadius;
  final double height;
  final Color buttonColor;
  final Color iconColor;
  final Widget? icon;
  final double width;
  final Color textColor;

  const DTOutlinedButton(
      {Key? key,
      this.label,
      required this.onClick,
      this.icon,
      this.disabled,
      this.loading,
      this.width = double.infinity,
      this.borderRadius = 10,
      this.height = 42,
      this.buttonColor = Colors.transparent,
      this.textColor = Colors.white,
      this.iconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: buttonColor,
            border: Border.all(width: 1)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (null != onClick) {
                onClick();
              }
            },
            child: Container(
                width: width,
                height: height,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    this.icon ??
                        SizedBox(
                          height: 0,
                          width: 0,
                        ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          this.label ?? "Button",
                          // style: header4.copyWith(color: textColor),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
