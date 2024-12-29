import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../../Core/ManageTables/ManageBLL.dart';
import '../../../../../Core/Shared/sharedConst.dart';
import '../../../../../Core/componants/ctr_DropDowenList.dart';
import '../../../../core/Failure_Exception/failuer.dart';
import '../model/Dealing_Users_Model.dart';
import '../model/Dealing_Users_RepoImp.dart';

class user_viewModel extends GetxController {
  RxList<Dealing_Users> lstAllUser = <Dealing_Users> [].obs;
  RxList<Dealing_Users> filterdLst_User = <Dealing_Users> [].obs;
  RxList<DropDowenDataSource> LstUserAsDataSource = <DropDowenDataSource> [].obs;
  RxBool isLoading = false.obs;

  Future getList_User({List<BLLCondions>? conditions}) async {
    isLoading.value = true;
    var result = await Get.find<Dealing_Users_RepoImp>().getList_User();
    result.fold(
          (fil) => failuerMessage.getMessage(fil),
          (value) {
        lstAllUser.value = value;
        filterdLst_User.value = [...lstAllUser];
      },
    ); 
    isLoading.value = false;
    return filterdLst_User;
  }

  filterAny_User({String? filterData}) async{
    var result = await Get.find<Dealing_Users_RepoImp>().filterAny_User(filterData: filterData);
    result.fold(
          (fil) => failuerMessage.getMessage(fil),
          (value) {
            filterdLst_User.value = value;
       },
    );
    return filterdLst_User;
  }

  Future resetFilter_User() async {
    var result = await Get.find<Dealing_Users_RepoImp>().resetFilter_User();
    result.fold(
          (fil) => failuerMessage.getMessage(fil),
          (value) {
            filterdLst_User.value  = value;
      },
    );
    return filterdLst_User;
  }

  Future getLstUserAsDataSource() async {
    var result = await Get.find<Dealing_Users_RepoImp>().resetFilter_User();
    result.fold(
          (fil) => failuerMessage.getMessage(fil),
          (value) {
            filterdLst_User.value = value;
      },
    );
    return filterdLst_User;
  }

  String getNameByID(int? ID) {
    String ret = '';
    if (lstAllUser.isNotEmpty && ID != null) {
      ret = lstAllUser.firstWhere((elm) {
        return elm.ID == ID;
      }).Name!;
    }
    return ret;
  }

  Future<String> addUserAuthentication(String email, String password, String name, String mobile) async {

    var result = await Get.find<Dealing_Users_RepoImp>().addUserAuthentication(email, password, name, mobile);
    result.fold(
          (fil) => failuerMessage.getMessage(fil),
          (value) {
        sharedConst.UID = value;
       },
    );
    return sharedConst.UID;
  }

  Future<UserCredential?> loginUser(String email, String password) async {
    var result = await Get.find<Dealing_Users_RepoImp>().loginUser(email, password);
    result.fold(
          (fil) => failuerMessage.getMessage(fil),
          (value) {
        sharedConst.UID = value!.user!.uid;

      },
    );
  }

  Future changeUserPassword(String email, String oldPassword, String password) async {
    var result = await Get.find<Dealing_Users_RepoImp>().changeUserPassword(email, oldPassword, password);
    result.fold(
          (fil) => failuerMessage.getMessage(fil),
          (value) =>  value,
    );
  }

  Future<int> getMax(enTable_Dealing_Users column) async {
    final result = await Get.find<Dealing_Users_RepoImp>().getMax(column);
    late int maxID;
    result.fold(
          (fil) => Left(fil),
          (value) => maxID = value,
    );
    return maxID;
  }

   saveItem(int selectedID, Dealing_Users user) async {
     Get.find<Dealing_Users_RepoImp>().saveItem(selectedID,user);

   }

   deleteItem(int selectedID) async {
    Get.find<Dealing_Users_RepoImp>().deleteItem(selectedID);
  }

}
