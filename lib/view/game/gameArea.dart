import 'package:flutter/material.dart';
import 'package:peach_black/resource/responsive.dart';
import 'package:peach_black/view/game/gameAreaWeb.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'gameAreaMob.dart';
import 'gameAreaTab.dart';

class GameArea extends StatefulWidget {
  final AutoScrollController mScrollController;

  const GameArea(this.mScrollController, {Key? key}) : super(key: key);

  @override
  State<GameArea> createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: GameAreaWeb(widget.mScrollController),
      tabView: GameAreaTab(),
      mobileView: GameAreaMob(),
    );
  }
}
