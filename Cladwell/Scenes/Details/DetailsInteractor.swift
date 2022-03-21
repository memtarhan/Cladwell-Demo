//
//  DetailsInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Alamofire
import UIKit

protocol DetailsInteractor: AnyObject {
    var presenter: DetailsPresenter? { get set }

    func retrieveItem(for id: Int)
}

class DetailsInteractorImpl: DetailsInteractor {
    var presenter: DetailsPresenter?

    func retrieveItem(for id: Int) {
        let url = "\(baseURL)items/\(id)"
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
                    let itemResponse = try self.decoder.decode(ItemResponse.self, from: data)
                    self.presenter?.presentFetched(item: itemResponse)
                } catch {
                    // TODO: Display error
                    print(error)
                }
            }
        }
    }
}

extension DetailsInteractorImpl: APICallable { }
