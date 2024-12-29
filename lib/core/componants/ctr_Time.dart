import 'package:flutter/material.dart';
import '../Resources/valuesManager.dart';
import '../SharedFunctions/sharedFunctions_Dates.dart';

class ctr_Time extends StatelessWidget {
  late TimeOfDay? selectedTime;

  late BuildContext currenrContext;
  late bool isEnabled;
  late bool isReadOnly;
  late TextEditingController? dtController = TextEditingController();
  late String text;
  late TextAlign? TextAlignValue;
  late bool isVisibleSearchIcon;
  late bool isOpenSelectorOnTap;
  late EdgeInsets? padding;
  late String? Function(String?)? OnValidate;
  late String? Function(TimeOfDay?)? OnChanged;
  late String? Function(String?)? OnSubmitted;

  ctr_Time({
    Key? Key,
    this.dtController,
    this.selectedTime,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.text = '',
    this.TextAlignValue,
    this.isOpenSelectorOnTap = false,
    this.isVisibleSearchIcon = false,
    this.padding = const EdgeInsets.all(0),
    this.OnValidate,
    this.OnChanged,
    this.OnSubmitted,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    currenrContext = context;
    return Container(
      padding: padding ?? EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05, top: valuesManager.numberDouble.n05, bottom: valuesManager.numberDouble.n05),
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

              decoration: InputDecoration(
                label: Text(text),
                contentPadding: EdgeInsets.symmetric(vertical: 0.3  ,horizontal: 2), // حشوة داخلية ثابتة
                filled: true,
                fillColor: Colors.white,
                suffixIcon: SizedBox(
                  height: valuesManager.numberDouble.n15,
                  child: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        dtController!.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              validator: OnValidate,
              onFieldSubmitted: OnSubmitted,
            ),
          ),
          if (isVisibleSearchIcon)
            IconButton(
              onPressed: () {},
              icon: IconButton(
                padding: EdgeInsets.zero,
                onPressed: openTimePicker,
                icon: Icon(Icons.search),
              ),
            ),
        ],
      ),
    );
  }

  void openTimePicker() async {
    if (!isOpenSelectorOnTap) return;

    await showTimePicker(
      context: currenrContext,
      initialTime: selectedTime ?? TimeOfDay(hour: 12, minute: 0),

    ).then((val) {
      if (val != null) {
        dtController!.text = sharedFunctions_Dates.convertTimeToShortTimeString(val, currenrContext);
        OnChanged!(val);
        print(dtController!.text);
      }
    });
  }
}
