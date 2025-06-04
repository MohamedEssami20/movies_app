// creat shared pref service
import 'dart:developer';

import 'package:movies_app/core/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  // create instance of shared pref
  static late SharedPreferences _prefs;

  // init shared pref service
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // create method that set bool at if user show on boarding;
  Future<void> setOnboardingShow(bool showed) async {
    await _prefs.setBool(AppConstants.showBoardingKey, showed);
    log("save true ***");
  }

  // create method that check if user show onboarding or not
  bool showOnboarding() => _prefs.getBool(AppConstants.showBoardingKey) ?? false;
}
