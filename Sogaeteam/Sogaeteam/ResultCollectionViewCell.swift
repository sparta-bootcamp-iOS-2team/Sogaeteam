//
//  ResultCollectionViewCell.swift
//  Sogaeteam
//
//  Created by NH on 3/4/25.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var resultImage: UIImageView!
    
    // 이미지 원형으로 만들기
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()  // 👉 즉시 레이아웃을 업데이트하여 frame 값 확정

        resultImage.layer.cornerRadius = resultImage.frame.width / 2
    }
    
    // 컬렉션 뷰 안에 있는 이미지 뷰에 이름에 맞는 이미지 넣는 함수
    func resultConfigure(_ result: Result) {
        resultImage.image = UIImage(named: result.name)
    }
}
