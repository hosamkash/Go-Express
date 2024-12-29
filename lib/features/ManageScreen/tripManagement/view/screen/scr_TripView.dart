import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_express_test/features/ManageScreen/tripManagement/view/screen/scr_TripItem.dart';
import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_TextFormField.dart';
import '../../../../../../Core/componants/ctr_TextHeaderPage.dart';
import '../../../../../core/componants/ctr_FloatingActionButton.dart';
import '../widget/trip_BuildListView.dart';
import '../widget/trip_BuildListViewItem.dart';

class scr_TripView extends StatelessWidget {
  scr_TripView({super.key});

  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  TextEditingController controllerfilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffold,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      // ctr_AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ctr_FloatingActionButton(() {
        trip_NewItem();
      }),
      body: buildPageContent(),
    );
  }

  Widget buildPageContent() {
    return Container(
      child: Column(
        children: [
          Center(
              child: ctr_TextHeaderPage(
            text: 'إدارة الرحلات',
            borderRadius: BorderRadiusDirectional.all(Radius.circular(valuesManager.numberDouble.n10)),
          )),
          SizedBox(height: valuesManager.numberDouble.n10),
          SizedBox(
            height: valuesManager.numberDouble.n50,
            child: Row(
              children: [
                Expanded(
                    child: ctr_TextFormField(
                  Controller: controllerfilter,
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
          trip_BuildListView(),
        ],
      ),
    );
  }
}

void trip_EditItem() async {
  final result = await Get.to(scr_TripItem());
  if (result == true) {}
}

void trip_NewItem() async {
  final result = await Get.to(scr_TripItem());
  if (result == true) {}
}
