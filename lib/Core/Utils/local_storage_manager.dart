import 'dart:io';

import 'package:bookly_flutter_app/Core/Utils/shared_prefrences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  // Singleton instance
  // this line created only on instance
  static final LocalStorageManager _instance = LocalStorageManager._internal();

  // to check if instance already been created or not
  factory LocalStorageManager() {
    return _instance;
  }

  LocalStorageManager._internal(); // Private constructor to prevent class create instance outside

  // Keys
  static const String _accessTokenKey = "accessToken";
  static const String _ksecureClearFlag = "KSecureClearFlag";

  // Setters
  Future<void> setAccessToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token ?? "");
  }

  // Getters
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  // Clear All Data
  Future<void> clearAllNormalAndSecureData() async {
    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.clearAllData();
  }

  // Check if user is logged in
  Future<bool> checkedIfUserLoggedInUser() async {
    String? userToken =
        await SharedPrefHelper.getSecuredString(_accessTokenKey);
    return userToken != null && userToken.isNotEmpty;
  }

  // Check to clear secure local data in iOS
  Future<bool> checkToClearSecureLocalDataInIOS() async {
    if (Platform.isIOS) {
      final clearData =
          await SharedPrefHelper.getBool(_ksecureClearFlag) ?? false;
      if (!clearData) {
        await SharedPrefHelper.clearAllSecuredData();
      }
      return !clearData;
    }
    return false;
  }
}
