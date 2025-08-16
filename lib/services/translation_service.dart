import 'dart:convert';
import 'package:flutter/services.dart';

class TranslationService {
  static TranslationService? _instance;
  static TranslationService get instance => _instance ??= TranslationService._();
  
  TranslationService._();
  
  Map<String, dynamic> _translations = {};
  String _currentLanguage = 'en';
  
  String get currentLanguage => _currentLanguage;
  
  Future<void> loadTranslations(String languageCode) async {
    if (_currentLanguage == languageCode && _translations.isNotEmpty) {
      return; // Already loaded this language
    }
    _currentLanguage = languageCode;
    try {
      final String jsonString = await rootBundle.loadString('assets/translations/$languageCode.json');
      _translations = json.decode(jsonString);
    } catch (e) {
      print('Error loading translations for $languageCode: $e');
      // Fallback to empty translations
      _translations = {};
    }
  }
  
  String translate(String key) {
    return _translations[key] ?? key;
  }
  
  Future<void> changeLanguage(String languageCode) async {
    if (languageCode != _currentLanguage) {
      await loadTranslations(languageCode);
    }
  }
}

// Extension for easy access - NOTE: This is not reactive
// For reactive translations, components should be ConsumerWidget and use ref.watch(languageProvider)
extension TranslationExtension on String {
  String get tr => TranslationService.instance.translate(this);
}