import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mission.dart';
import 'missions.dart';

part 'missions_resorce.dart';

final missionModelProvider = StateNotifierProvider((ref) => MissionModel(ref));

class MissionModel extends StateNotifier<Missions> {
  MissionModel(this.ref) : super(Missions()) {
    () async {
      await initState();
    }();
  }

  final Ref ref;
  Future initState() async {}
}
