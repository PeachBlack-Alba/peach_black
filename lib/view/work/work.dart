import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peach_black/resource/responsive.dart';
import 'package:peach_black/view/work/workMobile.dart';
import 'package:peach_black/view/work/workTab.dart';
import 'package:peach_black/view/work/workWeb.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: WorkTab(),
      webView: WorkWeb(),
      mobileView: WorkMobile(),
    );
  }
}
