import 'package:flutter/material.dart';
import 'package:go_express_test/Core/componants/ctr_AppBar.dart';
import 'package:go_express_test/features/ClientScreen/SelectTrip/view/widget/SelectTripToClient_BuildListView.dart';
import 'package:go_express_test/features/ManageScreen/paymentManagment/view/widget/payment_BuildListView.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_TextFormField.dart';
import '../../../../../../Core/componants/ctr_TextHeaderPage.dart';
import '../../../../../core/componants/ctr_TabBar.dart';

class scr_PaymentManagment extends StatelessWidget {
  scr_PaymentManagment({super.key});

  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffold,
      appBar: ctr_AppBar(
        //  backgroundColor: Colors.white,
        onShare: () {},
        onFilter: () {},
        onLoadData: () {},
      ),
      body: buildPageContent(),
    );
  }

  Widget buildPageContent() {
    return Container(
      child: Column(
        children: [
          Center(
              child: ctr_TextHeaderPage(
            text: 'إدارة المدفوعات',
            borderRadius: BorderRadiusDirectional.all(Radius.circular(valuesManager.numberDouble.n10)),
          )),
          SizedBox(height: valuesManager.numberDouble.n10),
          SizedBox(
            height: valuesManager.numberDouble.n50,
            child: Row(
              children: [
                Expanded(
                    child: ctr_TextFormField(
                  PrefixIcon: Icon(Icons.search),
                  padding: EdgeInsets.only(right: valuesManager.numberDouble.n10, left: valuesManager.numberDouble.n10),
                )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
          ),
          SizedBox(height: valuesManager.numberDouble.n10),
          SizedBox(
            height: valuesManager.numberDouble.n500,
            child: Card(
              color: Colors.white,
              child: ctr_TabBar(
                LstTabBarViewHeaderWidget: [
                  Text(
                    'الناجحة',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Text(
                    'الفاشلة',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.red),
                  ),
                ],
                LstTabBarViewWidget: [
                  payment_BuildListView(true),
                  payment_BuildListView(false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
