import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

class sharedFunctions_ContactsPhone {
  // static List<Contact> phoneContactsList = [];

  static Future<void> openContactsPicker() async {
    Uri url = Uri.parse('content://contacts/people/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void phoneNumber_Call(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static void phoneNumber_SMS(String phoneNumber, String messege) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': messege,
        // 'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );
    await launchUrl(smsLaunchUri);
  }

  static void phoneNumber_WhatsApp(String phoneNumber, String message) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/2$phoneNumber&text=${message})');

    // التحقق مما إذا كان يمكن فتح الرابط
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  static void phoneNumber_Telegram(String phoneNumber, String message) async {
    final telegramUrl = 'https://t.me/+2${phoneNumber}?text=${Uri.encodeComponent(message)}';
    final response = await http.get(Uri.parse(telegramUrl));
    if (response.statusCode == 200) {
      //if (await canLaunchUrlString(telegramUrl)) {
      await launchUrlString(
        telegramUrl,
        mode: LaunchMode.platformDefault, // يفتح في تطبيق خارجي
      );
      // }
    }

    // // التحقق مما إذا كان يمكن فتح الرابط
    //final Uri telegramUri = Uri.parse('https://t.me/+${phoneNumber}?text=${Uri.encodeComponent(message)}');
    // if (await canLaunch(telegramUri.toString())) {
    //   await launch(telegramUri.toString());
    // } else {
    //   throw 'Could not launch $telegramUri';
    // }
  }

  static void sendEmail(String number) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );
    launchUrl(emailLaunchUri);
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }
}