//
//  ViewControllerFactoryAssembly.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Foundation
import Swinject

class ViewControllerFactoryAssembly: Assembly {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func assemble(container: Container) {
        container.register(ViewControllerFactory.self) { _ in
            ViewControllerFactoryImpl(assembler: self.assembler)
        }
    }
}
