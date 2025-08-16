import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../resource/appClass.dart';
import '../../resource/colors.dart';
import '../../services/translation_service.dart';

class IntroMob extends StatefulWidget {
  final AutoScrollController aScrollController;

  const IntroMob(this.aScrollController, {Key? key}) : super(key: key);

  @override
  State<IntroMob> createState() => _IntroMobState();
}

class _IntroMobState extends State<IntroMob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: AppClass().getMqHeight(context) - 100,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'WELCOME'.tr,
              style: TextStyle(
                color: AppColors().neonColor,
                fontSize: 16,
                fontFamily: 'sfmono'
              ),
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
                fontSize: 35,
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
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: AppClass().getMqWidth(context) * 0.8,
            child: RichText(
              text: TextSpan(
                text: 'INTRO_ABOUT'.tr,
                style: GoogleFonts.roboto(
                  color: AppColors().textColor,
                  letterSpacing: 1,
                  height: 1.5,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'CURRENT_ORG_NAME'.tr,
                    style: GoogleFonts.roboto(
                      color: AppColors().neonColor,
                      letterSpacing: 1,
                      height: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 50),
            child: InkWell(
              onTap: () {
                widget.aScrollController.scrollToIndex(
                  1,
                  preferPosition: AutoScrollPosition.begin,
                  duration: Duration(milliseconds: 500),
                );
              },
              child: Container(
                height: AppClass().getMqHeight(context) * 0.09,
                width: AppClass().getMqWidth(context) * 0.25,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  border: Border.all(color: AppColors().neonColor, width: 1.5)
                ),
                child: Center(
                  child: Text(
                    'CHECK_OUT_WORK'.tr,
                    style: TextStyle(
                      color: AppColors().neonColor,
                      fontSize: 13,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sfmono'
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 