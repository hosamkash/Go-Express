import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../../Core/Shared/sharedConst.dart';
import '../../../../../../Core/Shared/shared_controls.dart';
import '../../../../../../Core/componants/ctr_DropDowenList.dart';
import '../../../../../Core/ManageTables/ManageBLL.dart';
import '../../../../core/Failure_Exception/ExceptionCustom.dart';
import '../../../../core/Failure_Exception/failuer.dart';
import '../../../../core/ManageTables/managmeFirebaseAuthentication.dart';
import 'Dealing_Users_Model.dart';
import 'Dealing_Users_Source.dart';

class Dealing_Users_RepoImp {
  List<Dealing_Users> lstAllUser = [];
  List<Dealing_Users> filterdLst_User = [];
  List<DropDowenDataSource> LstUserAsDataSource = [];

  Future<Either<failuer, List<Dealing_Users>>> getList_User({List<BLLCondions>? conditions}) async {
    try {
      lstAllUser = await Dealing_Users_Source.fire_getListWithConditions(conditions: conditions);
      resetFilter_User();
      return Right(lstAllUser);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, List<Dealing_Users>>> filterAny_User({String? filterData}) async {
    try {
      if (filterData == null || filterData.isEmpty) {
        resetFilter_User();
      }
      filterdLst_User = lstAllUser.where((item) {
        return (item.Name == null ? false : item.Name!.toLowerCase().contains(filterData!.toLowerCase())) ||
            (item.EMail == null ? false : item.EMail!.toLowerCase().contains(filterData!.toLowerCase()));
      }).toList();
      return Right(filterdLst_User);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, List<Dealing_Users>>> resetFilter_User() async {
    try {
      filterdLst_User.clear();
      filterdLst_User = [...lstAllUser];
      return Right(filterdLst_User);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, List<DropDowenDataSource>>> getLstUserAsDataSource() async {
    try {
      LstUserAsDataSource.clear();
      if (lstAllUser.length == 0) {
        await getList_User();
      }
      for (var item in lstAllUser) {
        LstUserAsDataSource.add(DropDowenDataSource(valueMember: item.ID!, displayMember: item.Name!));
      }
      return Right(LstUserAsDataSource);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, String>> getNameByID(int? ID) async {
    try {
      String ret = '';
      if (lstAllUser.isNotEmpty && ID != null) {
        ret = lstAllUser.firstWhere((elm) {
          return elm.ID == ID;
        }).Name!;
      }
      return Right(ret);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, String>> addUserAuthentication(String email, String password, String name, String mobile) async {
    try {
      if (email.isEmpty && password.isEmpty) {
        sharedControls.toastNotification('لابد من إدخال البيانات كاملة', false);
      }
      String uid = await managmeFirebaseAuthentication.createUserWithEmailAndPassword(email, password);
      if (uid.isNotEmpty) {
        sharedConst.saveData(sharedConst.UID, uid);

        // save new user
        int selectedID = await Dealing_Users_Source.getMax_firestore(enTable_Dealing_Users.ID);
        int maxCode = await Dealing_Users_Source.getMax_firestore(enTable_Dealing_Users.Code);
        await saveItem(
            selectedID,
            Dealing_Users(
              ID: selectedID,
              UID: uid,
              EMail: email,
              Name: name,
              IsActive: true,
            ));
      }
      return Right(uid);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, UserCredential?>> loginUser(String email, String password) async {
    try {
      if (email.isEmpty && password.isEmpty) {
        sharedControls.toastNotification('لابد من إدخال البيانات كاملة', false);
        return Right(null);
      }
      var userCredential = await managmeFirebaseAuthentication.signInWithEmailAndPassword(email, password);
      if (userCredential != null) {
        sharedConst.saveData(sharedConst.UID, userCredential.user!.uid);
        sharedControls.toastNotification('تم تسجيل الدخول بنجاح', true);
      }
      return Right(userCredential);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, Unit>> changeUserPassword(String email, String oldPassword, String password) async {
    try {
      if (email.isEmpty && password.isEmpty) {
        sharedControls.toastNotification('لابد من إدخال البيانات كاملة', false);
        return Right(unit);
      }
      var userCredential = await loginUser(email, oldPassword);
      userCredential.fold(
        (l) => l,
        (result) {
          result!.user!.updatePassword(password);
          sharedControls.toastNotification('تم تغيير كلمة السر بنجاح', true);
        },
      );

      return Right(unit);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, int>> getMax(enTable_Dealing_Users colName) async {
    try {
      return Right(await Dealing_Users_Source.getMax_firestore(colName));
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, Unit>> saveItem(int selectedID, Dealing_Users user) async {
    try {
      await Dealing_Users_Source.fire_SetItem(selectedID.toString(), user);

      return Right(unit);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }

  Future<Either<failuer, Unit>> deleteItem(int selectedID) async {
    try {
      await Dealing_Users_Source.fire_DeleteItem(selectedID.toString());

      return Right(unit);
    } on exception_ServerError {
      return Left(failuer_ServerError());
    }
  }
}
