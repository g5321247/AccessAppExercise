//
//  ViewController.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/5/31.
//  Copyright © 2020 George Liu. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(forCellReuseIdentifiers: [
            String(describing: UserTableViewCell.self)
        ])
    }

}

// MARK: - TableViewDelegate, TableViewDataSource
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.makeCell(indexPath: indexPath)
        return cell
    }
}
