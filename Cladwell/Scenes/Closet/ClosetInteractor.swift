//
//  ClosetInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol ClosetInteractor: AnyObject {
    var presenter: ClosetPresenter? { get set }

    func logOut()
}

class ClosetInteractorImpl: ClosetInteractor {
    var presenter: ClosetPresenter?

    func logOut() {
        // TODO: Maybe implement it with actual API instead of deleting token?
        UserDefaults.standard.removeObject(forKey: UserDefaultKey.token)
        UserDefaults.standard.setValue(false, forKey: UserDefaultKey.isLoggedIn)
        UserDefaults.standard.synchronize()
        presenter?.presentLoggedOut()
    }
}
