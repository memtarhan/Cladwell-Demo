//
//  AppDelegate.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 20/03/2022.
//

import Swinject
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var assembler: Assembler?

    var rootViewController: UIViewController? {
        get { return window?.rootViewController }
        set {
            window?.rootViewController = newValue
            window?.makeKeyAndVisible()
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initWindow()
        initDI()
        initUI()
        initNavigationBar()
        return true
    }

    /// - Initializing window
    private func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
    }

    /// - Initializing dependency injection
    private func initDI() {
        assembler = Assembler([
            /// - Screens
            ClosetAssembly(),
            DetailsAssembly(),
            LoginAssembly(),
            SplashAssembly(),

        ])
        assembler?.apply(assembly: ViewControllerFactoryAssembly(assembler: assembler!))
    }

    /// - Initializing UI w/ initial view controller
    func initUI() {
        rootViewController = assembler?.resolver.resolve(SplashViewController.self) as? UIViewController
    }

    /// - Initializing UINavigationBar
    private func initNavigationBar() {
        let appearance = UINavigationBar.appearance()
        appearance.shadowImage = UIImage()
        appearance.setBackgroundImage(UIImage(), for: .default)
        appearance.backgroundColor = .accent
    }
}
