import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import '../Enumerators/en_CondionsWhere.dart';

enum en_TablesName {
  Dealing_Users,

}

class ManageBLL {
  static Future fire_SetListBy_WriteBatch(
      String TableMaster, String TableDetails, Map<String, dynamic> master, List<Map<String, dynamic>> detais) async {
    CollectionReference coll = FirebaseFirestore.instance.collection(TableMaster);
    DocumentReference tablemasterDocref = coll.doc();
    WriteBatch batch = FirebaseFirestore.instance.batch();
    batch.set(tablemasterDocref, master);
    for (var item in detais) {
      DocumentReference itemRef = tablemasterDocref.collection(TableDetails).doc();
      batch.set(itemRef, item);
    }
    await batch.commit();
  }

  static Future<List<String>> storage_GetAllFilesDowenloadURLs(String path) async {
    List<String> lstFilesDownloadURL = [];
    try {
      ListResult lstResult = await firebase_storage.FirebaseStorage.instance.ref().child(path).listAll();
      for (var item in lstResult.items) {
        String downloadUrl = await item.getDownloadURL();
        lstFilesDownloadURL.add(downloadUrl);
      }
    } catch (error) {
      throw error;
    }
    return lstFilesDownloadURL;
  }


}

class BLLCondions {
  String columnName;
  en_CondionsWhere where;
  dynamic value;

  BLLCondions(this.columnName, this.where, this.value);
}
