//
//  ViewControllerFactory.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation
import Swinject

protocol ViewControllerFactory {
    var closet: ClosetViewController { get }
    var details: DetailsViewController { get }
    var login: LoginViewController { get }
    var splash: SplashViewController { get }
}

class ViewControllerFactoryImpl: ViewControllerFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    var closet: ClosetViewController { assembler.resolver.resolve(ClosetViewController.self)! }
    var details: DetailsViewController { assembler.resolver.resolve(DetailsViewController.self)! }
    var login: LoginViewController { assembler.resolver.resolve(LoginViewController.self)! }
    var splash: SplashViewController { assembler.resolver.resolve(SplashViewController.self)! }
}
