import 'package:flutter/material.dart';
import 'package:go_express_test/features/ManageScreen/paymentManagment/view/widget/payment_BuildListViewItem.dart';
import 'package:go_express_test/features/ManageScreen/users/view/widget/userView_BuildListViewItem.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../Core/TextManager/generalText.dart';

Widget payment_BuildListView(bool isSuccssed) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Column(
      children: [
        Container(
          width: valuesManager.numberDouble.n450,
          height: valuesManager.numberDouble.n30,
          color: isSuccssed ? Colors.green : Colors.red,
          child: Row(
            children: [
              SizedBox(
                  width: valuesManager.numberDouble.n120,
                  child: Text(
                    'الإسم',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  width: valuesManager.numberDouble.n150,
                  child: Text(
                    'التاريخ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  width: valuesManager.numberDouble.n80,
                  child: Text(
                    'المبلغ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
              SizedBox(width: valuesManager.numberDouble.n90, child: Text(generalText.empty, textAlign: TextAlign.center)),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: valuesManager.numberDouble.n450,
            height: valuesManager.numberDouble.n500,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return payment_BuildListViewItem(context);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount:isSuccssed ? 15 : 4,
            ),
          ),
        ),
      ],
    ),
  );
}
