import 'package:flutter/material.dart';
 import '../../../../../../Core/Resources/valuesManager.dart';
import '../../../../../../Core/componants/ctr_TextFormField.dart';
import '../../../../../../Core/componants/ctr_TextHeaderPage.dart';
import '../../../../../core/componants/ctr_FloatingActionButton.dart';
import '../widget/userView_BuildListView.dart';
import '../widget/userView_BuildListViewItem.dart';

class scr_UserView extends StatelessWidget {
  scr_UserView({super.key});

  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  TextEditingController controllerfilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffold,
      appBar: AppBar(
        backgroundColor: Colors.white,

      ) , // ctr_AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ctr_FloatingActionButton(() {
        view_NewItem();
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
                text: 'إدارة العملاء',
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
          Expanded(
            child: userView_BuildListView(),
          ),
        ],
      ),
    );
  }
}
