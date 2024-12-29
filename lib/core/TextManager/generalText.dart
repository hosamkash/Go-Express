import 'dart:ui';
import '../Enumerators/en_Language.dart';
import '../Shared/sharedConst.dart';

class generalText {
  static String empty = '';
  static String spaceOne = ' ';
  static String newLine = '/n';
  static String? nullText = null;
  static String backSlash = '/';
  static String dot = '.';
  static String bind = ':';
  static String x = ' x ';
  static String pecentage = ' % ';
  static String equal = ' = ';
  static String nikeAppName = '';
  static String active = '';
  static String alertImportant = '';
  static String confirm = '';
  static String cancel = '';
  static String share = '';
  static String main = '';
  static String select = '';
  static String searchResult = '';
  static String loadData = '';
  static String reLoadDataSuccssed = '';
  static String uploadImageSuccssed = '';
  static String currentBalance = '';
  static String location = '';
  static String status = '';
  static String note = '';
  static String getLocationFromMap = '';
  static String getAddressFromLocation = '';
  static String getLocation = '';
  static String locationLongitude = '';
  static String latetudeLine = '';
  static String longitudeLine = '';
  static String openMap = '';
  static String limitCredit = '';
  static String useInShop = '';
  static String email = '';
  static String savedSuccssefuly = '';
  static String savedError = '';
  static String close = '';
  static String tabMainData = '';
  static String dataSendedIsFalse = '';
  static String isConnected = '';
  static String isDisConnected = '';
  static String treasuryMovementDetails = '';
  static var search = '';
  static var save = '';
  static var mobileMandatory = '';
  static var logout = '';
  static String editData = '';
  static String pound = ' ';
  static String time = '';
  static String count = '';
  static String confirmDelete = '';
  static String headerDashBoard = '';

  static String manageScreens = '';
  static String clientScreens = '';
  static String btnClientScreen = '';
  static String btnLogin = '';
  static String btnNewUser = '';
  static String btnAccountUser = '';
  static String btnClients = '';
  static String btnTripManagement = '';
  static String btnManageReservations = '';
  static String btnPaymentManagement = '';
  static String mustEnterData = '';
  static String mobile = '';
  static String name = '';

  static String changeUserPass = '';
  static String oldPassWord = '';
  static String newPassWord = '';
  static String confirmPass = '';
  static String change = '';
  static String toCreateAccountPressHere = '';
  static String newAccount = '';
  static String mustEqualTwoPass = '';
  static String login = '';
  static String password = '';
  static String newUserAccount = '';
  static String errorLogin = '';
  static String userData = '';

  static Locale? getLanguageAsLocale() {
    if (sharedConst.appLanguage == en_Language.Arabic)
      return Locale('ar');
    else if (sharedConst.appLanguage == en_Language.English)
      return Locale('en');
    else if (sharedConst.appLanguage == en_Language.French)
      return Locale('fr');
    else
      return Locale('ar');
  }

  static setTextByLanguage() {
    if (sharedConst.appLanguage == en_Language.Arabic) {
      manageScreens = 'شاشات الإدارة';
      clientScreens = 'شاشات العميل';
      nikeAppName = 'جو إكسبريس - Go Express';
      btnLogin = 'تسجيل الدخول';
      btnNewUser = 'مستخدم جديد';
      btnAccountUser = 'حساب المستخدم';
      btnClients = 'عرض العملاء';
      btnTripManagement = 'إدارة الرحلات';
      btnManageReservations = 'إدارة الحجوزات';
      btnPaymentManagement = 'إدارة المدفوعات';

      active = 'نشط';
      alertImportant = 'تنبيه هام';
      confirm = 'تأكيد';
      cancel = 'إلغاء';
      share = 'مشاركة';
      main = 'رئيسي';
      select = 'إختيار';
      searchResult = 'بيانات البحث';
      loadData = 'تحميل البيانات';
      reLoadDataSuccssed = 'تم إعادة تحميل البيانات من السيرفر بنجاح';
      uploadImageSuccssed = 'تم رفع الصور بنجاح';
      currentBalance = 'الرصيد الحالى';
      location = 'اللوكيشن';
      status = 'الحالة';
      note = 'ملاحظات';
      getLocationFromMap = 'العنوان تفصيلي من الخريطة';
      getAddressFromLocation = 'جلب العنوان من اللوكيشن';
      getLocation = 'الحصول على اللوكيشن';
      locationLongitude = ''; // as  'https://www.google.com/maps/search/?api=1&query=';
      latetudeLine = 'خط العرض';
      longitudeLine = 'خط الطول';
      openMap = 'فتح الخريطة';
      limitCredit = 'الحد الإئتماني';
      useInShop = 'يستخدم فى المتجر';
      email = 'الإيميل';
      savedSuccssefuly = 'تم الحفظ بنجاح';
      savedError = 'حدث خطأ في الحفظ';
      close = 'مستند مغلق';
      tabMainData = 'البيانات الأساسية';
      dataSendedIsFalse = 'البيانات المرسلة غير صحيحة , برجاء التأكد من المسار';
      isConnected = 'متصل';
      isDisConnected = 'غير متصل';
      treasuryMovementDetails = 'حركة الخزينة تفصيلي';
      search = 'بحث';
      save = 'حفظ';
      mobileMandatory = 'الموبيل(إجباري)';
      logout = 'تسجيل خروج';
      editData = 'تعديل البيانات';
      pound = ' جنية';
      time = 'الساعة ';
      count = 'العدد ';
      confirmDelete = 'هل تريد تأكيد الحذف';
      mustEnterData = 'لابد من إدخال قيمة';
      name = 'الإسم';
      mobile = 'الموبيل';

      changeUserPass = 'تغيير كلمة السر للمستخدم';
      oldPassWord = 'كلمة السر القديمة';
      newPassWord = 'كلمة السر الجديدة';
      confirmPass = 'تأكيد كلمة السر';
      change = 'تغيير';
      toCreateAccountPressHere = 'إذا كنت لا تمتلك حساب إضغط هنا ..';
      newAccount = 'حساب جديد';
      mustEqualTwoPass = 'لابد من تطابق كلمة السر الجديدة';
      login = 'تسجيل الدخول';
      password = 'كلمة السر';
      newUserAccount = 'إنشاء مستخدم جديد';
      errorLogin = 'خطأ فى تسجيل المستخدم';
      userData = 'بيانات المستخدم';
    }
    //------------------------------------------
    else if (sharedConst.appLanguage == en_Language.English) {
      nikeAppName = 'Vigil Express Accounts';
      active = 'active';
      alertImportant = 'alertImportant';
      confirm = 'confirm';
      cancel = 'cancel';
      share = 'share';
      main = 'main';
      select = 'select';
      searchResult = 'search Result';
      loadData = 'load Data';
      reLoadDataSuccssed = 'reLoad Data with succssed';
      uploadImageSuccssed = 'upload image with succssed';
      currentBalance = 'current Balance';
      useInShop = 'use In Shop';
    }
    //------------------------------------------
    else if (sharedConst.appLanguage == en_Language.French) {}
  }
}
