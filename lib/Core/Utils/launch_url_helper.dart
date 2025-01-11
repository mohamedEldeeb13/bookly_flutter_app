import 'package:url_launcher/url_launcher.dart';

class LaunchUrlHelper {
  // Singleton instance
  static final LaunchUrlHelper _instance = LaunchUrlHelper._();

  // Factory method to get the singleton instance
  factory LaunchUrlHelper() => _instance;

  LaunchUrlHelper._(); // private constarctor

  // Method to check if a string contains Arabic characters

  void launchURL(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(
            uri,
            mode: LaunchMode.inAppWebView,
          );
        } else {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
