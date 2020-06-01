//
//  UserListViewModel.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/6/1.
//  Copyright © 2020 George Liu. All rights reserved.
//

import Foundation

protocol UserListViewModelInputs {
    func downloadUsers()
}

protocol UserListViewModelOutputs {
    var users: [UserModel] { get }
    var reloadData: (() -> Void)? { get set }
}

class UserListViewModel: UserListViewModelInputs, UserListViewModelOutputs {
    var inputs: UserListViewModelInputs { return self }
    var outputs: UserListViewModelOutputs { return self }

    // MARK: - Outputs
    var users: [UserModel] = [] {
        didSet {
            reloadData?()
        }
    }
    var reloadData: (() -> Void)?

    // MARK: - Other properties
    private var dependency: Dependency
    let service: NetworkingService

    init(dependency: Dependency, service: NetworkingService = Client()) {
        self.dependency = dependency
        self.service = service
    }

    // MARK: Inputs
    func downloadUsers() {
        let request = UserListRequest(parameters: .init(since: 0, perPage: "20"))
        service.send(request: request) { (result) in
            switch result {
            case .success(let model):
                print(model.count)
            case .failure(let err):
                print(err)
            }
        }
    }
}

// MARK: - Dependency
extension UserListViewModel {
    struct Dependency {
        var startUserID: Int
        var pageSize: String
        let limit: Int
    }
}
