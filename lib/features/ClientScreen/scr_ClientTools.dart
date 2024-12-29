import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/core/TextManager/generalText.dart';
import 'package:go_express_test/features/ClientScreen/AccountUser/scr_UserAccount.dart';
import 'package:go_express_test/features/ClientScreen/Login/scr_Login.dart';
import 'package:go_express_test/features/ClientScreen/NewUser_Register/scr_RegisterUser.dart';
import 'package:go_express_test/features/ClientScreen/SelectTrip/view/screen/scr_SelectTripToClient.dart';
import '../../core/Resources/assetsManager.dart';
 import '../../core/Resources/valuesManager.dart';
import '../../core/componants/ctr_AppBar.dart';

class scr_ClientTools extends StatelessWidget {
  scr_ClientTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: ctr_AppBar(

      ),
      body: buildGridView(context),
      backgroundColor: Colors.white,
    );
  }

  Widget buildGridView(context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          elevation: valuesManager.numberDouble.n04,
          child: Padding(
            padding: EdgeInsets.only(
                top: valuesManager.numberDouble.n05,
                bottom: valuesManager.numberDouble.n05,
                right: valuesManager.numberDouble.n20,
                left: valuesManager.numberDouble.n20),
            child: Text(
              generalText.clientScreens, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
             ),
          ),
        ),
        Expanded(

         child:  GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(valuesManager.numberDouble.n05),
              physics: BouncingScrollPhysics(),
              children: [
                //  تسجيل الدخول
                InkWell(
                  onTap: () async => Get.to(scr_Login()),
                  child: Card(
                    color: Colors.white,
                    elevation: valuesManager.numberDouble.n02,
                    child: Column(
                      children: [
                        SizedBox(height: valuesManager.numberDouble.n10),
                        Image.asset(
                          assetsManager.loginUser,
                          width: valuesManager.numberDouble.n100,
                          height: valuesManager.numberDouble.n100,
                        ),
                        SizedBox(height: valuesManager.numberDouble.n05),
                        Text(generalText.btnLogin , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                //  مستخدم جديد
                InkWell(
                   onTap: () async => Get.to(scr_RegisterUser()),
                  child: Card(
                    color: Colors.white,
                    elevation: valuesManager.numberDouble.n02,
                    child: Column(
                      children: [
                        SizedBox(height: valuesManager.numberDouble.n10),
                        Image.asset(
                          assetsManager.newUser,
                          width: valuesManager.numberDouble.n100,
                          height: valuesManager.numberDouble.n100,
                        ),
                        SizedBox(height: valuesManager.numberDouble.n05),
                        Text(generalText.btnNewUser , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                // حساب مستخدم
                InkWell(
                   onTap: () async => Get.to(scr_UserAccount( )),
                  child: Card(
                    color: Colors.white,
                    elevation: valuesManager.numberDouble.n02,
                    child: Column(
                      children: [
                        SizedBox(height: valuesManager.numberDouble.n10),
                        Image.asset(
                          assetsManager.accountUser,
                          width: valuesManager.numberDouble.n100,
                          height: valuesManager.numberDouble.n100,
                        ),
                        SizedBox(height: valuesManager.numberDouble.n05),
                        Text(generalText.btnAccountUser, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                // الرحلات
                InkWell(
                  onTap: () async => Get.to(scr_SelectTripToClient()),
                  child: Card(
                    color: Colors.white,
                    elevation: valuesManager.numberDouble.n02,
                    child: Column(
                      children: [
                        SizedBox(height: valuesManager.numberDouble.n10),
                        Image.asset(
                          assetsManager.selectTrip,
                          width: valuesManager.numberDouble.n100,
                          height: valuesManager.numberDouble.n100,
                        ),
                        SizedBox(height: valuesManager.numberDouble.n05 ,),
                        Text('الرحلات(إختيار رحلة)',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

        ),
      ],
    );
  }
}
