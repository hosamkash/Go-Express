import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/core/TextManager/generalText.dart';
import '../../../core/Resources/valuesManager.dart';
import '../../../core/componants/ctr_AppBar.dart';
import '../../../core/componants/ctr_ContactsNumber.dart';
import '../../../core/componants/ctr_ElevatedButton.dart';
import '../../../core/componants/ctr_TextFormField.dart';
import '../../../core/componants/ctr_TextFormField_Password.dart';
import '../../../core/componants/ctr_TextHeaderPage.dart';
import '../../ManageScreen/users/viewModel/user_viewModel.dart';


class scr_RegisterUser extends StatefulWidget {
  scr_RegisterUser({super.key});

 final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  @override
  State<scr_RegisterUser> createState() => _scr_RegisterUserState();
}
var frmKey = GlobalKey<FormState>();

class _scr_RegisterUserState extends State<scr_RegisterUser> {
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
             SizedBox(height: valuesManager.numberDouble.n05),
            ctr_TextHeaderPage(
              text:generalText.newUserAccount ,

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
            SizedBox(height: valuesManager.numberDouble.n20),
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
            SizedBox(height: valuesManager.numberDouble.n20),
            ctr_TextFormField_Password(
              Controller: contPass,
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n20, left: valuesManager.numberDouble.n20),
              IsobscureText: true,
              Lable: generalText.password,
              PrefixIcon:  Icon(Icons.lock),
              OnValidate: (value) {
                if (value!.isEmpty) return generalText.mustEnterData;
                return null;
              },

            ),
            SizedBox(height: valuesManager.numberDouble.n20),
            ctr_TextFormField_Password(
              Controller: contConfiremPass,
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n20, left: valuesManager.numberDouble.n20),
              IsobscureText: true,
              Lable: generalText.confirmPass,
              PrefixIcon:  Icon(Icons.lock),
              OnValidate: (value) {
                if (value!.isEmpty) {
                  return generalText.mustEnterData;
                }
                else  if (value.isNotEmpty && contPass.text.trim() !=  contConfiremPass.text.trim()) {
                  return generalText.mustEqualTwoPass;
                }
                return null;
              },

            ),
            SizedBox(height: valuesManager.numberDouble.n20),
            ctr_ContactsNumber(
              Controller: contMobile,
              padding: EdgeInsets.only(right: valuesManager.numberDouble.n20, left: valuesManager.numberDouble.n20),
              TextAlignValue: TextAlign.center,
              Lable: generalText.mobile,
              autoSelectData: true,
            ),
            SizedBox(height: valuesManager.numberDouble.n20),
            Center(
              child: ctr_ElevatedButtonIcon(
                labelText: generalText.newAccount,
                icon: Icon(Icons.account_circle ),
                onPressed: () async {
                  if(frmKey.currentState!.validate()) {
                    Get.find<user_viewModel>().addUserAuthentication(
                       contEmail.text.trim(),
                       contPass.text.trim(),
                       contName.text.trim(),
                       contMobile.text.trim(),
                    );
                  }
                },
              ),

            ),
          ],
        ),
      ),
    );
  }

}
