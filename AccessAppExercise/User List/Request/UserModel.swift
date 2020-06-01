//
//  UserModel.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/6/1.
//  Copyright © 2020 George Liu. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    let login: String
    let id: Int
    let avatarURL: String
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case siteAdmin = "site_admin"
    }
}
