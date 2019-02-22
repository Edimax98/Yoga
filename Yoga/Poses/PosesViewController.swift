//
//  PosesViewController.swift
//  Yoga
//
//  Created by Даниил on 17/01/2019.
//  Copyright © 2019 SFB Tech. All rights reserved.
//

import UIKit

class PosesViewController: UIViewController {

    @IBOutlet weak var posesCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    let images = ["image","image2","image3","image4","image5","image6"]
    
    private func setupCollectionView() {
        posesCollectionView.dataSource = self
        posesCollectionView.delegate = self
        posesCollectionView.register(UINib(nibName: "PoseCell", bundle: nil), forCellWithReuseIdentifier: PoseCell.identifier)
    }
}

extension PosesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let image = UIImage(named: images[indexPath.row]) {
            let acpectRatio = image.size.height / image.size.width
            let height = 134 * acpectRatio + 90
            return CGSize(width: collectionView.frame.width / 2 - 30, height: height)
        }
        return CGSize(width: collectionView.frame.width / 2, height: 200)
    }
}

extension PosesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PoseCell.identifier, for: indexPath) as? PoseCell else {
            return UICollectionViewCell()
        }
        
        cell.poseImageView.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
}

//extension PosesViewController: LiquidLayoutDelegate {
//
//    func collectionView(collectionView: UICollectionView, heightForCellAtIndexPath indexPath: IndexPath, width: CGFloat) -> CGFloat {
//        return CGFloat()
//    }
//}
