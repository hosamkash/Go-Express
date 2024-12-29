import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_Dialog.dart';
import '../../../features/ManageScreen/tripManagement/view/screen/scr_TripView.dart';

ctr_tripItem(context, bool openToSelect, {bool isViewReseve = false, bool isViewCancelReseve= false,
                  bool isViewEditButton= false}) {
  return Card(
    color: Colors.white,
    elevation: 2,
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'الرحلة : ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              '5006',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(width: 10),
            Text(
              'التاريخ : ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              '28/12/2024',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(width: 10),
            Text(
              '03:35 PM',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'المصدر : ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              'جدة',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(width: 15),
            Text(
              'الوجهة : ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              'مكة المكرمة',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'المبلغ : ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              '40 SR',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(width: valuesManager.numberDouble.n15),
            checkOpenTripItem(context, openToSelect, isViewReseve: isViewReseve,
                isViewCancelReseve: isViewCancelReseve,isViewEditButton: isViewEditButton),
          ],
        ),
      ],
    ),
  );
}

Widget checkOpenTripItem(context, bool openToSelect, {bool isViewReseve = false, bool isViewCancelReseve= false , bool isViewEditButton= false}) {
  if (openToSelect)
    return Row(
      children: [
        if(isViewReseve)
        MaterialButton(child: Text('حجز', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green)), onPressed: () {}),
        if(isViewEditButton)
          MaterialButton(child: Text('تعديل', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue)), onPressed: () {}),
      if(isViewCancelReseve)
        MaterialButton(child: Text('إلغاء الحجز', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red)), onPressed: () {}),
      ],
    );
  //-----------------------------------------------
  else
    return Row(
      children: [
        InkWell(
          child: Icon(
            Icons.edit,
            size: 25,
          ),
          onTap: () => trip_EditItem(),
        ),
        SizedBox(width: valuesManager.numberDouble.n15),
        ctr_Dialog(
          en_DialogType.AsIcon,
          context,
          message: 'عميل ..',
          onDelete: () {
            Get.back();
          },
        )
      ],
    );
}
