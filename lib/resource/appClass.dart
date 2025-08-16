import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peach_black/model/experienceModel.dart';
import 'package:peach_black/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL = '''https://jeeva-portfolio.s3.amazonaws.com/JEEVANANDHAM's+Resume.pdf''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "CINO",
        projectContent: "Cino - the virtual card made to help couples and friends pay their share of the bill instantly",
        tech1: "Flutter",
        tech2: "Kotlin",
        tech3: "SQL",
        projectUrl: "https://apps.apple.com/es/app/cino-pay-together/id6443988744"),
    WorkModel(
        projectTitle: "seQura",
        projectContent: "Compra ahora, paga después",
        tech1: "React Native",
        tech2: "Kotlin",
        tech3: "SQL",
        projectUrl: "https://play.google.com/store/apps/details?id=com.sequra.app&hl=es_BO&pli=1"),
    WorkModel(
        projectTitle: "Talabat",
        projectContent: "Fast delivery of food, groceries and more",
        tech1: "Flutter",
        tech2: "Kotlin",
        tech3: "SQL",
        projectUrl: "https://www.talabat.com/uae"),
    WorkModel(
        projectTitle: "Foodora",
        projectContent: "foodpanda brings food & groceries directly to your door. We deliver everything you may need: from favourite restaurants, to everyday essentials, and local specialities – whatever you crave, we can help.",
        tech1: "Flutter",
        tech2: "Kotlin",
        tech3: "Swift",
        projectUrl: "https://external.foodpanda.de/"),
    WorkModel(
        projectTitle: "PedidosYa",
        projectContent: "PedidosYa food delivery app used in LATAM.",
        tech1: "Flutter",
        tech2: "Kotlin",
        tech3: "Swift",
        projectUrl: "https://institucional.pedidosya.com/"),
    WorkModel(
        projectTitle: "FoodPanda",
        projectContent: "We're here to help you live life the panda way. Spend more time doing what you love – we'll take care of tasty meals, fresh groceries and new flavours.",
        tech1: "Flutter",
        tech2: "Kotlin",
        tech3: "Swift",
        projectUrl: "https://www.foodpanda.com/"),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!).showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text(title, style: TxtStyle().boldWhite(context)),
            content: Text(msg),
            actions: [ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () => Navigator.pop(context), child: Text('Okay'))]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url, body: {"name": name, "contactInfo": contact, "message": msg}).timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
