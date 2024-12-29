import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Resources/valuesManager.dart';
import '../../../../Core/Shared/shared_controls.dart';
import '../../../../Core/componants/ctr_AppBar.dart';
import '../../../../Core/componants/ctr_ElevatedButton.dart';
import '../../../../Core/componants/ctr_TextFormField.dart';
import '../../../../Core/componants/ctr_TextFormField_Password.dart';
import '../../../Core/TextManager/generalText.dart';
import '../NewUser_Register/scr_RegisterUser.dart';
import '../../ManageScreen/users/viewModel/user_viewModel.dart';


class scr_ChangePassword extends StatefulWidget {
  scr_ChangePassword({super.key});

  @override
  State<scr_ChangePassword> createState() => _scr_ChangePasswordState();
}

class _scr_ChangePasswordState extends State<scr_ChangePassword> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  TextEditingController contEmail = TextEditingController();
  TextEditingController contOldPass = TextEditingController();
  TextEditingController contNewPass = TextEditingController();
  TextEditingController contNewPassConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ctr_AppBar(

      ),
      body: Padding(
        padding:  EdgeInsets.all(valuesManager.numberDouble.n30),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  generalText.changeUserPass,
                ),
                 SizedBox(height: valuesManager.numberDouble.n30),
                ctr_TextFormField(
                  Controller: contEmail,
                  TextType: TextInputType.emailAddress,
                  TextAlignValue: TextAlign.start,
                  Lable: generalText.email,
                  SufixIcon:  Icon(Icons.email),
                  PrefixIcon:  Icon(Icons.email),
                  OnValidate: (value) {
                    if (value!.isEmpty) {
                      return generalText.mustEnterData;
                    }

                    return null;
                  },
                ),
                 SizedBox(height: valuesManager.numberDouble.n25),
                ctr_TextFormField_Password(
                  Controller: contOldPass,
                  IsobscureText: true,
                  Lable: generalText.oldPassWord,
                  PrefixIcon:  Icon(Icons.lock),
                  OnValidate: (value) {
                    if (value!.isEmpty) return generalText.mustEnterData;
                    return null;
                  },
                  OnFieldSubmitted: (val) {
                    changeUserPassword();
                    return null;
                  },
                ),
                 SizedBox(height: valuesManager.numberDouble.n15),
                ctr_TextFormField_Password(
                  Controller: contNewPass,
                  IsobscureText: true,
                  Lable: generalText.newPassWord,
                  PrefixIcon:  Icon(Icons.lock),
                  OnValidate: (value) {
                    if (value!.isEmpty) return generalText.mustEnterData;
                    return null;
                  },
                  OnFieldSubmitted: (val) {
                    changeUserPassword();
                    return null;
                  },
                ),
                 SizedBox(height: valuesManager.numberDouble.n15),
                ctr_TextFormField_Password(
                  Controller: contNewPassConfirm,
                  IsobscureText: true,
                  Lable: generalText.confirmPass,
                  PrefixIcon:  Icon(Icons.lock),
                  OnValidate: (value) {
                    if (value!.isEmpty) return generalText.mustEnterData;
                    return null;
                  },
                  OnFieldSubmitted: (val) {
                    changeUserPassword();
                    return null;
                  },
                ),
                 SizedBox(height: valuesManager.numberDouble.n15),
                Center(
                  child: ctr_ElevatedButtonIcon(
                    labelText: generalText. change,
                    icon: Icon(Icons.change_circle),
                    onPressed: () async => changeUserPassword(),
                  ),

                ),
                 SizedBox(
                  height: valuesManager.numberDouble.n05,
                ),
                Row(
                  children: [
                    Text(generalText. toCreateAccountPressHere),
                    Expanded(
                      child: MaterialButton(
                          child: Text(
                            generalText. newAccount,

                          ),
                          onPressed: () {
                            Get.to(scr_RegisterUser());
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //   },
    // );
  }

  changeUserPassword() {
    if (formKey.currentState!.validate()) {
      if (contNewPass.text.trim() != contNewPassConfirm.text.trim()) {
        sharedControls.toastNotification(generalText. mustEqualTwoPass, false);
        return;
      }

      // لو الفاليديشن صح يحدث البيانات
      Get.find<user_viewModel>()
          .changeUserPassword( contEmail.text.trim(),  contOldPass.text.trim(),  contNewPass.text.trim());
    }
  }
}
