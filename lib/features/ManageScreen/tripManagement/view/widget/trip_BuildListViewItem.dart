import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_express_test/core/componants/speacial/ctr_tripItem.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_Dialog.dart';
import '../screen/scr_TripView.dart';

trip_BuildListViewItem(context) {
  return InkWell(
    onDoubleTap: () {},
    child:
    SingleChildScrollView(
      child: ctr_tripItem(context,false),
    ),
  );
}



