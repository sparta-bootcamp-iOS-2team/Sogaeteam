//
//  MemberViewController.swift
//  Sogaeteam
//
//  Created by Lee on 3/5/25.
//

import UIKit
import SafariServices


class TeamMemberList: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    

    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none // 구분선 제거
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        tableView.backgroundColor = UIColor(hexCode: "#FFFAF7")
        
        setupCustomBackButton()
    }
    
    private func setupCustomBackButton() {
        // 백버튼 이미지 설정
        let backButtonImage = UIImage(systemName: "chevron.left")
        navigationController?.navigationBar.backIndicatorImage = backButtonImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        
        // 타이틀 제거 (백버튼 옆의 텍스트 없애기)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // 네비게이션 바 타이틀 색상 및 폰트 설정
        navigationController?.navigationBar.tintColor = UIColor(hexCode: "403524") // 백버튼 색상
        
        // 네비게이션 바 투명하게 설정 (선택사항)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserManager.shared.teamMembers.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == UserManager.shared.teamMembers.count { // 마지막 row에 광고를 배치
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
            cell.configureAd()

            cell.containerView.backgroundColor = UIColor(hexCode: "#FDFCFC")
            
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
            let member = UserManager.shared.teamMembers[indexPath.row]
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
        
        if indexPath.row == UserManager.shared.teamMembers.count {
            let vc = SFSafariViewController(url: URL(string: "https://nbcamp.spartacodingclub.kr/")!)
            self.present(vc, animated: true)
        } else {
            let storyboard = UIStoryboard(name: "MatchingDetail", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MatchingDetail") as! MatchingDetail
            var tailString = ""
            
            vc.user = UserManager.shared.teamMembers[indexPath.row]
            
            
            print(self.navigationController)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
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

