//
//  LoadMoreView.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/6/1.
//  Copyright © 2020 George Liu. All rights reserved.
//

import UIKit

class LoadMoreView: UIView {

    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(
            frame: CGRect(x: center.x, y: center.y, width: 40, height: 40)
        )
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        return activityIndicator
    }()


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .white

        addSubview(activityIndicator)
    }

    func configure(shouldAnimate: Bool) {
        if shouldAnimate {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

