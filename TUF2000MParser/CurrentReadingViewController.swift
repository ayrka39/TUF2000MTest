//
//  ViewController.swift
//  TUF200MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class CurrentReadingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

	let masterDataSource = MasterDataSource()
	
	let cellId = "cellId"
	let headerId = "headerId"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupNavbar()
		setupCollectionView()
		masterDataSource.getValues()
		
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupRefresh()
	}

	fileprivate func setupCollectionView() {
	
		collectionView?.backgroundColor = .white
		collectionView?.contentInset = UIEdgeInsetsMake(10, 10, 0, 10)
      collectionView?.reloadData()
		collectionView?.register(MeterCell.self, forCellWithReuseIdentifier: cellId)
		collectionView?.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
		
	}

}

extension CurrentReadingViewController {
	
	// MARK: - UICollectionViewDataSource

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return masterDataSource.registers.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MeterCell
		cell.register = masterDataSource.registers[indexPath.item]
		return cell
	}
	
	// MARK: - UICollectionViewDelegateFlowLayout
	
	var sectionInsets: UIEdgeInsets {
		return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
	}
	
	var itemsPerRow: CGFloat {
		let value = UIInterfaceOrientation.portrait.isPortrait
		if value == true {
			return 2
		}
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return sectionInsets.left
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
		let width = view.frame.width - paddingSpace
		let widthPerItem = width / itemsPerRow
		return CGSize(width: widthPerItem, height: view.frame.height / 10)
	}
	

	
	// header
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
		header.calendar = masterDataSource.calendars[indexPath.item]
		return header
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.width, height: 70)
	}
}
