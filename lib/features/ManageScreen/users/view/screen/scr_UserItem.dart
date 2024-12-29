import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/componants/ctr_AppBar.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_TextFormField.dart';
import '../../../../../../Core/componants/ctr_TextHeaderPage.dart';
import '../../../../../Core/TextManager/generalText.dart';
import '../../../../../Core/componants/ctr_ElevatedButton.dart';


class scr_UserItem extends StatelessWidget {
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
                text: 'بيانات العميل',
                padding: EdgeInsets.only(top: valuesManager.numberDouble.n05),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(valuesManager.numberDouble.n10)),
              ),
            ),
            SizedBox(height: valuesManager.numberDouble.n05),


            ctr_TextFormField(

              padding: EdgeInsets.only(
                  right: valuesManager.numberDouble.n10, left: valuesManager.numberDouble.n10, bottom: valuesManager.numberDouble.n05),
              TextType: TextInputType.text,
              TextAlignValue: TextAlign.end,
              Lable: 'الاسم',
              autoSelectData: true,

              OnValidate: (value) {
                if (value == null || value.isEmpty) return generalText.mustEnterData;
                return null;
              },
            ),
            ctr_TextFormField(
              padding: EdgeInsets.only(
                  right: valuesManager.numberDouble.n10, left: valuesManager.numberDouble.n10,
                  bottom: valuesManager.numberDouble.n05),
              TextType: TextInputType.emailAddress,
              TextAlignValue: TextAlign.end,
              Lable: 'الايميل',
              autoSelectData: true,
              OnValidate: (value) {
                if (value == null || value.isEmpty) return generalText.mustEnterData;
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ctr_ElevatedButtonIcon(
                  labelText:'حفظ',
                  icon: Icon(Icons.save),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                ctr_ElevatedButtonIcon(
                  labelText:'إلغاء',
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
