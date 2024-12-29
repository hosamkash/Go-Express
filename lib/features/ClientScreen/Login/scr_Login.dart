import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/core/TextManager/generalText.dart';
 import '../../../core/Resources/valuesManager.dart';
import '../../../core/componants/ctr_AppBar.dart';
import '../../../core/componants/ctr_ElevatedButton.dart';
import '../../../core/componants/ctr_TextFormField.dart';
import '../../../core/componants/ctr_TextFormField_Password.dart';
import '../../ManageScreen/users/viewModel/user_viewModel.dart';
import '../NewUser_Register/scr_RegisterUser.dart';


class scr_Login extends StatefulWidget {
  scr_Login({super.key});

  @override
  State<scr_Login> createState() => _scr_LoginState();
}

class _scr_LoginState extends State<scr_Login> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var contEmail = TextEditingController();
  var contPass = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
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
                  generalText.btnLogin,
                 ),
                 SizedBox(height: valuesManager.numberDouble.n30),
                ctr_TextFormField(
                  Controller: contEmail,
                  TextType: TextInputType.emailAddress,
                  TextAlignValue: TextAlign.start,
                  Lable:generalText.email,
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
                  Controller: contPass,
                  IsobscureText: true,
                  Lable:generalText.password,
                  PrefixIcon:  Icon(Icons.lock),
                  OnValidate: (value) {
                    if (value!.isEmpty) return generalText.mustEnterData;
                    return null;
                  },
                  OnFieldSubmitted: (val) {
                    ChekLoginUser();
                    return null;
                  },
                ),
                SizedBox(height: valuesManager.numberDouble.n15),
                Center(
                  child: ctr_ElevatedButtonIcon(
                    labelText:generalText.btnLogin,
                    icon: Icon(Icons.login),
                    onPressed: () async => ChekLoginUser(),
                  ),
                ),
                 SizedBox(
                  height: valuesManager.numberDouble.n05,
                ),
                Row(
                  children: [
                    Text(generalText.toCreateAccountPressHere),
                    Expanded(
                      child: MaterialButton(
                          child: Text(
                            generalText.newAccount,

                          ),
                          onPressed: () {
                            Get.to(  scr_RegisterUser());
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

  ChekLoginUser() {
    if (formKey.currentState!.validate()) {
      Get.find<user_viewModel>().loginUser( contEmail.text.trim(),  contPass.text.trim());

      // cubit.objCubit.userLogin(emailController.text, passController.text);
    }
  }
}
