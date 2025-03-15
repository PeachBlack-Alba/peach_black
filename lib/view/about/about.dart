import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peach_black/resource/responsive.dart';
import 'package:peach_black/view/about/abourWeb.dart';
import 'package:peach_black/view/about/aboutMobile.dart';
import 'package:peach_black/view/about/aboutTab.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: AboutWeb(),
      tabView: AboutTab(),
      mobileView: AboutMobile(),
    );
  }
}
