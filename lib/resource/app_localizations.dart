import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, String> _localizedStrings = {};

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Future<bool> load() async {
    // Load the language JSON file from the "assets/translations" folder
    String jsonString = await rootBundle.loadString('assets/translations/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

// Extension on String to make it easier to use
extension StringExtension on String {
  String localize(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}

// Class to hold all string keys
class AppStrings {
  // Intro
  static const WELCOME = "WELCOME";
  static const NAME = "NAME";
  static const WHAT_I_DO = "WHAT_I_DO";
  static const INTRO_ABOUT = "INTRO_ABOUT";
  static const INTRO_DESC = "INTRO_ABOUT"; // Alias for backward compatibility
  static const CURRENT_ORG_NAME = "CURRENT_ORG_NAME";
  
  // About
  static const ABOUT_PARA1 = "ABOUT_PARA1";
  static const ABOUT_PARA2 = "ABOUT_PARA2";
  static const ABOUT_PARA3 = "ABOUT_PARA3";
  static const TECH_INTRO = "TECH_INTRO";
  static const TECH1 = "TECH1";
  static const TECH2 = "TECH2";
  static const TECH3 = "TECH3";
  static const TECH4 = "TECH4";
  
  // Experience
  static const EXP_COMP_NAME1 = "EXP_COMP_NAME1";
  static const EXP_DESIG1 = "EXP_DESIG1";
  static const EXP_DUR1 = "EXP_DUR1";
  static const EXP_ABOUT1 = "EXP_ABOUT1";
  static const EXP_ABOUT1_2 = "EXP_ABOUT1_2";
  static const EXP_ABOUT1_3 = "EXP_ABOUT1_3";
  
  static const EXP_COMP_NAME2 = "EXP_COMP_NAME2";
  static const EXP_DESIG2 = "EXP_DESIG2";
  static const EXP_DUR2 = "EXP_DUR2";
  static const EXP_ABOUT2 = "EXP_ABOUT2";
  static const EXP_ABOUT2_2 = "EXP_ABOUT2_2";
  static const EXP_ABOUT2_3 = "EXP_ABOUT2_3";
  
  static const EXP_COMP_NAME3 = "EXP_COMP_NAME3";
  static const EXP_DESIG3 = "EXP_DESIG3";
  static const EXP_DUR3 = "EXP_DUR3";
  static const EXP_ABOUT3 = "EXP_ABOUT3";
  static const EXP_ABOUT3_2 = "EXP_ABOUT3_2";
  static const EXP_ABOUT3_3 = "EXP_ABOUT3_3";
  
  // Contact
  static const END_TXT = "END_TXT";
  
  // Sections
  static const SECTION_ABOUT = "SECTION_ABOUT";
  static const SECTION_EXPERIENCE = "SECTION_EXPERIENCE";
  static const SECTION_WORK = "SECTION_WORK";
  static const SECTION_GAMES = "SECTION_GAMES";
  static const SECTION_CONTACT = "SECTION_CONTACT";
  static const RESUME = "RESUME";
  
  // Common
  static const WHATS_NEXT = "WHATS_NEXT";
  static const GET_IN_TOUCH = "GET_IN_TOUCH";
  static const SAY_HELLO = "SAY_HELLO";
  static const CHECK_OUT_WORK = "CHECK_OUT_WORK";
  static const BUTTON_TEXT = "CHECK_OUT_WORK"; // Alias for backward compatibility
  static const CURRENT_ORG = "CURRENT_ORG_NAME"; // Alias for backward compatibility
  
  // Contact Form
  static const CONTACT_ME = "CONTACT_ME";
  static const NAME_FIELD = "NAME_FIELD";
  static const NAME_ERROR = "NAME_ERROR";
  static const CONTACT_INFO = "CONTACT_INFO";
  static const MESSAGE_FIELD = "MESSAGE_FIELD";
  static const MESSAGE_ERROR = "MESSAGE_ERROR";
  static const NOTE_TEXT = "NOTE_TEXT";
  static const SEND = "SEND";
  static const MESSAGE_SUCCESS = "MESSAGE_SUCCESS";
  static const MESSAGE_FAILURE = "MESSAGE_FAILURE";
  static const ERROR_OCCURRED = "ERROR_OCCURRED";
  
  // Footer
  static const BUILT_BY = "BUILT_BY";
  static const REF = "REF";
  
  // Projects
  static const MY_NOTEWORTHY_PROJECTS = "MY_NOTEWORTHY_PROJECTS";
  static const VIEW_ARCHIVES = "VIEW_ARCHIVES";
  static const NOT_FOUND = "NOT_FOUND";
  static const PROJECT_NOT_FOUND = "PROJECT_NOT_FOUND";
  
  // Games
  static const WARNING = "WARNING";
  static const PLAY_AREA_WARNING = "PLAY_AREA_WARNING";
  static const CANCEL = "CANCEL";
  static const CONFIRM = "CONFIRM";
  static const COMING_SOON = "COMING_SOON";
  static const ERROR = "ERROR";
  
  // Mobile
  static const MOBILE_ONLY_MESSAGE = "MOBILE_ONLY_MESSAGE";
  
  // Buttons
  static const OKAY = "OKAY";
  
  // Alert
  static const ALERT_TITLE = "WARNING";
  static const ALERT_MSG = "PLAY_AREA_WARNING";
} 