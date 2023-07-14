import UIKit
import Flutter
import GoogleMaps
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyCmMlFujsTJehjSe-_whqkyeo7VK3nhPoY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(_ application: UIApplication,
  didRegisterForRemoteNotificationsWithDevicesToken deviceToken: Data){

  Messaging.messaging().apnsToken = deviceToken
  print("Token: \(deviceToken)")
  super.application(application,
  didRegisterForRemoteNotificationsWithDevicesToken: deviceToken)
  }
}
