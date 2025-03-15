import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peach_black/resource/app_localizations.dart';
import 'package:peach_black/resource/appClass.dart';
import 'package:peach_black/resource/colors.dart';
import 'package:peach_black/view/intro/introMobile.dart';
import 'package:peach_black/view/intro/introTab.dart';
import 'package:peach_black/view/intro/introWeb.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Intro extends ConsumerStatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  ConsumerState<Intro> createState() => _IntroState();
}

class _IntroState extends ConsumerState<Intro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: AppClass().getMqHeight(context) * 0.1,
          bottom: 20.0,
          left: AppClass().getMqWidth(context) * 0.1,
          right: AppClass().getMqWidth(context) * 0.1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.WELCOME.localize(context),
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 15.0,
                              fontFamily: 'sfmono'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.NAME.localize(context),
                        style: TextStyle(
                            color: AppColors().textColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            fontSize: 55.0,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.WHAT_I_DO.localize(context),
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 3.0,
                            fontSize: 45.0,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      AppStrings.INTRO_ABOUT.localize(context),
                      style: TextStyle(
                          color: AppColors().textLight,
                          letterSpacing: 1.0,
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'sfmono'),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InkWell(
                      onTap: () {
                        AppClass().alertDialog(
                            context,
                            AppStrings.WARNING.localize(context),
                            AppStrings.PLAY_AREA_WARNING.localize(context));
                      },
                      child: Container(
                        height: AppClass().getMqHeight(context) * 0.09,
                        width: AppClass().getMqWidth(context) * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(
                                color: AppColors().neonColor, width: 1.5)),
                        child: Center(
                          child: Text(
                            AppStrings.CHECK_OUT_WORK.localize(context),
                            style: TextStyle(
                                color: AppColors().neonColor,
                                fontSize: 13.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sfmono'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
