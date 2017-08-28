//
//  CurrentReadingViewController+navbar.swift
//  TUF200MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

extension CurrentReadingViewController {
	
	func setupNavbar() {
		
		navigationItem.title = "TUF-2000M"
		
		navigationController?.navigationBar.barTintColor = .orange
		navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
		
		
		let refreshBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "refresh").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(setupRefresh))
		
		navigationItem.rightBarButtonItem = refreshBarButton
	}
	
	
	func setupRefresh() {
		masterDataSource.calendars.removeAll()
		masterDataSource.registers.removeAll()
		masterDataSource.getValues()
		collectionView?.reloadData()
		
	}
	
}
