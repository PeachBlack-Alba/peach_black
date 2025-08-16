import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resource/appClass.dart';
import '../../resource/colors.dart';
import '../../services/translation_service.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppClass().getMqHeight(context) - 120,
      margin: EdgeInsets.only(
        left: AppClass().getMqWidth(context) * 0.03, 
        right: AppClass().getMqWidth(context) * 0.03,
        top: AppClass().getMqHeight(context) * 0.02
      ),
      padding: EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(text: "01.", style: TextStyle(color: AppColors().neonColor, fontSize: 20, fontFamily: 'sfmono'), children: <TextSpan>[
                  TextSpan(
                    text: ' ${'SECTION_ABOUT'.tr}',
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
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        'ABOUT_PARA1'.tr,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'ABOUT_PARA2'.tr,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'ABOUT_PARA3'.tr,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'TECH_INTRO'.tr,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: GridView.count(crossAxisCount: 2, shrinkWrap: true, childAspectRatio: 10, children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_right),
                            Text('TECH1'.tr,
                                style: GoogleFonts.robotoFlex(
                                  color: AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 17,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_right),
                            Text('TECH2'.tr,
                                style: GoogleFonts.robotoFlex(
                                  color: AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 17,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_right),
                            Text('TECH3'.tr,
                                style: GoogleFonts.robotoFlex(
                                  color: AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 17,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_right),
                            Text('TECH4'.tr,
                                style: GoogleFonts.robotoFlex(
                                  color: AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 17,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
