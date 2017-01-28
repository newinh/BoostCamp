//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by 신승훈 on 2017. 1. 28..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: IBOutlet
    @IBOutlet weak var memeCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var sizeSlider: UISlider!
    
    var dimension: CGFloat = 0
    let space: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dimension = (view.frame.size.width - (2 * space) ) / 3.0
        
        // cell간 간격 및 크기
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
        // 슬라이더값을 view 사이즈와 동일하게 설정
        sizeSlider.maximumValue = Float(view.frame.size.width)  // 한줄 1개
        sizeSlider.minimumValue = Float( dimension / 3.0 )      // 한줄 9개
        sizeSlider.value = Float (dimension)                    // 기본값 : 한줄 3개
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeCollectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Meme.memes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.ImageView?.image = Meme.memes[indexPath.row].memedImage
        return cell
    }
    
    // 선택한 meme를 다시 viewController에 전달한다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let meme = Meme.memes[indexPath.row]
        viewController.meme = meme
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: IBAction
    @IBAction func newMeme() {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // sizeSlider의 값이 변하게되면 cell의 크기를 변경
    @IBAction func sizeValueChanged() {
        
        let newDimension = CGFloat(sizeSlider.value)
        flowLayout.itemSize = CGSize(width: newDimension, height: newDimension)
        memeCollectionView.reloadData()
    }
    
}
