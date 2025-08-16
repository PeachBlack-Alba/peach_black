import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peach_black/providers/language_provider.dart';
import 'package:peach_black/resource/app_localizations.dart';
import 'package:peach_black/resource/colors.dart';
import 'package:peach_black/services/translation_service.dart';
import 'package:peach_black/view/root.dart';
import 'package:peach_black/view/widget/aurora_background.dart';

void main() {
  runApp(const ProviderScope(child: AppTheme()));
}

class AppTheme extends ConsumerWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(languageProvider);
    final locale = ref.watch(localeProvider);
    final supportedLocales = ref.watch(supportedLocalesProvider);

    // Translations will be loaded in the FutureBuilder below

    return FutureBuilder(
      future: TranslationService.instance.loadTranslations(languageCode),
      builder: (context, snapshot) {
        return MaterialApp(
          key: ValueKey(languageCode), // Force rebuild with new key when language changes
          title: 'PORTFOLIO',
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: AppColors().primaryColor,
          ),
          locale: locale,
          supportedLocales: supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Aurora(
            colorStops: const [
              Color(0xFF3A29FF), // #3A29FF - Deep blue
              Color(0xFFFF94B4), // #FF94B4 - Pink
              Color(0xFFFF3232), // #FF3232 - Red
            ],
            blend: 0.7,         // Increased blend for smoother transitions
            amplitude: 1.2,     // Slightly increased amplitude for more pronounced effect
            speed: 0.4,         // Adjusted speed for a nice flowing effect
            child: const RootScreen(),
          ),
        );
      },
    );
  }
}
