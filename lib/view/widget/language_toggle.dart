import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/language_provider.dart';
import '../../resource/colors.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final languageNotifier = ref.read(languageProvider.notifier);

    return InkWell(
      onTap: () {
        final newLanguage = currentLanguage == 'en' ? 'es' : 'en';
        languageNotifier.changeLanguage(newLanguage);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors().neonColor, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          currentLanguage == 'en' ? 'ES' : 'EN',
          style: TextStyle(
            color: AppColors().neonColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'sfmono',
          ),
        ),
      ),
    );
  }
}