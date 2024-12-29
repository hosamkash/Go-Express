 import '../Enumerators/en_Language.dart';
import '../Shared/sharedConst.dart';
import 'package:get/get.dart';

class settingsText {
  static settingsText instance = Get.find<settingsText>();
  String settings = '';
  String changeUser = '';
  String updateAppkication = '';
  String backup = '';
  String restart = '';

  setTextByLanguage() {
    if (sharedConst.appLanguage == en_Language.Arabic) {
      settings = 'الضبط الإعدادات';
      changeUser = 'تغيير المستخدم';
      updateAppkication = 'تحديثات التطبيق';
      backup = 'النسخ الإحتياطية';
      restart = 'إعادة التشغيل';
    }
    //------------------------------------------
    else if (sharedConst.appLanguage == en_Language.English) {
    }
    //------------------------------------------
    else if (sharedConst.appLanguage == en_Language.French) {}
  }
}