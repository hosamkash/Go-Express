import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import '../Resources/valuesManager.dart';

class ctr_ElevatedButtonIcon extends StatefulWidget {
  final String? labelText;

   final double? fontSize;
  final Icon? icon;
  final Function()? onPressed;

  ctr_ElevatedButtonIcon({
    Key? Key,
    this.labelText,
    this.icon,
     this.fontSize,
    this.onPressed,
  }) : super(key: Key);

  @override
  State<ctr_ElevatedButtonIcon> createState() => _ctr_ElevatedButtonIconState();
}

class _ctr_ElevatedButtonIconState extends State<ctr_ElevatedButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        label: Text(
          widget.labelText ?? '',

        ),
        icon: widget.icon,
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          elevation: valuesManager.numberDouble.n03,
          backgroundColor: Colors.white,

        ));
  }
}
