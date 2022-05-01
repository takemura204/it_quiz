import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import '../../controller/home_root_screen/home_root_screen_controller.dart';
import '../../controller/home_root_screen/home_root_screen_state.dart';
import '../../resource/icon_resource.dart';
import '../../resource/initial_resource.dart';
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
      // drawer: Drawer(
      //   child: MediaMenu(),
      // ),
      bottomNavigationBar: _BottomNavBar(),
      // floatingActionButton: _FloatingButton(),
    );
  }
}
