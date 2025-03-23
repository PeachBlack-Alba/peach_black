              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  Strings.welcomeTxt,
                  style: TextStyle(color: AppColors().neonColor, fontSize: 16, fontFamily: 'sfmono'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  Strings.name,
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
                    Strings.whatIdo,
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
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: Strings.introAbout,
                              style: GoogleFonts.roboto(
                                color: AppColors().textColor,
                                letterSpacing: 1,
                                height: 1.5,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                            TextSpan(
                              text: Strings.currentOrgName,
                              style: GoogleFonts.roboto(
                                color: AppColors().neonColor,
                                letterSpacing: 1,
                                height: 1.5,
                                fontSize: 16,
                              ),
                            )
                          ])),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 50),
                child: InkWell(
                  onTap: () {
                    widget.aScrollController.scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
                  },
                  child: Container(
                    height: AppClass().getMqHeight(context) * 0.09,
                    width: AppClass().getMqWidth(context) * 0.25,
                    decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(3.0)), border: Border.all(color: AppColors().neonColor, width: 1.5)),
                    child: Center(
                      child: Text(
                        "Check out my work!",
                        style: TextStyle(color: AppColors().neonColor, fontSize: 13, letterSpacing: 1, fontWeight: FontWeight.bold, fontFamily: 'sfmono')
                      ),
                    ),
                  ),
                ),
              ) 