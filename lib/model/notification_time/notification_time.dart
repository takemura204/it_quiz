import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_time.freezed.dart';

part 'notification_time.g.dart';

@freezed
class NotificationTime with _$NotificationTime {
  factory NotificationTime({
    int? hour,
    int? minute,
  }) = _NotificationTime;

  factory NotificationTime.fromJson(Map<String, dynamic> json) =>
      _$NotificationTimeFromJson(json);

  factory NotificationTime.defaultTime() =>
      NotificationTime(hour: 8, minute: 30);
}

extension NotificationTimeX on NotificationTime {
  Map<String, int?> toMap() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }
}
