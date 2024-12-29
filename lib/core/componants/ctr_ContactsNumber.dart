import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/core/TextManager/generalText.dart';
import '../Resources/valuesManager.dart';
import '../SharedFunctions/sharedFunctions_ContactsPhone.dart'; 

class ctr_ContactsNumber extends StatelessWidget {
  final GlobalKey _iconKey = GlobalKey();


  late final TextAlign? TextAlignValue;
  // late Widget? SufixIcon;
  late final Widget? sufix;
  late final bool Isenabled ;
  late final InputBorder border ;
  late final TextEditingController? Controller;
  late final TextStyle? textStyle;
  late final String Lable;
  late final TextStyle? labelStyle;
  late final Icon? PrefixIcon;
  late final EdgeInsets? padding;
  late final bool? autoSelectData;
  late final bool? readOnly;

  late final String? Function(String?)? OnValidate;
  late final String? Function(String?)? OnChanged;
  late final String? Function(String?)? OnSubmitted;
  late final String? Function()? OnTap;

  ctr_ContactsNumber({
    Key? Key,
    this.TextAlignValue,
    // this.SufixIcon,
    this.sufix,
    this.Controller,
    this.Isenabled =true ,
    this.border = const OutlineInputBorder(),
    this.textStyle,
    this.Lable = '',
    this.labelStyle,
    this.PrefixIcon,
    this.padding = const EdgeInsets.all(0),
    this.autoSelectData,
    this.readOnly,
    this.OnValidate,
    this.OnChanged,
    this.OnSubmitted,
    this.OnTap,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05, top: valuesManager.numberDouble.n05, bottom: valuesManager.numberDouble.n05),
      // height: valuesManager.numberDouble.n50,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: Controller,
              enabled: Isenabled,
              keyboardType: TextInputType.number,
              textDirection: TextDirection.ltr,
              textAlign: TextAlignValue ?? TextAlign.center,
              style: textStyle ,
              readOnly: readOnly ?? false,
              decoration: InputDecoration(
                label: Text(Lable),
                labelStyle: labelStyle ,
                contentPadding: EdgeInsets.symmetric(vertical: 0.3  ,horizontal: 2), // حشوة داخلية ثابتة
                prefixIcon: PrefixIcon,
                suffixIcon: IconButton(
                    key: _iconKey,
                    onPressed: () {
                      openMenuOption(context);

  },
                    icon: const Icon(Icons.call)),
                fillColor: Colors.white,
                filled: true,
                suffix: sufix,
                border: border,
              ),
              validator: OnValidate,
              onChanged: OnChanged,
              onTap: () {
                // if(autoSelectData == true )  {
                //   Controller!.selection = TextSelection(baseOffset: 0, extentOffset: Controller!.text.length);
                // }
                OnTap != null ? OnTap!() : null;
              },
              onFieldSubmitted: OnSubmitted,
            ),
          ),
        ],
      ),
    );
  }

  Widget showOptions() {
    List<String> lstDataString = ['Call إتصال', 'SMS رسالة نصية', 'WhatsApp واتس آب',
      'Telegram تليجرام', generalText.empty, generalText.empty, generalText .empty];
    String? selectedValue;

    return SizedBox(
      width: valuesManager.numberDouble.n50,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
              items: lstDataString.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        onChanged: (String? val) {
          print(selectedValue);
        },
        icon: Icon(
          Icons.keyboard_arrow_down_rounded
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(valuesManager.numberDouble.n10),
            borderSide: BorderSide(
              color: Colors.grey,
              width: valuesManager.numberDouble.n02,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(valuesManager.numberDouble.n10),
            borderSide: BorderSide(
              color: Colors.grey,
              width: valuesManager.numberDouble.n02,
            ),
          ),
        ),
        dropdownColor: Colors.white,
        elevation: valuesManager.numberInt.n02,
        menuMaxHeight: 250,
        borderRadius: BorderRadius.all(Radius.circular(valuesManager.numberDouble.n10)),
      ),
    );
  }

  openMenuOption(context , ) {
    final RenderBox renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero); // الحصول على إحداثيات الزر

    showMenu(
      color: Colors.white,
      context: context,
      // position: RelativeRect.fromLTRB(globalPosition.dx, globalPosition.dy, globalPosition.dx, globalPosition.dy),
      position: RelativeRect.fromLTRB(
        position.dx, // الموقع الأفقي
        position.dy + renderBox.size.height, // الموقع الرأسي أسفل الزر
        position.dx + renderBox.size.width, // الحجم الأفقي
        position.dy, // الحجم الرأسي
      ),
      items: [

        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.call, color: Colors.black),
              Text('Call إتصال',),
            ],
          ),
          onTap: () async {
            sharedFunctions_ContactsPhone.phoneNumber_Call(Controller != null ? Controller!.text.trim() : generalText.empty);
          },
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.sms, color: Colors.black),
              Text('SMS رسالة نصية', ),
            ],
          ),
          onTap: () {
            sharedFunctions_ContactsPhone.phoneNumber_SMS(Controller != null ? Controller!.text.trim() : generalText.empty , 'مرحبا ..');
          },
        ),

        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.chat, color: Colors.black),
              Text('  WhatsApp واتس آب'),
            ],
          ),
          onTap: () {
            sharedFunctions_ContactsPhone.phoneNumber_WhatsApp(Controller != null ? Controller!.text.trim() : generalText.empty , 'Hellow..');
          },
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.telegram, color: Colors.black ),
              Text('  Telegram تليجرام', ),
            ],
          ),
          onTap: () {
            sharedFunctions_ContactsPhone.phoneNumber_Telegram(Controller != null ? Controller!.text.trim() : generalText.empty , 'Hellow..');
          },
        ),

      ],

    );
  }


}


// ctr_AlertDialog.showListFilter(
//   context,
//   backgroundColor: Colors.white,
//   content: SizedBox(
//     height: valuesManager.numberDouble.n200,
//     child: SingleChildScrollView(
//       child: Column(
//         children: [
//           ListView(
//             children: [
//               Text('الخيارات' , style: Get.find<>().(fontSize: 25 , fontWeight: FontWeight.bold),),
//               SizedBox(height: valuesManager.numberDouble.n10),                                  SizedBox(
//                 width : 250,
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     sharedControls.phoneNumber_Call(Controller != null ? Controller!.text.trim() : generalText.empty);
//                   },
//                   label: const Text(
//                     'Call إتصال',
//                     style: Get.find<>().(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                       color: Get.find<colorManager>().black,
//                     ),
//                   ),
//                   icon: const Icon(Icons.call),
//                   iconAlignment: IconAlignment.end,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     elevation: valuesManager.numberDouble.n03,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width : 250,
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     sharedControls.phoneNumber_SMS(Controller != null ? Controller!.text.trim() : generalText.empty , 'مرحبا ..');
//                   },
//                   label: const Text(
//                     'SMS رسالة نصية',
//                     style: Get.find<>().(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                       color: Get.find<colorManager>().black,
//                     ),
//                   ),
//                   icon: const Icon(Icons.sms),
//                   iconAlignment: IconAlignment.end,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     elevation: valuesManager.numberDouble.n03,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width : 250,
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     sharedControls.phoneNumber_WhatsApp(Controller != null ? Controller!.text.trim() : generalText.empty , 'Hellow..');
//                   },
//                   label: const Text(
//                     'WhatsApp واتس آب',
//                     style: Get.find<>().(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                       color: Get.find<colorManager>().black,
//                     ),
//                   ),
//                   icon: const Icon(Icons.chat),
//                   iconAlignment: IconAlignment.end,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     elevation: valuesManager.numberDouble.n03,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width : 250,
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     sharedControls.phoneNumber_Telegram(Controller != null ? Controller!.text.trim() : generalText.empty, 'Hellow..');
//                   },
//                   label: const Text(
//                     'Telegram تليجرام',
//                     style: Get.find<>().(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                       color: Get.find<colorManager>().black,
//                     ),
//                   ),
//                   icon: const Icon(Icons.telegram),
//                   iconAlignment: IconAlignment.end,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     elevation: valuesManager.numberDouble.n03,
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),
// );