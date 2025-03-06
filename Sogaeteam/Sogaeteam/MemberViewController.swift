//
//  MemberViewController.swift
//  Sogaeteam
//
//  Created by Lee on 3/5/25.
//

import UIKit



class MemberViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    struct TeamMember {
        let name: String
        let mbti: String
        let comment: String
        let imageName: String
    }

    let teamMembers: [TeamMember] = [
        TeamMember(name: "송규섭", mbti: "ISFJ", comment: "리드하는 사람이에요", imageName: "DS"),
        TeamMember(name: "이다성", mbti: "ENTJ", comment: "아이디어가 많아요", imageName: "KS"),
        TeamMember(name: "명노훈", mbti: "INTP", comment: "중요한 결정을 잘해요", imageName: "NH")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none // 구분선 제거
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        tableView.backgroundColor = UIColor(hexCode: "#FFFAF7")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamMembers.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == teamMembers.count { // 마지막 row에 광고를 배치
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
            cell.configureAd()

            cell.containerView.backgroundColor = UIColor(hexCode: "#FDFCFC")
            
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
            let member = teamMembers[indexPath.row]
            cell.configure(with: member)

            cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            cell.mbtiLabel.font = UIFont.systemFont(ofSize: 16)
            cell.commentLabel.font = UIFont.systemFont(ofSize: 16)
            cell.containerView.backgroundColor = UIColor(hexCode: "#FDFCFC")
            return cell
        }
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: \(indexPath.row)")
        // 다음 셀에서 사용할 이름 데이터만 넘겨주는거로 추가 (함수로 넘겨주는게 좋긴함)

    }


    // 테이블뷰 헤더
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView(frame: CGRect(x: 0, y: 10, width: tableView.frame.width, height: 100))
            headerView.backgroundColor = UIColor(hexCode: "#FFFAF7")

            let label = UILabel(frame: CGRect(x: 23, y: 15, width: tableView.frame.width, height: 100))
            label.textAlignment = .left
            label.numberOfLines = 2

            // 💡 "게스트" 부분을 볼드체로 만들기
            let fullText = "게스트님,\n나와 어울리는 팀원을 찾아보세요!"
            let boldText = "게스트"

            let attributedString = NSMutableAttributedString(string: fullText)
            let boldFont = UIFont.boldSystemFont(ofSize: 23)
            let regularFont = UIFont.systemFont(ofSize: 20)

            // "게스트" 부분을 찾아서 볼드 적용
            if let boldRange = fullText.range(of: boldText) {
                let nsRange = NSRange(boldRange, in: fullText)
                attributedString.addAttribute(.font, value: boldFont, range: nsRange)
            }

            // 나머지 텍스트는 일반 폰트 적용
            attributedString.addAttribute(.font, value: regularFont, range: NSRange(location: boldText.count, length: fullText.count - boldText.count))

            label.attributedText = attributedString
            headerView.addSubview(label)

            return headerView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 100 : 0 // 첫 번째 섹션만 80, 나머지는 0
    }

}

func setLetterSpacing(for label: UILabel, text: String, spacing: Double) {
    let attributedString = NSMutableAttributedString(string: text)
    attributedString.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: text.count))
    label.attributedText = attributedString
}

