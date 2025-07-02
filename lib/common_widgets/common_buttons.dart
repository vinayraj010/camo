import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final double? width;
  final double? padding;
  final double? leftMargin;
  final double? topMargin;
  final double? rightMargin;
  final double? bottomMargin;
  final double? buttonRadius;
  final Color? btnColor;
  final Color? borderColor;
  final String? textBtn;
  final FontWeight? textFontWeight;
  final double? buttonFontSize;
  final Color? blackText;

  const CommonButtonWidget({
    super.key,
    this.width,
    this.padding,
    this.leftMargin,
    this.topMargin,
    this.rightMargin,
    this.bottomMargin,
    this.buttonRadius,
    this.btnColor,
    this.borderColor,
    this.textBtn,
    this.textFontWeight,
    this.buttonFontSize,
    this.blackText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(padding ?? 0.0),
      margin: EdgeInsets.fromLTRB(
        leftMargin ?? 0,
        topMargin ?? 0,
        rightMargin ?? 0,
        bottomMargin ?? 0,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(buttonRadius ?? 0.0)),
        border: Border.all(
          color: Colors.transparent,
        ),
        color: btnColor,
      ),
      child: Text(
        textBtn ?? "",
      ),
    );
  }
}
