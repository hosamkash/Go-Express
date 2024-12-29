import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/features/ClientScreen/scr_ClientTools.dart';
import 'package:go_express_test/features/ManageScreen/scr_ManageTools.dart';
import '../../core/Resources/assetsManager.dart';
 import '../../core/Resources/valuesManager.dart';
import '../../core/TextManager/generalText.dart';

class scr2_DashBoard extends StatelessWidget {
  const scr2_DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Card(
              color: Colors.white,
              elevation: valuesManager.numberDouble.n04 ,
              child: Padding(
                padding: EdgeInsets.all(valuesManager.numberDouble.n10),
                child: Text(
                  generalText.nikeAppName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

                ),
              ),
            ),
            SizedBox(height: valuesManager.numberDouble.n20),
            // الإدارة
            InkWell(
               onTap: () async => Get.to(scr_ManageTools()),
              child: SizedBox(
                width: valuesManager.numberDouble.n250,
                height: valuesManager.numberDouble.n250,
                child: Card(
                  elevation: valuesManager.numberDouble.n04 ,
                  color: Colors.white,

                  child: Column(
                    children: [
                      SizedBox(height: valuesManager.numberDouble.n10),
                      Image.asset(
                        assetsManager.manage,
                        width: valuesManager.numberDouble.n170,
                        height: valuesManager.numberDouble.n170,
                      ),
                      SizedBox(height: valuesManager.numberDouble.n10),
                      Text(
                        generalText.manageScreens, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                       ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: valuesManager.numberDouble.n10),
            // العميل
            InkWell(
                onTap: () async => Get.to(scr_ClientTools()),
              child: SizedBox(
                width: valuesManager.numberDouble.n250,
                height: valuesManager.numberDouble.n250,
                child: Card(
                  color: Colors.white,
                  elevation: valuesManager.numberDouble.n04,
                  child: Column(
                    children: [
                      SizedBox(height: valuesManager.numberDouble.n10),
                      Image.asset(
                        assetsManager.client,
                        width: valuesManager.numberDouble.n150,
                        height: valuesManager.numberDouble.n150,
                      ),
                      SizedBox(height: valuesManager.numberDouble.n10),
                      Text(
                        generalText.clientScreens,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                       ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
