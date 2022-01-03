//
//  AppDetailWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Dmitry Zasenko on 30.12.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class AppDetailWhatsNewViewController: UIViewController {

    private let app: ITunesApp

    private let imageDownloader = ImageDownloader()

    private var appDetailWhatsNewView: AppDetailWhatsNewView {
        return self.view as! AppDetailWhatsNewView
    }

    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = AppDetailWhatsNewView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }

    // MARK: - Private

    private func fillData() {
        self.downloadImage()
        self.appDetailWhatsNewView.appDescriptionLable.text = app.appDescription
    }

    private func downloadImage() {
        let url = app.screenshotUrls[0]
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.appDetailWhatsNewView.imageView.image = image
        }
    }
}
