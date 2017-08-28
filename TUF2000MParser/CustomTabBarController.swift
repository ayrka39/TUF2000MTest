//
//  CustomTabBarController.swift
//  TUF2000MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

enum TabBarTitle: String {
	case firstValues = "Current Data"
	case errorCodes = "Error Codes"
}

class CustomTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupViewController()
	}
	
	fileprivate func setupViewController() {
		let firstCurrentController = CurrentReadingViewController(collectionViewLayout: UICollectionViewFlowLayout())
		let errorCodesController = ErrorCodesController()
		
		let firstNavigationController = navController(firstCurrentController, title: .firstValues, imageName: "data")
		let errorNavigationController = navController(errorCodesController, title: .errorCodes, imageName: "error")
		
		viewControllers = [firstNavigationController, errorNavigationController]
	}
	
	fileprivate func navController(_ viewController: UIViewController, title: TabBarTitle, imageName: String) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: viewController)
		navigationController.title = title.rawValue
		navigationController.tabBarItem.image = UIImage(named: imageName)
		navigationController.navigationBar.barTintColor = .orange
		navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
		
		return navigationController
	}
}
