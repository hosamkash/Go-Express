import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
 import '../ManageTables/ManageBLL.dart';
import '../Resources/valuesManager.dart';
import '../SharedFunctions/sharedFunctions_Dates.dart';
import '../TextManager/generalText.dart';
import '../componants/ctr_Date.dart';
import '../componants/ctr_Dialog.dart';
import '../componants/ctr_DropDowenList.dart';

class sharedControls {
  static Future<bool?> toastNotification(String message, bool isSuccssed,
      {int secondShow = 2, ToastGravity toastType = ToastGravity.SNACKBAR}) async {
    return await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: toastType,
        timeInSecForIosWeb: secondShow,
        backgroundColor: isSuccssed ? Colors.green : Colors.red,
        fontSize: 16.0);
  }

  static Future showFormFilterByDates(BuildContext context, en_TablesName tableName, int? branchID, TextEditingController contDateFrom,
      TextEditingController contDateTo, bool isGetAllDates) async {
    bool isEnableDates = !isGetAllDates;
    var frmKey = GlobalKey<FormState>();

    var xx = await ctr_Dialog.showFormDialog(
      context,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Form(
            key: frmKey,
            child: Column(
              mainAxisSize: MainAxisSize.min, // يجعل الارتفاع يتناسب مع المحتويات
              children: [
                Text(
                  'البحث بالوجهة والتاريخ',
                ),
                SizedBox(height: valuesManager.numberDouble.n10),
                ctr_DropDowenList(
                  hintLable: 'الوجهة',
                  padding: EdgeInsets.only(right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05),
                  //lstDataSource: Get.find<company_viewModel>().LstBranchesAsDataSource,

                  showClearIcon: true,
                  //selectedValue: Get.find<company_viewModel>().isFoundInList(branchID) ? branchID : null,
                  OnChanged: (returnID) {
                    branchID = returnID;
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isGetAllDates,
                        onChanged: (value) {
                          setState(() {
                            isGetAllDates = !isGetAllDates;

                            if (isGetAllDates) {
                              isEnableDates = false;
                              contDateFrom.text = '';
                              contDateTo.text = '';
                            } else
                              isEnableDates = true;
                          });
                        }),
                    Text('كل التواريخ',  ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          contDateFrom.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now());
                          contDateTo.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now());
                        },
                        child: Text('يوم',  )),
                    TextButton(
                        onPressed: () {
                          contDateFrom.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now().subtract(Duration(days: 7)));
                          contDateTo.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now());
                        },
                        child: Text('أسبوع', )),
                    TextButton(
                        onPressed: () {
                          contDateFrom.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now().subtract(Duration(days: 30)));
                          contDateTo.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now());
                        },
                        child: Text('شهر', )),
                    TextButton(
                        onPressed: () {
                          contDateFrom.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now().subtract(Duration(days: 365)));
                          contDateTo.text = sharedFunctions_Dates.convertToShortDateString(DateTime.now());
                        },
                        child: Text('سنة', )),
                  ],
                ),
                ctr_Date(
                  text: 'من تاريخ',
                  dtController: contDateFrom,
                  padding: EdgeInsets.only(
                      right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05, bottom: valuesManager.numberDouble.n10),
                  isReadOnly: true,
                  isOpenSelectorOnTap: isEnableDates,
                ),
                ctr_Date(
                  text: 'إلى تاريخ',
                  dtController: contDateTo,
                  padding: EdgeInsets.only(
                      right: valuesManager.numberDouble.n05, left: valuesManager.numberDouble.n05, bottom: valuesManager.numberDouble.n10),
                  isReadOnly: true,
                  isOpenSelectorOnTap: isEnableDates,
                ),
                Center(
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                           Get.back();
                        },
                        child: Text(generalText.confirm, ),
                      ),
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text(generalText.cancel, ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    if (xx != null) {
      return xx;
    }
  }

}
