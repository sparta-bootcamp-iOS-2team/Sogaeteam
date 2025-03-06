//
//  BoldText.swift
//  Sogaeteam
//
//  Created by NH on 3/4/25.
//

import UIKit

extension UILabel {
    /// 특정 문자열을 볼드 스타일로 적용하는 함수
    func setAttributedText(fullText: String, boldTexts: [(String, UIFont)]) {
        let attributedString = NSMutableAttributedString(string: fullText)
        
        for (boldText, font) in boldTexts {
            if let range = fullText.nsRange(of: boldText) {
                attributedString.addAttribute(.font, value: font, range: range)
            }
        }
        
        self.attributedText = attributedString
    }
}

extension String {
    /// 특정 문자열을 NSRange로 변환하는 확장 함수
    func nsRange(of substring: String) -> NSRange? {
        guard let range = self.range(of: substring) else { return nil }
        return NSRange(range, in: self)
    }
}

