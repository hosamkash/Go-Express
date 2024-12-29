 import '../Enumerators/en_Language.dart';
import '../Shared/sharedConst.dart';
import 'package:get/get.dart';

class startUpText {
  static startUpText instance = Get.find<startUpText>();
  String headerDashBoard = '';
  String erpSystem = '';
  String shop = '';
  String chat = '';
  String socialMedia = '';
  String offers = '';
  String settings = '';

  setTextByLanguage() {
    if (sharedConst.appLanguage == en_Language.Arabic) {
      headerDashBoard = 'برنامج فيجل للحسابات';
      erpSystem = 'نظام الحسابات';
      shop = 'المتجر الإلكتروني';
      chat = 'الشات والرسائل';
      socialMedia = 'السوشيال ميديا';
      offers = 'العروض';
      settings = 'الضبط والإعدادات';

    }
    //------------------------------------------
    else if (sharedConst.appLanguage == en_Language.English) {
      headerDashBoard = 'Vigil Solution System';
      erpSystem = 'ERP System';
      shop = 'Market Place';
      chat = 'Chat App';
      socialMedia = 'Social Media';
      offers = 'Offers';
      settings = 'Settings';
    }
    //------------------------------------------
    else if (sharedConst.appLanguage == en_Language.French) {
      headerDashBoard = 'Vigil Solution System';
      erpSystem = 'ERP System';
      shop = 'Market Place';
      chat = 'Chat App';
      socialMedia = 'Social Media';
      offers = 'Offers';
      settings = 'Settings';
    }
  }
}