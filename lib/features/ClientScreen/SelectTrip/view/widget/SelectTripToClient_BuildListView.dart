import 'package:flutter/material.dart';
import 'package:go_express_test/core/componants/speacial/ctr_tripItem.dart';
import 'package:go_express_test/features/ManageScreen/tripManagement/view/widget/trip_BuildListViewItem.dart';
 import '../../../../../../Core/Resources/valuesManager.dart';

Widget SelectTripToClient_BuildListView() {

  return  Expanded(
    child: SizedBox(
      width: valuesManager.numberDouble.n500,
     height: valuesManager.numberDouble.n500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ctr_tripItem( context ,true ,isViewEditButton: true ,isViewCancelReseve: true);
        },
        itemCount: 10,
      ),
    ),
  );
}