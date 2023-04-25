import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';

import '../../controller/home_root/home_root_screen_controller.dart';
import '../../controller/home_root/home_root_screen_state.dart';
import '../../resource/lang/initial_resource.dart';
import '../home_review_screen/home_review_screen.dart';
import '../home_setting_screen/home_setting_screen.dart';
import '../home_study_screen/home_study_screen.dart';
import '../home_test_screen/home_test_screen.dart';

part 'home_root_appbar.dart';
part 'home_root_body.dart';
part 'home_root_nav_bar.dart';

class HomeRootScreen extends StatelessWidget {
  const HomeRootScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}
