import 'package:flutter/material.dart';
import '../Enumerators/en_AppKey.dart';
import '../Enumerators/en_DataTypeComon.dart';
import '../Enumerators/en_Language.dart';
import '../Enumerators/en_ThemeType.dart';
import '../Shared/sharedConst.dart';
import '../SharedFunctions/sharedFunctions_Location.dart';



class coreApp {
  static Future<void> initializeBasicPlugins() async {
    await WidgetsFlutterBinding.ensureInitialized();
    await getSavedDataCashed();
    sharedFunctions_Location.requestLocationPermission();
  }

  static Future getSavedDataCashed() async {
    // Language
    var lang = await sharedConst.getData(en_AppKey.appLanguage.name);
    if (lang == en_Language.Arabic.name)
      sharedConst.appLanguage = en_Language.Arabic;
    else if (lang == en_Language.English.name)
      sharedConst.appLanguage = en_Language.English;
    else if (lang == en_Language.French.name) sharedConst.appLanguage = en_Language.French;


    // ThemeType
    var theme = await sharedConst.getData(en_AppKey.appThemeType.name);
    if (theme != null && theme != '') {
      if (theme == en_ThemeType.LightTheme.name)
        sharedConst.appThemeType = en_ThemeType.LightTheme;
      else if (theme == en_ThemeType.DarkTheme.name)
        sharedConst.appThemeType = en_ThemeType.DarkTheme;
      else if (theme == en_ThemeType.CustomTheme.name) sharedConst.appThemeType = en_ThemeType.CustomTheme;
    } else
      sharedConst.appThemeType = en_ThemeType.LightTheme;

    sharedConst.isSkipBoarding = await sharedConst.getData(en_AppKey.isSkipBoarding.name, type: en_DataTypeComon.bool, defultValue: false);
  }


}
