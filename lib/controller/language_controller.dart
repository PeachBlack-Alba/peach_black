import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider to store the current locale
final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

// Provider to get the list of supported locales
final supportedLocalesProvider = Provider<List<Locale>>((ref) => [
  const Locale('en'), // English
  const Locale('es'), // Spanish
]);

// Provider to get the current locale name
final localeNameProvider = Provider<String>((ref) {
  final locale = ref.watch(localeProvider);
  switch (locale.languageCode) {
    case 'en':
      return 'English';
    case 'es':
      return 'Español';
    default:
      return 'English';
  }
});

// Class to handle language changes
class LanguageController {
  final WidgetRef ref;

  LanguageController(this.ref);

  // Change the current language
  void changeLanguage(String languageCode) {
    ref.read(localeProvider.notifier).state = Locale(languageCode);
  }

  // Get the current language code
  String getCurrentLanguageCode() {
    return ref.read(localeProvider).languageCode;
  }

  // Get the current language name
  String getCurrentLanguageName() {
    return ref.read(localeNameProvider);
  }

  // Get the list of supported languages
  List<Locale> getSupportedLocales() {
    return ref.read(supportedLocalesProvider);
  }
} 