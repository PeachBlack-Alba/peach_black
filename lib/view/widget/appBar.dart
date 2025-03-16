import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peach_black/controller/generalController.dart';
import 'package:peach_black/resource/app_localizations.dart';
import 'package:peach_black/resource/appClass.dart';
import 'package:peach_black/resource/colors.dart';
import 'package:peach_black/view/widget/gooey_nav.dart';
import 'package:peach_black/view/widget/language_selector.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ActionBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  final AutoScrollController controller;

  ActionBar(this.controller, {Key? key}) : super(key: key);

  @override
  ConsumerState<ActionBar> createState() => _ActionBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ActionBarState extends ConsumerState<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: EdgeInsets.only(right: 15.0, top: 20.0),
        child: () {
          ScreenType scrType = AppClass().getScreenType(context);
          if (scrType == ScreenType.mobile || scrType == ScreenType.tab) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/svg/appLogo.png',
                    width: AppClass().getMqWidth(context) * 0.078,
                    height: AppClass().getMqHeight(context) * 0.08,
                  ),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const LanguageSelector(),
                        const SizedBox(width: 10),
                        PopupMenuButton(
                          color: AppColors().cardColor,
                          itemBuilder: (c) => <PopupMenuEntry>[
                            PopupMenuItem(
                              onTap: () => mOnTab(1),
                              child: Container(
                                  width: 90.0,
                                  child: Row(
                                    children: [
                                      Icon(Icons.account_circle_rounded, size: 18),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          AppStrings.SECTION_ABOUT.localize(context),
                                          style: GoogleFonts.roboto(),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            PopupMenuItem(
                              onTap: () => mOnTab(2),
                              child: Row(
                                children: [
                                  Icon(Icons.travel_explore_rounded, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      AppStrings.SECTION_EXPERIENCE.localize(context),
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () => mOnTab(3),
                              child: Row(
                                children: [
                                  Icon(Icons.computer_rounded, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      AppStrings.SECTION_WORK.localize(context),
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () => mOnTab(4),
                              child: Row(
                                children: [
                                  Icon(Icons.games, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      AppStrings.SECTION_GAMES.localize(context),
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () => mOnTab(5),
                              child: Row(
                                children: [
                                  Icon(Icons.phone_rounded, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      AppStrings.SECTION_CONTACT.localize(context),
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          child: Icon(Icons.menu_rounded, size: 25),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Row(
            children: [
              Expanded(
                  child: Container(
                      width: AppClass().getMqWidth(context) * 0.07,
                      height: AppClass().getMqHeight(context) * 0.07,
                      child: Image.asset(
                        'assets/svg/appLogo.png',
                      ))),
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /*Text(scrType.name),*/
                    Expanded(
                      child: Container(
                        height: 40,
                        child: GooeyNav(
                          controller: widget.controller,
                          labelTranslator: (context) => "",
                          items: [
                            NavItem(
                              label: AppStrings.SECTION_ABOUT.localize(context),
                              prefix: "01. ",
                              hoverKey: "aboutTitle",
                              index: 1,
                            ),
                            NavItem(
                              label: AppStrings.SECTION_EXPERIENCE.localize(context),
                              prefix: "02. ",
                              hoverKey: "expTitle",
                              index: 2,
                            ),
                            NavItem(
                              label: AppStrings.SECTION_WORK.localize(context),
                              prefix: "03. ",
                              hoverKey: "workTitle",
                              index: 3,
                            ),
                            NavItem(
                              label: AppStrings.SECTION_GAMES.localize(context),
                              prefix: "04. ",
                              hoverKey: "gameTitle",
                              index: 4,
                            ),
                            NavItem(
                              label: AppStrings.SECTION_CONTACT.localize(context),
                              prefix: "05. ",
                              hoverKey: "contactTitle",
                              index: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const LanguageSelector(),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        AppClass().downloadResume(context);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(3.0)), border: Border.all(color: AppColors().neonColor, width: 1.5)),
                        child: Center(
                          child: Text(
                            AppStrings.RESUME.localize(context),
                            style: TextStyle(color: AppColors().neonColor, fontSize: 13, letterSpacing: 1, fontWeight: FontWeight.bold, fontFamily: 'sfmono')
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }());
  }

  mOnTab(int i) {
    widget.controller.scrollToIndex(i, preferPosition: AutoScrollPosition.begin);
  }
}
