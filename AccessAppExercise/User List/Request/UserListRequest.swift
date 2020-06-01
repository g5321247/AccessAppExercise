//
//  UserListRequest.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/6/1.
//  Copyright © 2020 George Liu. All rights reserved.
//

import Foundation

struct UserListRequest: Request {
    typealias Response = [UserModel]
    var method: HTTPMethod = .get
    var endPoint: EndPoint = .users
    var parameter: [String : Any] {
        return [
            "since": parameters.since,
            "per_page": parameters.perPage
        ]
    }
    var parameters: Parameter

    struct Parameter {
        let since: String
        let perPage: String
    }
}
