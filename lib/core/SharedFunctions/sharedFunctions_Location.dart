import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class sharedFunctions_Location {
  // طلب إذن الموقع
  static void requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  static Future<Position> getCurrentLocation_Silent() async {
    bool serviceEnabled;
    LocationPermission permission;

    // تحقق مما إذا كانت الخدمة مفعلة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('خدمة الموقع غير مفعلة.');
    }

    // طلب إذن الموقع
    requestLocationPermission();

    await Geolocator.checkPermission().then((val) async {
      permission = val;
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('إذن الموقع مرفوض.');
        }
      } else if (permission == LocationPermission.deniedForever) {
        return Future.error('إذن الموقع مرفوض بشكل دائم.');
      }
    });

    // الحصول على الموقع باستخدام LocationSettings
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // المسافة التي يجب قطعها قبل تحديث الموقع
    );

    return await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }

  static Future<String> getCurrentLocation_AddressName(double latitude, double longitude) async {
    String addressName = '';
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        addressName = '${place.locality}, ${place.country}'; // يمكنك تعديل ذلك حسب الحاجة
      }
    } catch (e) {
      print('Error: $e');
    }
    return addressName;
  }

  static Future<String> getCurrentLocation_AddressName_API(double latitude, double longitude) async {
    final apiKey = 'AIzaSyA41jC2A5j1xszVh-Z2r_sFtiwC5ZzRmyM'; // استبدل بمفتاح API الخاص بك
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';
    String addressName = '';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'].isNotEmpty) {
          addressName = data['results'][0]['formatted_address'];
        } else {
          addressName = 'No address found';
        }
      } else {
        addressName = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      print('Error fetching address: $e');
      addressName = 'Error occurred while fetching address';
    }

    return addressName;
  }

  static Future openGoogleMap(double latitude, double longitude) async {
    final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final response = await http.get(Uri.parse(googleMapsUrl));
    if (response.statusCode == 200) {
      await launchUrl(
        Uri.parse(googleMapsUrl),
        mode: LaunchMode.externalApplication, // يفتح في تطبيق خارجي
      );
    }
  }

  static Future openGoogleMapByLink(String googleMapsUrl) async {
    final response = await http.get(Uri.parse(googleMapsUrl));
    if (response.statusCode == 200) {
      await launchUrl(
        Uri.parse(googleMapsUrl),
        mode: LaunchMode.externalApplication, // يفتح في تطبيق خارجي
      );
    }
  }


}