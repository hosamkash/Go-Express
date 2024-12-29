import 'package:flutter/material.dart';
import '../Resources/valuesManager.dart';

class ctr_TextHeaderPage extends StatelessWidget {
  // late final Color? color;
  late final BoxBorder? border;
  final TextEditingController? Controller ;
  late final String text;
  late final TextStyle? style;
  late final BorderRadiusGeometry? borderRadius;
  late final EdgeInsetsGeometry? padding;

  ctr_TextHeaderPage({
    Key? Key,
    this.Controller,
    this.style,
    this.borderRadius,
    this.border,
    this.text = '',
    this.padding,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(left: valuesManager.numberDouble.n05, right: valuesManager.numberDouble.n05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        border: border,
      ),
      child: Row(
        children: [

          Text(
            (Controller != null ? Controller!.text : text) ,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
            style: style ?? TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
