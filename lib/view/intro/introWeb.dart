
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../resource/app_localizations.dart';
import '../../resource/appClass.dart';
import '../../resource/colors.dart';
import '../../services/translation_service.dart';

class IntroWeb extends StatefulWidget {
  AutoScrollController aScrollController;

  IntroWeb(this.aScrollController, {Key? key}) : super(key: key);

  @override
  State<IntroWeb> createState() => _IntroWebState();
}

class _IntroWebState extends State<IntroWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(
        left: AppClass().getMqWidth(context) * 0.03, 
        right: AppClass().getMqWidth(context) * 0.03, 
        top: AppClass().getMqHeight(context) * 0.1,
        bottom: AppClass().getMqHeight(context) * 0.05
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 50),
                child: Text(
                  'WELCOME'.tr,
                  style: TextStyle(color: AppColors().neonColor, fontSize: 18, fontFamily: 'sfmono'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'NAME'.tr,
                  style: GoogleFonts.robotoSlab(
                    color: AppColors().textColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 55,
                  ),
                ),
              ),
              Container(
                width: AppClass().getMqWidth(context) - (AppClass().getMqWidth(context) * 0.23),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'WHAT_I_DO'.tr,
                    style: GoogleFonts.robotoSlab(
                      color: AppColors().textLight,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: 55,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: AppClass().getMqWidth(context) * 0.75,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'INTRO_ABOUT'.tr,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'CURRENT_ORG_NAME'.tr,
                        style: GoogleFonts.roboto(
                          color: AppColors().neonColor,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 70),
                child: InkWell(
                  onTap: () {
                    widget.aScrollController.scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
                  },
                  child: Container(
                    height: AppClass().getMqHeight(context) * 0.09,
                    width: AppClass().getMqWidth(context) * 0.2,
                    decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(3.0)), border: Border.all(color: AppColors().neonColor, width: 1.5)),
                    child: Center(
                      child: Text(
                        'CHECK_OUT_WORK'.tr,
                        style: TextStyle(color: AppColors().neonColor, fontSize: 13, letterSpacing: 1, fontWeight: FontWeight.bold, fontFamily: 'sfmono')
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
