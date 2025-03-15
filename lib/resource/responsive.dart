import 'package:flutter/cupertino.dart';
import 'package:peach_black/resource/appClass.dart';

class Responsive extends StatefulWidget {
  final Widget? mobileView;
  final Widget? webView;
  final Widget? tabView;

  const Responsive({Key? key, this.mobileView, this.tabView, this.webView}) : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    ScreenType scrType = AppClass().getScreenType(context);
    switch (scrType) {
      case ScreenType.mobile:
        return widget.mobileView ?? const SizedBox();
      case ScreenType.tab:
        return widget.tabView ?? const SizedBox();
      case ScreenType.web:
        return widget.webView ?? const SizedBox();
    }
  }
}
