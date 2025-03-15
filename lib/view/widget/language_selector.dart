import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peach_black/controller/language_controller.dart';
import 'package:peach_black/resource/colors.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final languageController = LanguageController(ref);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors().neonColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentLocale.languageCode,
          icon: Icon(Icons.language, color: AppColors().neonColor, size: 16),
          dropdownColor: AppColors().cardColor,
          style: TextStyle(color: AppColors().textColor, fontSize: 12),
          onChanged: (String? newValue) {
            if (newValue != null) {
              languageController.changeLanguage(newValue);
            }
          },
          items: [
            DropdownMenuItem<String>(
              value: 'en',
              child: Text('English'),
            ),
            DropdownMenuItem<String>(
              value: 'es',
              child: Text('Español'),
            ),
          ],
        ),
      ),
    );
  }
} 