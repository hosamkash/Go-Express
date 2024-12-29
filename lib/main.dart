import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_express_test/core/TextManager/generalText.dart';
import 'package:go_express_test/features/Startup/scr2_DashBoard.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     generalText.setTextByLanguage();


  return ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    child:
    GetMaterialApp(

      locale: generalText.getLanguageAsLocale(),
      // Set locale to Arabic for RTL
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      //theme: themeManager.currentTheme(state is AppThemeChanged_State ? true : false),
      // showPerformanceOverlay: true, // بيفتح رسم بياني لأداء التطبيق فى نفس الشاشة
      home: scr2_DashBoard() ,
    ),
  );
  }
}
