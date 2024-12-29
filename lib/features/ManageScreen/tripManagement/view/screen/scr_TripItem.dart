import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/componants/ctr_AppBar.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_TextFormField.dart';
import '../../../../../../Core/componants/ctr_TextHeaderPage.dart';
import '../../../../../Core/TextManager/generalText.dart';
import '../../../../../Core/componants/ctr_Date.dart';
import '../../../../../Core/componants/ctr_DropDowenList.dart';
import '../../../../../Core/componants/ctr_ElevatedButton.dart';
import '../../../../../core/componants/ctr_Time.dart';

class scr_TripItem extends StatelessWidget {
  var frmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ctr_AppBar(
        onSave: () {},
        onPrint: () {},
      ),
      body: Container(
        color: Colors.white,
        child: buildPageContent(),
      ),
    );
  }

  Widget buildPageContent() {
    return SingleChildScrollView(
      child: Form(
        key: frmKey,
        child: Column(
          children: [
            SizedBox(
              width: valuesManager.numberDouble.n180,
              child: ctr_TextHeaderPage(
                text: 'بيانات الرحلة',
                padding: EdgeInsets.only(top: valuesManager.numberDouble.n05),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(valuesManager.numberDouble.n10)),
              ),
            ),
            SizedBox(height: valuesManager.numberDouble.n05),
            ctr_TextFormField(
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05),
              TextType: TextInputType.text,
              TextAlignValue: TextAlign.end,
              Lable: 'الرحلة',
              autoSelectData: true,
              OnValidate: (value) {
                if (value == null || value.isEmpty) return generalText.mustEnterData;
                return null;
              },
            ),
            SizedBox(height: valuesManager.numberDouble.n05),
            ctr_DropDowenList(
              hintLable: 'المصدر',
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05),
              lstDataSource: [
                DropDowenDataSource(valueMember: 1, displayMember: 'جدة'),
                DropDowenDataSource(valueMember: 2, displayMember: 'الرياض'),
                DropDowenDataSource(valueMember: 3, displayMember: 'الدمام'),
                DropDowenDataSource(valueMember: 4, displayMember: 'الخبر'),
              ],
              // selectedValue: 1,
              hintTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              itemsTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              menuMaxHeightValue: valuesManager.numberDouble.n300,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              showClearIcon: true,
            ),
            SizedBox(height: valuesManager.numberDouble.n05),
            ctr_DropDowenList(
              hintLable: 'الوجهة',
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05),
              lstDataSource: [
                DropDowenDataSource(valueMember: 1, displayMember: 'مكة المكرمة'),
                DropDowenDataSource(valueMember: 2, displayMember: 'أبها'),
                DropDowenDataSource(valueMember: 3, displayMember: 'الطائف'),
              ],
              // selectedValue: 1,
              hintTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              itemsTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              menuMaxHeightValue: valuesManager.numberDouble.n300,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              showClearIcon: true,
            ),
            SizedBox(height: valuesManager.numberDouble.n05),
            Row(
              children: [
                Expanded(
                  child: ctr_Date(
                    text: 'التاريخ',
                    padding: EdgeInsets.only(right: valuesManager.numberDouble.n05),
                    isReadOnly: true,
                    isOpenSelectorOnTap: true,
                    OnChanged: (val) {
                      return val;
                    },
                    OnValidate: (value) {
                      if (value == null || value.isEmpty) {}
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ctr_Time(
                    text: 'الساعة',
                    padding: EdgeInsets.only(right: valuesManager.numberDouble.n05,left: valuesManager.numberDouble.n05),
                    isReadOnly: true,
                    isVisibleSearchIcon: false,
                    isOpenSelectorOnTap: true,
                    // selectedTime: discountFields.timeWorkFrom,
                  
                    OnValidate: (value) {
                      if (value == null || value.isEmpty) {}
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: valuesManager.numberDouble.n05),
            ctr_TextFormField(
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05),
              TextType: TextInputType.numberWithOptions(decimal: true),
              TextAlignValue: TextAlign.start,
              Lable: 'المبلغ',
              SufixIcon: Icon(Icons.monetization_on),
              OnValidate: (value) {
                if (value!.isEmpty) {
                  return generalText.mustEnterData;
                }

                return null;
              },
            ),
            SizedBox(height: valuesManager.numberDouble.n05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ctr_ElevatedButtonIcon(
                  labelText: 'حفظ',
                  icon: Icon(Icons.save),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                ctr_ElevatedButtonIcon(
                  labelText: 'إلغاء',
                  icon: Icon(Icons.cancel),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
