import 'package:firebase_auth/firebase_auth.dart';

import '../Shared/shared_controls.dart';

class managmeFirebaseAuthentication {
  static Future<String> createUserWithEmailAndPassword(String email, String password , { String name = '' , String mobile = ''}) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((user) {
    // set other date
      user.user!.updateDisplayName(name)   ;
      return user.user!.uid;
    }).catchError((error) {
      print(error);
      throw error;
    });
  }

  static Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    UserCredential? user ;
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      String message = '';
      if (error.code == 'invalid-credential') {
        message = 'البيانات المدخلة غير صحيحة أو منتهية.';
      } else if (error.code == 'user-not-found') {
        message = 'لا يوجد مستخدم بهذا البريد الإلكتروني.';
      } else if (error.code == 'wrong-password') {
        message = 'كلمة المرور غير صحيحة.';
      } else {
        message = 'حدث خطأ غير متوقع.';
      }
      sharedControls.toastNotification(message, false);
    }
    return user;

  }
}
