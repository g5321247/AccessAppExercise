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
            personalPictureImageView.image = UIImage(named: "mockPic")
            personalPictureImageView.setCorner(radius: 30, clipsToBounds: true)
        }
    }

    @IBOutlet weak var personalNameLabel: UILabel!
    @IBOutlet weak var administrationLabel: UILabel!
    @IBOutlet weak var baseViuew: UIView! {
        didSet {
            baseViuew.setBoarder(width: 0.5, color: .lightGray)
            baseViuew.setShadow(
                opacity: 0.3,
                radius: 1,
                color: .shadow,
                offset: CGSize(width: 0, height: 2.0)
            )
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

}
