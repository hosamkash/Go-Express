import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_Dialog.dart';
import '../screen/scr_UserItem.dart';

userView_BuildListViewItem( context) {
  return Column(
    children: [
      InkWell(
        onDoubleTap: () => view_EditItem(),
        child: SizedBox(
          child: Row(
            children: [

              SizedBox(
                width: valuesManager.numberDouble.n120,
                child: Text(
                  'عميل ..',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: valuesManager.numberDouble.n200,
                child: Text(
                  'eng.hosamkash@gmail.com',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: valuesManager.numberDouble.n45,
                child: Checkbox(value: true, onChanged: (value) {}),
              ),
              SizedBox(
                width: valuesManager.numberDouble.n90,
                child: Row(
                  children: [
                    SizedBox(width: valuesManager.numberDouble.n10),
                    InkWell(
                      child: Icon(Icons.edit),
                      onTap: () =>  view_EditItem(),
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

void view_EditItem( ) async {
  final result = await Get.to(scr_UserItem());
  if (result == true) {

  }

}

void view_NewItem() async {
  final result = await Get.to(scr_UserItem());
  if (result == true) {

  }
}