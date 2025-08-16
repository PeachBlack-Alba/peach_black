import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../services/translation_service.dart';
import '../../resource/appClass.dart';
import '../../resource/colors.dart';

class IntroMobile extends StatefulWidget {
  final AutoScrollController aScrollController;

  IntroMobile(this.aScrollController, {Key? key}) : super(key: key);

  @override
  State<IntroMobile> createState() => _IntroMobileState();
}

class _IntroMobileState extends State<IntroMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: AppClass().getMqHeight(context) - 100,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WELCOME'.tr,
                style: TextStyle(color: AppColors().neonColor, fontSize: AppClass().getMqWidth(context) * 0.045, fontFamily: 'sfmono'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'NAME'.tr,
                  style: GoogleFonts.robotoSlab(
                    color: AppColors().textColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: AppClass().getMqWidth(context) * 0.08,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'WHAT_I_DO'.tr,
                    style: GoogleFonts.robotoSlab(
                      color: AppColors().textLight,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: AppClass().getMqWidth(context) * 0.055,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: RichText(
                      text: TextSpan(
                          text: 'INTRO_ABOUT'.tr,
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: AppClass().getMqWidth(context) * 0.045,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: 'CURRENT_ORG_NAME'.tr,
                          style: GoogleFonts.roboto(
                            color: AppColors().neonColor,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 17,
                          ),
                        )
                      ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: InkWell(
                  onTap: () {
                    widget.aScrollController.scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
                  },
                  child: Container(
                    height: AppClass().getMqHeight(context) * 0.07,
                    width: AppClass().getMqWidth(context) * 0.5,
                    padding: EdgeInsets.all(10.0),
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
