import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/translation_service.dart';

// Main language provider that manages both language state and translation service
class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('en') {
    _initializeLanguage();
  }
  
  Future<void> _initializeLanguage() async {
    await TranslationService.instance.loadTranslations(state);
  }
  
  Future<void> changeLanguage(String languageCode) async {
    if (languageCode != state) {
      await TranslationService.instance.changeLanguage(languageCode);
      state = languageCode;
    }
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier();
});

// Locale provider that derives from language provider
final localeProvider = Provider<Locale>((ref) {
  final languageCode = ref.watch(languageProvider);
  return Locale(languageCode);
});

// Translation service provider that rebuilds when language changes
final translationProvider = Provider<TranslationService>((ref) {
  ref.watch(languageProvider); // This makes it rebuild when language changes
  return TranslationService.instance;
});

// Supported locales provider
final supportedLocalesProvider = Provider<List<Locale>>((ref) => [
  const Locale('en'), // English
  const Locale('es'), // Spanish
]);

// Language name provider
final localeNameProvider = Provider<String>((ref) {
  final languageCode = ref.watch(languageProvider);
  switch (languageCode) {
    case 'en':
      return 'English';
    case 'es':
      return 'Español';
    default:
      return 'English';
  }
});