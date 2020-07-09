import UIKit
import Flutter
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions ) 
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  // func application( 
  //   _ app: UIApplication, 
  //   open url: URL, 
  //   options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) 
  //   -> Bool { 
  //     ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] ) 
  //   }
}
