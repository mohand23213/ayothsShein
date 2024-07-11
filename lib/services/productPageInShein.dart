import 'package:url_launcher/url_launcher.dart';

class SheinProduct{
  static void openProductPage(String url){
    launchUrl(Uri.parse(url));
  }
}