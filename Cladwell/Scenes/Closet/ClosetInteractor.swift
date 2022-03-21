//
//  ClosetInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Alamofire
import UIKit

protocol ClosetInteractor: AnyObject {
    var presenter: ClosetPresenter? { get set }

    func retrieveCloset()
    func logOut()
}

class ClosetInteractorImpl: ClosetInteractor {
    var presenter: ClosetPresenter?

    func retrieveCloset() {
        let url = "\(baseURL)closet"
        if let token = UserDefaults.standard.string(forKey: UserDefaultKey.token) {
            let headers: HTTPHeaders = [
                "Authorization": "Token \(token)",
            ]

            AF.request(url, headers: headers).responseJSON { response in
                guard let data = response.data else {
                    // TODO: Display error
                    return
                }

                do {
                    let closetResponse = try self.decoder.decode(ClosetResponse.self, from: data)
                    self.presenter?.presentFetched(closet: closetResponse)
                } catch {
                    // TODO: Display error
                    print(error)
                }
            }
        }
    }

    func logOut() {
        // TODO: Maybe implement it with actual API instead of deleting token?
        UserDefaults.standard.removeObject(forKey: UserDefaultKey.token)
        UserDefaults.standard.setValue(false, forKey: UserDefaultKey.isLoggedIn)
        UserDefaults.standard.synchronize()
        presenter?.presentLoggedOut()
    }
}

extension ClosetInteractorImpl: APICallable { }
