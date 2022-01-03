//
//  AppDetailWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Dmitry Zasenko on 30.12.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class AppDetailWhatsNewView: UIView {
    
    private(set) lazy var appDescriptionLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }

    private func setupLayout() {
        self.addSubview(self.appDescriptionLable)
        self.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            imageView.heightAnchor.constraint(equalToConstant: 400),

            self.appDescriptionLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24.0),
            self.appDescriptionLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.appDescriptionLable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.appDescriptionLable.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
