//
//  AdCell.swift
//  Sogaeteam
//
//  Created by Lee on 3/5/25.
//

import UIKit

class AdCell: UITableViewCell {
    @IBOutlet weak var adOptionTextLabel: UILabel!
    @IBOutlet weak var adSubLabel: UILabel!
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let convertedPoint = containerView.convert(point, from: self)
        return containerView.point(inside: convertedPoint, with: event) ? containerView : nil
    }

    func configureAd() {
        adOptionTextLabel.text = "ad."
        adSubLabel.text = "개발 팀원이 필요하다면?"
        adLabel.text = "스파르타 코딩클럽"
        adImageView.image = UIImage(named: "sparta_logo") // 광고 이미지 설정

        adOptionTextLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        adOptionTextLabel.textColor = .systemBlue
        adSubLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        adLabel.font = UIFont.systemFont(ofSize: 19, weight: .heavy)

        setLetterSpacing(for: adSubLabel, text: "개발 팀원이 필요하다면?", spacing: 1.2)
        setLetterSpacing(for: adLabel, text: "스파르타 코딩클럽", spacing: 1.7)

    }
}
