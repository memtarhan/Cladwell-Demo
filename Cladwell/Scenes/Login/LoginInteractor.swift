//
//  LoginInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Alamofire
import UIKit

protocol LoginInteractor: AnyObject {
    var presenter: LoginPresenter? { get set }

    func signIn(withEmail email: String, password: String)
}

class LoginInteractorImpl: LoginInteractor {
    var presenter: LoginPresenter?

    func signIn(withEmail email: String, password: String) {
        let url = "\(baseURL)login"
        let parameters: Parameters = ["email": email, "password": password]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            guard let data = response.data else {
                self.presenter?.presentLoginFailed()
                return
            }

            do {
                let loginResponse = try self.decoder.decode(LoginResponse.self, from: data)
                UserDefaults.standard.setValue(loginResponse.token, forKey: UserDefaultKey.token)
                UserDefaults.standard.setValue(true, forKey: UserDefaultKey.isLoggedIn)
                UserDefaults.standard.synchronize()
                self.presenter?.presentLoggedIn()
            } catch {
                self.presenter?.presentLoginFailed()
            }
        }
    }
}

extension LoginInteractorImpl: APICallable { }

struct LoginResponse: Codable {
    let token: String
}
