//
//  TableCell.swift
//  Sogaeteam
//
//  Created by Lee on 3/5/25.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mbtiLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none

        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let convertedPoint = containerView.convert(point, from: self)
        return containerView.point(inside: convertedPoint, with: event) ? containerView : nil
    }

    func configure(with member: TeamMember) {
        nameLabel.text = member.name
        mbtiLabel.text = member.mbti
        commentLabel.text = member.comment
        profileImageView.image = UIImage(named: member.imageName)
//        profileImageView.image = UIImage(named: member.imageName)
    }
}
