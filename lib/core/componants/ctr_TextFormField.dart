import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 import '../Resources/valuesManager.dart';

class ctr_TextFormField extends StatefulWidget {
  late TextAlign? TextAlignValue;
  late Widget? SufixIcon;
  late Widget? sufix;
  late bool IsobscureText;
  late bool Isenabled = true;
  late InputBorder border = OutlineInputBorder();
  late TextEditingController? Controller;
  late TextInputType TextType;
  late TextStyle? textStyle;
  late String Lable;
  late TextStyle? labelStyle;
  late Widget? PrefixIcon;
  late EdgeInsets? padding;

  // double? height;
  late bool? autoSelectData;
  late bool? readOnly;
  late bool? isdigitsOnly;
  late bool? useAsBarcodeControle;
  late int? maxLines;
  late int? minLines;
  late FocusNode? focusNode;

  late String? Function(String?)? OnValidate;
  late String? Function(String?)? OnChanged;
  late String? Function(String?)? OnSubmitted;
  late String? Function()? OnTap;

  ctr_TextFormField({
    Key? Key,
    this.TextAlignValue,
    this.SufixIcon,
    this.sufix,
    this.IsobscureText = false,
    this.Controller,
    this.Isenabled = true,
    this.border = const OutlineInputBorder(),
    this.TextType = TextInputType.text,
    this.textStyle,
    this.Lable = '',
    this.labelStyle,
    this.PrefixIcon,
    this.padding = const EdgeInsets.all(0),
    // this.height = 50,
    this.autoSelectData,
    this.readOnly,
    this.isdigitsOnly = false,
    this.useAsBarcodeControle,
    this.maxLines,
    this.minLines,
    this.focusNode,
    this.OnValidate,
    this.OnChanged,
    this.OnSubmitted,
    this.OnTap,
  }) : super(key: Key);

  @override
  State<ctr_TextFormField> createState() => _ctr_TextFormFieldState();
}

class _ctr_TextFormFieldState extends State<ctr_TextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          EdgeInsets.only(
              right: valuesManager.numberDouble.n05,
              left: valuesManager.numberDouble.n05,
              top: valuesManager.numberDouble.n05,
              bottom: valuesManager.numberDouble.n05),
      // height: widget.height ,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.Controller,
              enabled: widget.Isenabled,
              keyboardType: widget.TextType,
              textDirection: TextDirection.ltr,
              textAlign: widget.TextAlignValue ?? TextAlign.center,
              style: widget.textStyle ,
              obscureText: widget.IsobscureText,
              readOnly: widget.readOnly ?? false,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              focusNode: widget.focusNode,
              inputFormatters: widget.isdigitsOnly != null && widget.isdigitsOnly! ? [FilteringTextInputFormatter.digitsOnly] : [],
              decoration: InputDecoration(
                label: Text(widget.Lable),
                labelStyle: widget.labelStyle  ,
                prefixIcon: widget.PrefixIcon,
                suffixIcon: widget.SufixIcon,
                fillColor: Colors.white,
                filled: true,
                suffix: widget.sufix,
                border: widget.border,
                contentPadding: EdgeInsets.symmetric(vertical: 0.3, horizontal: 2), // حشوة داخلية ثابتة
              ),
              validator: widget.OnValidate,
              onChanged: widget.OnChanged,
              onTap: () {
                widget.OnTap != null ? widget.OnTap!() : null;
              },
              onFieldSubmitted: widget.OnSubmitted,
            ),
          ),
          if (widget.useAsBarcodeControle ?? false) IconButton(onPressed: () async {}, icon: const Icon(Icons.qr_code)),
        ],
      ),
    );
  }
}
