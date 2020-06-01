//
//  ViewController.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/5/31.
//  Copyright © 2020 George Liu. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    // MARK: - IB
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(forCellReuseIdentifiers: [
                String(describing: UserTableViewCell.self)
            ])
        }
    }

    // MARK: - Other properties
    let viewModel: UserListViewModel

    required init?(coder: NSCoder) {
        viewModel = UserListViewModel(dependency: .init(
            startUserID: "0",
            pageSize: "20",
            limit: 100
        ))
        super.init(coder: coder)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.downloadUsers()
    }

    private func bindViewModel() {
        var outputs = viewModel.outputs

        outputs.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - TableViewDelegate, TableViewDataSource
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = viewModel.outputs.users[indexPath.row]
        let cell: UserTableViewCell = tableView.makeCell(indexPath: indexPath)

        cell.configure(with: user.login, pictureStr: user.avatarURL, isAdmin: user.siteAdmin)
        return cell
    }
}
