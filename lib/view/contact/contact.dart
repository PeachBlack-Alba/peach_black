import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peach_black/resource/responsive.dart';
import 'package:peach_black/view/contact/contactMobile.dart';
import 'package:peach_black/view/contact/contactTab.dart';
import 'package:peach_black/view/contact/contactWeb.dart';

class Contact extends ConsumerStatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  ConsumerState<Contact> createState() => _ContactState();
}

class _ContactState extends ConsumerState<Contact> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: ContactWeb(),
      tabView: ContactTab(),
      mobileView: ContactMobile(),
    );
  }
}
