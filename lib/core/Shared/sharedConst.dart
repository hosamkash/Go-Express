 import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../Enumerators/en_DataTypeComon.dart';
import '../Enumerators/en_Language.dart';
import '../Enumerators/en_ThemeType.dart';
import '../TextManager/generalText.dart';

class sharedConst {
  static en_ThemeType appThemeType = en_ThemeType.LightTheme;
  static en_Language appLanguage = en_Language.Arabic;
  static bool isSkipBoarding = false;
  static String UID = '';
  static String nikeAppName = generalText.nikeAppName;
  static String path = '';


  //************************  HIVE **********************
  static void initial() async {
    // ثابت فى اي مثود
    final ApppDirectory = await getApplicationDocumentsDirectory();
    path = ApppDirectory.path;
    Hive.init(ApppDirectory.path);
  }

  static resetAllData() async {
    Hive.deleteBoxFromDisk(path);
  }

  static remove(String key) async {
    initial();
    await Hive.deleteBoxFromDisk(key, path: path).then((value) {
    });
  }

  static Future saveData(String key, dynamic Value) async {
    // ********************************* ثابت فى اي مثود
    final ApppDirectory = await getApplicationDocumentsDirectory();
    Hive.init(ApppDirectory.path);
    Hive.openBox(key).then((box) {
      box.put(key, Value).then((put) {
        print('Value put : ${box.get(key)}');
      });
    });
  }

  static Future getData(String key, {dynamic defultValue, en_DataTypeComon type = en_DataTypeComon.string}) async {
    try {
      dynamic ApppDirectory;
      await getApplicationDocumentsDirectory().then((val) {
        ApppDirectory = val;
      });

      Hive.init(ApppDirectory.path);
      var boxExists = await Hive.boxExists(key, path: ApppDirectory.path);
      var box;
      var get;
      if (!boxExists) {
        return castTypeReturned(null, type);
      }
    //*********************************
      else {
        box = await Hive.openBox(key);
        get = await box.get(key);
        if (get == null) {
          box.put(key, defultValue);
          get = await box.get(key);
        }
        return castTypeReturned(get, type);
      }
    } catch (error) {}
  }

  static Future castTypeReturned(dynamic get, en_DataTypeComon type) async {
    if (type == en_DataTypeComon.bool)
      return get != null ? get as bool : false;
    else if (type == en_DataTypeComon.string)
      return get != null ? get as String : '';
    else if (type == en_DataTypeComon.double)
      return get != null ? get as double : 0.0;
    else if (type == en_DataTypeComon.int) return get != null ? get as int : -1;
  }
}
