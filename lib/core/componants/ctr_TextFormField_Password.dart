import 'package:flutter/material.dart';
import '../Resources/valuesManager.dart';

class ctr_TextFormField_Password extends StatefulWidget {
    bool? IsobscureText ;
  late final bool IsArabicLanguage;
  late final TextEditingController? Controller;
  late final TextInputType TextType;
  late final String Lable;
  late final Icon? PrefixIcon;
  late final EdgeInsets? padding;
  late final String? Function(String?)? OnValidate;
  late final String? Function(String?)? OnChanged;
  late final String? Function()? OnTap;
  late final String? Function(String?)? OnFieldSubmitted;

  ctr_TextFormField_Password({
    Key? Key,
    this.IsobscureText = false ,
    this.IsArabicLanguage = true,
    this.Controller,
    this.TextType = TextInputType.visiblePassword,
    this.Lable = '',
    this.PrefixIcon,
    this.OnValidate,
    this.OnChanged,
    this.OnTap,
    this.padding = const EdgeInsets.all(0),
    this.OnFieldSubmitted,
  }) : super(key: Key);

  @override
  State<ctr_TextFormField_Password> createState() =>
      _ctr_TextFormField_PasswordState();
}

class _ctr_TextFormField_PasswordState
    extends State<ctr_TextFormField_Password> {
  late GestureDetector gesture_Detector;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: widget.padding ?? EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05, top: valuesManager.numberDouble.n05, bottom: valuesManager.numberDouble.n05),
      // height: valuesManager.numberDouble.n45,
      child: TextFormField(
        controller: widget.Controller,
        keyboardType: widget.TextType,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
        obscureText: widget.IsobscureText! ,

        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: Text(widget.Lable),
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 0.3  ,horizontal: 2), // حشوة داخلية ثابتة
          prefixIcon: widget.IsArabicLanguage ? buildSuffixOrPrefixIcon() : widget.PrefixIcon,
          suffixIcon:widget.IsArabicLanguage ? widget.PrefixIcon : buildSuffixOrPrefixIcon(),
        ),
        validator: widget.OnValidate,
        onChanged: widget.OnChanged,
        // onTap: widget.OnTap,
        onFieldSubmitted: widget.OnFieldSubmitted,
      ),
    );
  }

  GestureDetector buildSuffixOrPrefixIcon(){
  return  GestureDetector(
      onLongPress: () {
        setState(() {
          widget.IsobscureText = false;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          widget.IsobscureText = true;
        });
      },
      child: IconButton(
        icon: const Icon(Icons.remove_red_eye),
        onPressed: () {},
      ),
    );
  }


}
