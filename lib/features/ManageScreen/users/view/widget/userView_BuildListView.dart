import 'package:flutter/material.dart';
import 'package:go_express_test/features/ManageScreen/users/view/widget/userView_BuildListViewItem.dart';
 import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../Core/TextManager/generalText.dart';

Widget userView_BuildListView() {

  return  SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Column(
      children: [
        Container(

          width: valuesManager.numberDouble.n500,
          height: valuesManager.numberDouble.n30,
          child: Row(
            children: [
              SizedBox(
                  width: valuesManager.numberDouble.n120,
                  child: Text('الإسم', textAlign: TextAlign.center ,  style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold), )),
              SizedBox(
                  width: valuesManager.numberDouble.n200,
                  child: Text('الإيميل', textAlign: TextAlign.center, style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold), )),
              SizedBox(
                  height: valuesManager.numberDouble.n45,
                  child: Text(generalText.active, textAlign: TextAlign.center)),
              SizedBox(
                  width: valuesManager.numberDouble.n110,
                  child: Text(generalText.empty, textAlign: TextAlign.center)),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: valuesManager.numberDouble.n500,
            height: valuesManager.numberDouble.n500,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return userView_BuildListViewItem( context);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 10,
            ),
          ),
        ),
      ],
    ),
  );
}