import 'package:flutter/material.dart';
 import '../Resources/valuesManager.dart';
import '../SharedFunctions/sharedFunctions_Dates.dart';
import '../TextManager/generalText.dart';

class ctr_Date extends StatelessWidget {
  // DateTime selectedDate = DateTime.now();
  late BuildContext currenrContext ;
  late final bool isEnabled;
  late final bool isReadOnly;
  late final TextEditingController? dtController;
  late final String text;
  late final TextStyle? textStyle;
  late final TextAlign? TextAlignValue;
  late final TextStyle? labelStyle;
  late final bool isOpenSelectorOnTap;
  late final bool isVisibleSearchIcon;
  late final Icon? prefixIcon;
  // double? height;
  // late DateTime? defaultValue;
  late final EdgeInsets? padding;
  late final String? Function(String?)? OnValidate;
  late final String? Function(String?)? OnChanged;
  late final String? Function(String?)? OnSubmitted;

  // late String? Function()? OnTap;

  ctr_Date({
    Key? Key,
    // this.currenrContext ,
    this.dtController ,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.text = '',
    this.textStyle,
    this.TextAlignValue,
    this.labelStyle,
    this.isOpenSelectorOnTap = false,
    this.isVisibleSearchIcon = false,
    this.prefixIcon,
    // this.defaultValue,
    this.padding = const EdgeInsets.all(0),
    // this.height,
    this.OnValidate,
    this.OnChanged,
    this.OnSubmitted,
    // this.OnTap,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    currenrContext = context;

    // if (dtController != null && dtController!.text.isNotEmpty && defaultValue != null) {
    //   dtController!.text = sharedFunctions_Dates.convertToShortDateString(defaultValue);
    // } else
    //   sharedFunctions_Dates.convertToShortDateString(DateTime.now());

    return Container(
      padding: padding ?? EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05, top: valuesManager.numberDouble.n05, bottom: valuesManager.numberDouble.n05),
      // padding: EdgeInsets.symmetric(vertical: 0.3),
      // height: height ?? 45,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: dtController,
              enabled: isEnabled,
              keyboardType: TextInputType.datetime,
              textDirection: TextDirection.ltr,
              textAlign: TextAlignValue ?? TextAlign.center,
              readOnly: isReadOnly,
              style: textStyle ?? TextStyle(fontSize: 17, color: Colors.black),
              decoration: InputDecoration(
                label: Text(text),
                labelStyle: labelStyle ?? TextStyle(fontSize: 17, color: Colors.grey),
                prefixIcon: prefixIcon,
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0.3), // حشوة داخلية ثابتة
                suffixIcon: SizedBox(
                  height: valuesManager.numberDouble.n15,
                  child: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        dtController!.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              validator: OnValidate,
              onChanged: OnChanged,
              onTap: isOpenSelectorOnTap ? openDatePicker : null,
              onFieldSubmitted: OnSubmitted,
            ),
          ),
          if (isVisibleSearchIcon)
            IconButton(
              onPressed: () {},
              icon: IconButton(
                padding: EdgeInsets.zero,
                onPressed: openDatePicker,
                icon: const Icon(Icons.search),
              ),
            ),
        ],
      ),
    );
  }

  void openDatePicker() async {
    DateTime currentDate = DateTime.now();

    // if (dtController != null && dtController!.text.isNotEmpty) {
    //   currentDate = sharedFunctions_Dates.convertDateStringToDatetime(dtController?.text)!;
    // }

    await showDatePicker(
      context: currenrContext,
      firstDate: DateTime(DateTime.now().subtract(const Duration(days: 36500)).year),
      lastDate: DateTime(DateTime.now().add(const Duration(days: 3650)).year),
      currentDate: DateTime(currentDate.year, currentDate.month, currentDate.day),
      keyboardType: TextInputType.datetime,
      cancelText: generalText.cancel,
      confirmText:  generalText.select,
    ).then((val) {
      if (val != null) {
        dtController!.text = sharedFunctions_Dates.convertToShortDateString(val);
        OnChanged != null ? OnChanged!(dtController!.text) : null;
        print(dtController!.text);
      }
    });
  }
}
