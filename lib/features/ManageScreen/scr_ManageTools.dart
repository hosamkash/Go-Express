import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/core/TextManager/generalText.dart';
import 'package:go_express_test/features/ManageScreen/paymentManagment/view/screen/scr_PaymentManagment.dart';
import 'package:go_express_test/features/ManageScreen/reservationManagment/view/screen/scr_ReservationsManagement.dart';
import 'package:go_express_test/features/ManageScreen/tripManagement/view/screen/scr_TripView.dart';
import 'package:go_express_test/features/ManageScreen/users/view/screen/scr_UserView.dart';
import '../../core/Resources/assetsManager.dart';
 import '../../core/Resources/valuesManager.dart';
import '../../core/componants/ctr_AppBar.dart';

class scr_ManageTools extends StatelessWidget {
  scr_ManageTools({super.key});

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
              generalText.manageScreens, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
             ),
          ),
        ),
        Expanded(

         child:  GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(valuesManager.numberDouble.n05),
              physics: BouncingScrollPhysics(),
              children: [
                //  عرض العملاء
                InkWell(
                  onTap: () async => Get.to(scr_UserView()),
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
                        Text(generalText.btnClients, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
                      ],
                    ),
                  ),
                ),
                //  إدارة الرحلات
                InkWell(
                   onTap: () async => Get.to(scr_TripView()),
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
                        Text(generalText.btnTripManagement, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
                      ],
                    ),
                  ),
                ),
                // إدارة الحجوزات
                InkWell(
                   onTap: () async => Get.to(scr_ReservationsManagement()),
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
                        Text(generalText.btnManageReservations, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),  ),
                      ],
                    ),
                  ),
                ),
                //  إدارة المدفوعات
                InkWell(
                   onTap: () async => Get.to(scr_PaymentManagment()),
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
                        Text(generalText.btnPaymentManagement, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
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
