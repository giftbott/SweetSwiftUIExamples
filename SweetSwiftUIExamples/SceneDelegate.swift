//
//  SceneDelegate.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }

    let rootView = Ch01_HelloSwiftUI()
    
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = UIHostingController(rootView: rootView)
    window?.makeKeyAndVisible()
  }
}
