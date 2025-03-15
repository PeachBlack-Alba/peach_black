import 'package:flutter/material.dart';
import 'package:peach_black/resource/responsive.dart';
import 'package:peach_black/view/experience/experienceMob.dart';
import 'package:peach_black/view/experience/experienceTab.dart';

import 'experienceWeb.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: ExperienceWeb(),
      mobileView: ExperienceMob(),
      tabView: ExperienceTab(),
    );
  }
}
