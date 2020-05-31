//
//  UITableViewExtension.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/5/31.
//  Copyright © 2020 George Liu. All rights reserved.
//

import UIKit

extension UITableView {
    func register(forCellReuseIdentifiers identifiers: [String]) {
        for identifier in identifiers {
            let nibCell = UINib(nibName: identifier, bundle: nil)
            register(nibCell, forCellReuseIdentifier: identifier)
        }
    }

    func makeCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
                withIdentifier: String(describing: T.self),
                for: indexPath
            ) as? T else {
                fatalError("can't find \(String(describing: T.self)) file")
        }

        return cell
    }
}
