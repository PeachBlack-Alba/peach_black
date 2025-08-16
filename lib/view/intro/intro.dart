import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peach_black/services/translation_service.dart';
import 'package:peach_black/resource/appClass.dart';
import 'package:peach_black/resource/colors.dart';

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
                          'WELCOME'.tr,
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
                        'NAME'.tr,
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
                        'WHAT_I_DO'.tr,
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
                      'INTRO_ABOUT'.tr,
                      style: TextStyle(
                          color: AppColors().textLight,
                          letterSpacing: 1.0,
                          height: 1.5,
                          fontSize: 18.0,
                          fontFamily: 'sfmono'),
                    ),
                    SizedBox(
                      height: 10.0,
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
