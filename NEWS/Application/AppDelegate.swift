//
//  AppDelegate.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import AlamofireNetworkActivityLogger
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    #if DEBUG
      NetworkActivityLogger.shared.level = .debug
      NetworkActivityLogger.shared.startLogging()
    #endif

    window = UIWindow()

    let viewController = HomeViewController()

    window?.rootViewController = viewController

    window?.makeKeyAndVisible()

    return true
  }
}
