//
//  APICallable.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 21/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Alamofire
import Foundation

protocol APICallable {
    var baseURL: String { get }
    var decoder: JSONDecoder { get }
}

extension APICallable {
    var baseURL: String { return "https://api.staging.aws.cladwell.com/" }
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}
