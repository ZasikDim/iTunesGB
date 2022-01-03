//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
	let app: ITunesApp
	private let imageDownloader = ImageDownloader()

	lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var whatsNewViewController = AppDetailWhatsNewViewController(app: self.app)
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }

	init(app: ITunesApp) {
		self.app = app
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
		self.configureUI()
    }
    
    // MARK: - Private

	private func configureUI() {
		self.view.backgroundColor = .white
		self.navigationController?.navigationBar.tintColor = UIColor.white;
		self.navigationItem.largeTitleDisplayMode = .never
		self.addHeaderViewController()
		self.addWhatsNewViewController()
	}
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }

	private func addHeaderViewController() {
		self.addChild(self.headerViewController)
		self.view.addSubview(self.headerViewController.view)
		self.headerViewController.didMove(toParent: self)
		self.headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			self.headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			self.headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
		])
	}

	private func addWhatsNewViewController() {
		self.addChild(whatsNewViewController)
		self.view.addSubview(whatsNewViewController.view)
        whatsNewViewController.didMove(toParent: self)
        whatsNewViewController.view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            whatsNewViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            whatsNewViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            whatsNewViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            whatsNewViewController.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

}
