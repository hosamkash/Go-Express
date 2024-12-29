import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../../../Core/Enumerators/en_CondionsWhere.dart';
import '../../../../../Core/ManageTables/ManageBLL.dart';
import 'Dealing_Users_Model.dart';

class Dealing_Users_Source {
  static List<String> ColumnsName = enTable_Dealing_Users.values.map((item) => item.name).toList();
  static String query = '';

//**************************** general function ****************************

  static Future<int> getMaxID_firestore() async {
    int maxID = 0;
    await FirebaseFirestore.instance
        .collection(en_TablesName.Dealing_Users.name)
        .orderBy(enTable_Dealing_Users.ID.name, descending: true)
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        maxID = 1;
      } else {
        maxID = value.docs.first.get(enTable_Dealing_Users.ID.name);
        maxID += 1;
      }
    }).catchError((error) {
      print(error.toString());
      throw error;
    });
    return maxID;
  }

  static Future<int> getMax_firestore(enTable_Dealing_Users colName, {BLLCondions? condion}) async {
    int maxID = 1;
    QuerySnapshot? snapshot;
    try {
      if (condion != null) {
        snapshot = await FirebaseFirestore.instance
            .collection(en_TablesName.Dealing_Users.name)
            .where(condion.columnName, isEqualTo: condion.value)
            .orderBy(colName.name, descending: true)
            .limit(1)
            .get();
      } else if (condion == null) {
        snapshot =
            await FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name).orderBy(colName.name, descending: true).limit(1).get();
      }
      if (snapshot != null && snapshot.docs.isNotEmpty) {
        maxID = snapshot.docs.first.get(colName.name);
        maxID += 1;
      }
    } catch (error) {
      print(error.toString());
      throw error;
    }
    return maxID;
  }

//**************************** add & set ****************************

  static Future<bool> fire_SetItemMap(String docName, Map<String, dynamic> itemDealing_Users) async {
    bool result = false;
    await FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name).doc(docName).set(itemDealing_Users).then((val) {
      result = true;
    }).catchError((error) {
      print(error.toString());
      throw error;
    });
    return result;
  }

  static Future<bool> fire_SetItem(String docName, Dealing_Users itemDealing_Users) async {
    bool result = false;
    await FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name).doc(docName).set(itemDealing_Users.toJson()).then((val) {
      result = true;
    }).catchError((error) {
      print(error.toString());
      throw error;
    });
    return result;
  }

  static Future fire_setListMaster_And_Details({
    required String insertdDocID,
    required Dealing_Users itemDealing_Users,
    required String collectionDetailsName,
    required String columnNameAsDocumentDetails,
    required List<Map<String, dynamic>> detais,
    required List<Map<String, dynamic>> deletedItemsDetais,
  }) async {
    CollectionReference coll = FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name);
    DocumentReference tablemasterDocref = coll.doc(insertdDocID);
    WriteBatch batch = FirebaseFirestore.instance.batch();
    // save Master
    batch.set(tablemasterDocref, itemDealing_Users.toJson());
    // delete old items it removed from list
    for (var item in deletedItemsDetais) {
      DocumentReference itemRefDelete = tablemasterDocref.collection(collectionDetailsName).doc(item[columnNameAsDocumentDetails].toString());
      batch.delete(itemRefDelete);
    }
    // add Details and save
    for (var item in detais) {
      DocumentReference itemRef = tablemasterDocref.collection(collectionDetailsName).doc(item[columnNameAsDocumentDetails].toString());
      // Save details
      batch.set(itemRef, item);
    }
    await batch.commit();
  }

  static Future fire_setListMaster({
    required List<Dealing_Users> lstDealing_Users,
  }) async {
    CollectionReference coll = FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name);
    WriteBatch batch = FirebaseFirestore.instance.batch();
    lstDealing_Users.forEach((elm) {
      DocumentReference docRef = coll.doc(elm.ID.toString());
      batch.set(docRef, elm.toJson());
    });
    await batch.commit();
  }

//**************************** get ****************************

  static Future<Dealing_Users> fire_getItem(String docName) async {
    late Dealing_Users itemDealing_Users;
    try {
      var retValue = await FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name).doc(docName).get();
      itemDealing_Users = Dealing_Users(
        ID: retValue.data()!['ID'] ?? 0,
        UID: retValue.data()!['UID'] ?? '',
        Name: retValue.data()!['Name'] ?? '',
        EMail: retValue.data()!['EMail'] ?? '',
        IsActive: retValue.data()!['IsActive'] ?? false,
        );
      return itemDealing_Users;
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  static Future<List<Dealing_Users>> fire_getListWithConditions({List<BLLCondions>? conditions}) async {
    CollectionReference colRef = FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name);
    Query query = colRef;
    if (conditions != null) {
      for (var cond in conditions) {
        if (cond.where == en_CondionsWhere.isNull)
          query = query.where(cond.columnName, isNull: cond.value);
        else if (cond.where == en_CondionsWhere.isEqualTo)
          query = query.where(cond.columnName, isEqualTo: cond.value);
        else if (cond.where == en_CondionsWhere.isNotEqualTo)
          query = query.where(cond.columnName, isNotEqualTo: cond.value);
        else if (cond.where == en_CondionsWhere.isLessThan)
          query = query.where(cond.columnName, isLessThan: cond.value);
        else if (cond.where == en_CondionsWhere.isLessThanOrEqualTo)
          query = query.where(cond.columnName, isLessThanOrEqualTo: cond.value);
        else if (cond.where == en_CondionsWhere.isGreaterThan)
          query = query.where(cond.columnName, isGreaterThan: cond.value);
        else if (cond.where == en_CondionsWhere.isGreaterThanOrEqualTo)
          query = query.where(cond.columnName, isGreaterThanOrEqualTo: cond.value);
        else if (cond.where == en_CondionsWhere.whereIn)
          query = query.where(cond.columnName, whereIn: cond.value);
        else if (cond.where == en_CondionsWhere.whereNotIn)
          query = query.where(cond.columnName, whereNotIn: cond.value);
        else if (cond.where == en_CondionsWhere.arrayContains)
          query = query.where(cond.columnName, arrayContains: cond.value);
        else if (cond.where == en_CondionsWhere.arrayContainsAny) query = query.where(cond.columnName, arrayContainsAny: cond.value);
      }
    }
    QuerySnapshot snap = await query.get();
    List<Dealing_Users> lstDealing_Users = [];
    Dealing_Users itemModel;
    snap.docs.forEach((element) {
      itemModel = Dealing_Users.fromJson(element.data() as Map<String, dynamic>);
      lstDealing_Users.add(itemModel);
      lstDealing_Users.sort((a, b) => a.ID!.compareTo(b.ID!));
    });
    return lstDealing_Users;
  }

//**************************** delete ****************************

  static Future<bool> fire_DeleteItem(String docName) async {
    bool result = false;
    await FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name).doc(docName).delete().then((val) {
      result = true;
    }).catchError((error) {
      print(error.toString());
      result = false;
    });
    return result;
  }

  static Future fire_DeleteListMaster(List<BLLCondions> conditions) async {
    CollectionReference colRef = FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name);
    Query query = colRef;
    for (var cond in conditions) {
      if (cond.where == en_CondionsWhere.isNull)
        query = query.where(cond.columnName, isNull: cond.value);
      else if (cond.where == en_CondionsWhere.isEqualTo)
        query = query.where(cond.columnName, isEqualTo: cond.value);
      else if (cond.where == en_CondionsWhere.isNotEqualTo)
        query = query.where(cond.columnName, isNotEqualTo: cond.value);
      else if (cond.where == en_CondionsWhere.isLessThan)
        query = query.where(cond.columnName, isLessThan: cond.value);
      else if (cond.where == en_CondionsWhere.isLessThanOrEqualTo)
        query = query.where(cond.columnName, isLessThanOrEqualTo: cond.value);
      else if (cond.where == en_CondionsWhere.isGreaterThan)
        query = query.where(cond.columnName, isGreaterThan: cond.value);
      else if (cond.where == en_CondionsWhere.isGreaterThanOrEqualTo)
        query = query.where(cond.columnName, isGreaterThanOrEqualTo: cond.value);
      else if (cond.where == en_CondionsWhere.whereIn)
        query = query.where(cond.columnName, whereIn: cond.value);
      else if (cond.where == en_CondionsWhere.whereNotIn)
        query = query.where(cond.columnName, whereNotIn: cond.value);
      else if (cond.where == en_CondionsWhere.arrayContains)
        query = query.where(cond.columnName, arrayContains: cond.value);
      else if (cond.where == en_CondionsWhere.arrayContainsAny) query = query.where(cond.columnName, arrayContainsAny: cond.value);
    }
    QuerySnapshot snap = await query.get();
    WriteBatch batch = FirebaseFirestore.instance.batch();
    snap.docs.forEach((element) {
      batch.delete(colRef.doc(element.id));
    });
    batch.commit();
  }

  static Future<bool> fire_DeleteListMaster_And_Details(String docName, String subCollectionName) async {
    // specify Main Collection
    CollectionReference coll = FirebaseFirestore.instance.collection(en_TablesName.Dealing_Users.name);
    // Mention to Document
    DocumentReference tablemasterDocref = coll.doc(docName);
    // Mention to subCollection
    CollectionReference subCollection = tablemasterDocref.collection(subCollectionName);
    // get all documents from subCollection
    QuerySnapshot snapshot = await subCollection.get();
    // delete process
    WriteBatch batch = FirebaseFirestore.instance.batch();
    // delete all sub documents & collections & fields
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    // final delete from batch ==> commit : to submit all changes
    await batch.commit();
    coll.doc(docName).delete();
    return true;
  }

//**************************** Upload Files ****************************

  static Future<String> storage_UploadFile(String fileName, File file, {String pathOnStorage = ''}) async {
    pathOnStorage = pathOnStorage.isEmpty ? en_TablesName.Dealing_Users.name : pathOnStorage;
    String fileDownloadURL = '';
    await firebase_storage.FirebaseStorage.instance.ref().child('${pathOnStorage}/${fileName}').putFile(file).then((fileUpload) async {
      await fileUpload.ref.getDownloadURL().then((URL) {
        fileDownloadURL = URL;
      });
    }).catchError((error) {
      print(error.toString());
      throw error;
    });
    return fileDownloadURL;
  }

  static Future<String> storage_GetFileDowenloadURL(String fileName, {String pathOnStorage = ''}) async {
    String fileDownloadURL = '';
    pathOnStorage = pathOnStorage.isEmpty ? en_TablesName.Dealing_Users.name : pathOnStorage;
    await firebase_storage.FirebaseStorage.instance.ref(pathOnStorage).child(fileName).getDownloadURL().then((URL) {
      fileDownloadURL = URL;
    }).catchError((error) {
      print(error.toString());
      throw error;
    });
    return fileDownloadURL;
  }

  static Future<bool> storage_DeleteFile(String fileName, {String pathOnStorage = ''}) async {
    bool result = false;
    pathOnStorage = pathOnStorage.isEmpty ? en_TablesName.Dealing_Users.name : pathOnStorage;
    await firebase_storage.FirebaseStorage.instance.ref().child('${pathOnStorage}/${fileName}').delete().then((val) {
      result = true;
    }).catchError((error) {
      print(error.toString());
      throw error;
    });
    return result;
  }
}
