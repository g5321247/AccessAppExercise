//
//  TableViewCell.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/5/31.
//  Copyright © 2020 George Liu. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var personalPictureImageView: UIImageView! {
        didSet {
            personalPictureImageView.setCorner(radius: 20, clipsToBounds: true)
        }
    }

    @IBOutlet weak var personalNameLabel: UILabel!
    @IBOutlet weak var administrationLabel: UILabel!
    @IBOutlet weak var baseViuew: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

}
