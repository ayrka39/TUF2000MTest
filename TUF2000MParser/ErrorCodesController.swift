//
//  ErrorCodesController.swift
//  TUF200MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class ErrorCodesController: UIViewController {
	
	let errorWebView: UIWebView = {
		let webView = UIWebView()
		webView.backgroundColor = .white
		return webView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "TUF-2000M - Error Codes"
		setupView()
		loadHtmlFile()
		
	}
	
	private func setupView() {
		view.backgroundColor = .white
		view.addSubview(errorWebView)
		view.noAutoResizeMask(views: errorWebView)
		NSLayoutConstraint.activate([
			errorWebView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			errorWebView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
			errorWebView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 16),
			errorWebView.heightAnchor.constraint(equalToConstant: self.view.frame.height)
		])
	}
	
	private func loadHtmlFile() {
		guard let htmlUrl = Bundle.main.url(forResource: "tufErrorCodes", withExtension: "html") else { return }
		let urlRequest = URLRequest(url: htmlUrl)
		DispatchQueue.main.async {
			self.errorWebView.loadRequest(urlRequest)
		}
		
	}
	
}
