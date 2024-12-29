import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/core/TextManager/generalText.dart';
import 'package:go_express_test/core/componants/speacial/ctr_tripItem.dart';
import '../../../core/Resources/valuesManager.dart';
import '../../../core/componants/ctr_AppBar.dart';
import '../../../core/componants/ctr_ContactsNumber.dart';
import '../../../core/componants/ctr_ElevatedButton.dart';
import '../../../core/componants/ctr_TextFormField.dart';
import '../../../core/componants/ctr_TextFormField_Password.dart';
import '../../../core/componants/ctr_TextHeaderPage.dart';
import '../../ManageScreen/users/viewModel/user_viewModel.dart';


class scr_UserAccount extends StatelessWidget {
  scr_UserAccount({super.key});

 final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  var contName = TextEditingController();
  var contEmail = TextEditingController();
  var contPass = TextEditingController();
  var contConfiremPass = TextEditingController();
  var contMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: ctr_AppBar(
        // onLoadData: () => view_LoadDataFromDB(),
        // onPrint: () => view_PrintData(),
      ),
      body: Container(
        child: buildPageContent(context),
      ),
    );
  }

  Widget buildPageContent(context) {
    return SingleChildScrollView(
      child: Form(
        key: frmKey,
        child: Column(
          children: [
             SizedBox(height: valuesManager.numberDouble.n05),
            ctr_TextHeaderPage(
              text:'حساب المستخدم' ,
              padding:  EdgeInsets.only(top: valuesManager.numberDouble.n03,
                  right: valuesManager.numberDouble.n10, left: valuesManager.numberDouble.n10, bottom: 3),

              borderRadius:  BorderRadiusDirectional.all(Radius.circular(valuesManager.numberDouble.n10)),
            ),
            SizedBox(height: valuesManager.numberDouble.n10),
            ctr_TextFormField(
              Controller: contName,
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n20, left: valuesManager.numberDouble.n20),
              TextType: TextInputType.text,
              TextAlignValue: TextAlign.end,
              Lable: generalText.name,
              SufixIcon:  Icon(Icons.title),
              autoSelectData: true,

              OnValidate: (value) {
                if (value == null || value.isEmpty) {
                  return generalText.mustEnterData;
                }
                return null;
              },
            ),


            SizedBox(height: valuesManager.numberDouble.n10),
            ctr_TextFormField(
              Controller: contEmail,
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n20, left: valuesManager.numberDouble.n20),
              TextType: TextInputType.emailAddress,
              TextAlignValue: TextAlign.start,
              Lable: generalText.email,
              SufixIcon:  Icon(Icons.email),
              autoSelectData: true,
              OnValidate: (value) {
                if (value == null || value.isEmpty) {
                  return generalText.mustEnterData;
                }
                return null;
              },
            ),
            SizedBox(height: valuesManager.numberDouble.n10),
            Center(
              child:  Row(
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

            ),
            clientTripReserved(context),
            clientPayments(context),
          ],
        ),
      ),
    );
  }
}
var frmKey = GlobalKey<FormState>();

clientTripReserved(context) {
  return Card(
    color: Colors.white,
    elevation: valuesManager.numberDouble.n03,
    child: ExpansionTile(
      title: ListTile(
        title: Row(
          children: [
            Text('حجوزاتي - رحلاتي', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
        leading: Icon(Icons.person),
      ),
      children: [
        Container(
          width: double.infinity,
          child: Card(
           color: Colors.white,
            elevation: valuesManager.numberDouble.n03,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              padding: EdgeInsets.all(valuesManager.numberDouble.n05),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: valuesManager.numberDouble.n01_5)),
              child: Column(
                children: [
                  ctr_tripItem(context, true, isViewCancelReseve: true),
                  ctr_tripItem(context, true, isViewCancelReseve: true),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

clientPayments(context) {
  return Card(
    color: Colors.white,
    elevation: valuesManager.numberDouble.n03,
    child: ExpansionTile(
      title: ListTile(
        title: Row(
          children: [
            Text('مدفوعاتي', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
        leading: Icon(Icons.person),
      ),
      children: [
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: valuesManager.numberDouble.n03,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              padding: EdgeInsets.all(valuesManager.numberDouble.n05),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: valuesManager.numberDouble.n01_5)),
              child: Column(
                children: [
                  Text('يتم عرض سندات الدفع الناجحة والفاشلة ويتم الفلترة بينهم',style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black ),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}