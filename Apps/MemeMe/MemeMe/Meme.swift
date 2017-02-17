//
//  Meme.swift
//  MemeMe
//
//  Created by 신승훈 on 2017. 1. 28..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    
    // TableView와 CollectionView에서 공유할 데이터
    static var memes: [Meme] = []
    
    let topText : String
    let bottomText : String
    let originalImage: UIImage
    let memedImage: UIImage
    
    // 생성 시간기록
    let time : Date
    let dateFormatter = DateFormatter()
    var stringTime : String = ""
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage,now time: Date){
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
        self.time = time
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        stringTime = dateFormatter.string(from: time)
    }
    
    static func save(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage, now time: Date) {
        
        let meme: Meme = Meme(topText: topText, bottomText: bottomText, originalImage: originalImage, memedImage: memedImage, now: time)
        
        // 저장은 share를 통해서
//        UIImageWriteToSavedPhotosAlbum(meme.memedImage, nil, nil, nil)
        
        memes.append(meme)
    }
    
    
    
    
}
