import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission.dart';

part 'missions.freezed.dart';

@freezed
class Missions with _$Missions {
  factory Missions({
    @Default([]) List<Mission> missions,
    @Default(0) final int mission1Index,
    @Default(0) final int mission2Index,
  }) = _Missions;
  Missions._();
}
