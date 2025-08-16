import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peach_black/resource/appClass.dart';

import '../../controller/generalController.dart';
import '../../model/experienceModel.dart';
import '../../resource/colors.dart';
import '../../services/translation_service.dart';

class ExperienceTab extends StatefulWidget {
  const ExperienceTab({Key? key}) : super(key: key);

  @override
  State<ExperienceTab> createState() => _ExperienceTabState();
}

class _ExperienceTabState extends State<ExperienceTab> {
  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experienceList = [
      ExperienceModel(
          desig: 'EXP_DESIG0'.tr,
          compName: 'EXP_COMP_NAME0'.tr,
          duration: 'EXP_DUR0'.tr,
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'EXP_ABOUT0'.tr,
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 14,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'EXP_ABOUT0_2'.tr,
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 14,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'EXP_ABOUT0_3'.tr,
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 14,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      ExperienceModel(
          desig: 'EXP_DESIG1'.tr,
          compName: 'EXP_COMP_NAME1'.tr,
          duration: 'EXP_DUR1'.tr,
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT1'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT1'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT1'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      ExperienceModel(
          desig: 'EXP_DESIG2'.tr,
          compName: 'EXP_COMP_NAME2'.tr,
          duration: 'EXP_DUR2'.tr,
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT2'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT2_2'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT2_3'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT2_4'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT2_5'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT2_6'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      ExperienceModel(
          desig: 'EXP_DESIG3'.tr,
          compName: 'EXP_COMP_NAME3'.tr,
          duration: 'EXP_DUR3'.tr,
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT3'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT3_2'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT3_3'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      ExperienceModel(
          desig: 'EXP_DESIG4'.tr,
          compName: 'EXP_COMP_NAME4'.tr,
          duration: 'EXP_DUR4'.tr,
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT4'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT4_2'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(

                      child: Text(
                        'EXP_ABOUT4_3'.tr,
                        style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ];

    return Container(
      margin: EdgeInsets.only(
        left: AppClass().getMqWidth(context) * 0.03,
        right: AppClass().getMqWidth(context) * 0.03,
        top: AppClass().getMqHeight(context) * 0.05,
        bottom: AppClass().getMqHeight(context) * 0.05
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(text: "02.", style: TextStyle(color: AppColors().neonColor, fontSize: 20, fontFamily: 'sfmono'), children: <TextSpan>[
                  TextSpan(
                    text: ' ${'SECTION_EXPERIENCE'.tr}',
                    style: GoogleFonts.robotoSlab(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ]),
              ),
              Container(
                height: 0.5,
                margin: EdgeInsets.only(left: 15),
                width: AppClass().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          Consumer(builder: (context, ref, child) {
            var data = ref.watch(selectedExpProvider);
            return Container(
              width: AppClass().getMqWidth(context) * 0.8,
              margin: EdgeInsets.only(top: 30.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 0;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 0 ? AppColors().cardColor : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 0 ? AppColors().neonColor : Colors.white,
                                        width: 2))),
                            child: Text(
                              'Cino',
                              style: TextStyle(
                                  color: data == 0 ? AppColors().neonColor : AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 13,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 1;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 1 ? AppColors().cardColor : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 1 ? AppColors().neonColor : Colors.white,
                                        width: 2))),
                            child: Text(
                              'SeQura',
                              style: TextStyle(
                                  color: data == 1 ? AppColors().neonColor : AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 13,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 2;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 2 ? AppColors().cardColor : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 2 ? AppColors().neonColor : Colors.white,
                                        width: 2))),
                            child: Text(
                              'Delivery Hero',
                              style: TextStyle(
                                  color: data == 2 ? AppColors().neonColor : AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 13,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 3;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 3 ? AppColors().cardColor : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 3 ? AppColors().neonColor : Colors.white,
                                        width: 2))),
                            child: Text(
                              'theBASE',
                              style: TextStyle(
                                  color: data == 3 ? AppColors().neonColor : AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 13,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(selectedExpProvider.notifier).state = 4;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: data == 4 ? AppColors().cardColor : Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: data == 4 ? AppColors().neonColor : Colors.white,
                                        width: 2))),
                            child: Text(
                              'Ubiqum',
                              style: TextStyle(
                                  color: data == 4 ? AppColors().neonColor : AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 13,
                                  fontFamily: 'sfmono'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: experienceList[data].desig,
                              style: GoogleFonts.roboto(color: AppColors().textColor, fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' @${experienceList[data].compName}',
                                  style: GoogleFonts.roboto(color: AppColors().neonColor, fontSize: 18),
                                )
                              ]),
                        ),
                        Text(
                          experienceList[data].duration.toString(),
                          style: TextStyle(color: AppColors().textLight, letterSpacing: 1, height: 1.5, fontSize: 13, fontFamily: 'sfmono'),
                        ),
                        experienceList[data].points!
                      ],
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
