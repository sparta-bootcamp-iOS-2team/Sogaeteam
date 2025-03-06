//
//  MatchingListCollectionViewCell.swift
//  Sogaeteam
//
//  Created by NH on 3/4/25.
//

import UIKit

class MatchingListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var matchingItem: UILabel!
    
    func configure(_ matching: Matching) {
        matchingItem.text = matching.item
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // ✅ 셀 디자인 변경
        self.layer.cornerRadius = 10 // 둥근 테두리
        self.layer.masksToBounds = true
        self.backgroundColor = .white // 배경색 설정
    }
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = isSelected ? 2 : 0
            self.layer.borderColor = isSelected ? UIColor.orange.cgColor : nil
        }
    }
    
}
