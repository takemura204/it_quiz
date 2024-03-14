import UIKit
import Flutter
import GoogleMobileAds
import UserNotifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    }
//     // 通知
//     if #available(iOS 10.0, *) {
//       UNUserNotificationCenter.current().delegate = self
//       let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//       UNUserNotificationCenter.current().requestAuthorization(
//         options: authOptions,
//         completionHandler: {_, _ in })
//     } else {
//       let settings: UIUserNotificationSettings =
//         UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//       application.registerUserNotificationSettings(settings)
//     }
   //広告
   GADMobileAds.sharedInstance().start(completionHandler: nil)
   GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
