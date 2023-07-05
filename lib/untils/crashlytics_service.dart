import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsService {
  final _crashlytics = FirebaseCrashlytics.instance;
  Future<void> recordError(
    Object exception,
    StackTrace stackTrace,
    String reason,
  ) async {
    print('crash');
    print(reason);
    print(exception);
    print(stackTrace);
    await _crashlytics.recordError(exception, stackTrace, reason: reason);
  }
}
