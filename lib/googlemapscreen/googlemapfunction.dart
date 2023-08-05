import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async {
    String googleMapURL =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    launch(googleMapURL);
  }
}
