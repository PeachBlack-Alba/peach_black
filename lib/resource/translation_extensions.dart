import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/language_provider.dart';
import '../services/translation_service.dart';

// Reactive translation extension for ConsumerWidget
extension ReactiveTranslationExtension on String {
  // For use in ConsumerWidget - triggers rebuild when language changes
  String tr(WidgetRef ref) {
    ref.watch(translationProvider); // This triggers rebuild when language changes
    return TranslationService.instance.translate(this);
  }
}

// Helper function for reactive translations
String getTranslation(String key, WidgetRef ref) {
  ref.watch(translationProvider); // This triggers rebuild when language changes
  return TranslationService.instance.translate(key);
}