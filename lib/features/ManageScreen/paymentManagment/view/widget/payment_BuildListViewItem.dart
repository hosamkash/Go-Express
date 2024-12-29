import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_Dialog.dart';

payment_BuildListViewItem(context) {
  return Column(
    children: [
      InkWell(
        onDoubleTap: () {},
        child: SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: valuesManager.numberDouble.n120,
                child: Text('حسام عبد الرؤف', textAlign: TextAlign.center),
              ),
              SizedBox(
                width: valuesManager.numberDouble.n150,
                child: Text('28/12/2024 03:15 PM', textAlign: TextAlign.center),
              ),
              SizedBox(
                width: valuesManager.numberDouble.n80,
                child: Text('40 SR', textAlign: TextAlign.center),
              ),
              SizedBox(
                width: valuesManager.numberDouble.n70,
                child: Row(
                  children: [
                    SizedBox(width: valuesManager.numberDouble.n10),
                    InkWell(
                      child: Icon(Icons.edit),
                      onTap: () {},
                    ),
                    SizedBox(width: valuesManager.numberDouble.n10),
                    ctr_Dialog(
                      en_DialogType.AsIcon,
                      context,
                      message: 'عميل ..',
                      onDelete: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
