//
//  MatchingDetail.swift
//  Sogaeteam
//
//  Created by Lee on 3/5/25.
//

import UIKit

class MatchingDetail: UIViewController {

    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!
    
    @IBOutlet weak var matchingResultLabel: UILabel!
    @IBOutlet weak var gepImageView: UIImageView!
    @IBOutlet weak var charmingPoint: UILabel!

    @IBOutlet weak var firstPointLabel: UILabel!
    @IBOutlet weak var secondPointLabel: UILabel!
    @IBOutlet weak var thirdPointLabel: UILabel!
    @IBOutlet weak var fourthPointLabel: UILabel!

    @IBOutlet weak var firstBarLabel: UIProgressView!
    @IBOutlet weak var secondBarLabel: UIProgressView!
    @IBOutlet weak var thirdBarLabel: UIProgressView!
    @IBOutlet weak var fourthBarLabel: UIProgressView!

    @IBOutlet weak var mineButton: UIButton!

    var user: TeamMember? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(hexCode: "#FFFAF7")
        
        if firstContainerView != nil {
            getColor()
        }
        else {
            print("firstContainerView is nil")
        }
        
        print("All IBOutlets: \(firstContainerView), \(secondContainerView), \(firstBarLabel), ...")

        getImage()
        setCharmingPoint()
        setPointLabel()
        buttonStyle()
        
        mineButton.addTarget(self, action: #selector(didTapMineButton), for: .touchUpInside)
        
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
    
    func buttonStyle() {
        mineButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        mineButton.setTitle("마음에 들어요", for: .normal)
        mineButton.layer.cornerRadius = 10
    }

    func getColor() {
        let containerViewColor = UIColor(hexCode: "#FDFCFC")
        firstContainerView.backgroundColor = containerViewColor
        secondContainerView.backgroundColor = containerViewColor
        firstBarLabel.tintColor = UIColor(hexCode: "FEF4C7")
        firstBarLabel.trackTintColor = UIColor(hexCode: "#FDFCFC")
        secondBarLabel.tintColor = UIColor(hexCode: "FEF4C7")
        secondBarLabel.trackTintColor = UIColor(hexCode: "#FDFCFC")
        thirdBarLabel.tintColor = UIColor(hexCode: "FEF4C7")
        thirdBarLabel.trackTintColor = UIColor(hexCode: "#FDFCFC")
        fourthBarLabel.tintColor = UIColor(hexCode: "FEF4C7")
        fourthBarLabel.trackTintColor = UIColor(hexCode: "#FDFCFC")
        mineButton.backgroundColor = UIColor(hexCode: "FFD371")
        mineButton.tintColor = UIColor.black
    }

    func getImage() {
        if let characterImageName = user?.characterImageName {
            gepImageView.image = UIImage(named: "\(characterImageName)")
        }
        
        print(user?.characterImageName)
    }

    func setCharmingPoint() {
        charmingPoint.text = "나의 매력 포인트"
        charmingPoint.font = UIFont.boldSystemFont(ofSize: 21)
    }


    func setPointLabel() {
        
        guard let user = user else { print("user is nil"); return }
        
        let name = user.name
        let fullText = name + " " + user.description
        let boldText = name
        matchingResultLabel.textAlignment = .left
        matchingResultLabel.numberOfLines = 3

        let attributedString = NSMutableAttributedString(string: fullText)

        let boldFont = UIFont.boldSystemFont(ofSize: 23)
        let regularFont = UIFont.systemFont(ofSize: 19)

        // "이름" 부분을 찾아서 볼드 적용
        if let boldRange = fullText.range(of: boldText) {
            let nsRange = NSRange(boldRange, in: fullText)
            attributedString.addAttribute(.font, value: boldFont, range: nsRange)
        }

        // 나머지 텍스트는 일반 폰트 적용
        attributedString.addAttribute(.font, value: regularFont, range: NSRange(location: boldText.count, length: fullText.count - boldText.count))
        matchingResultLabel.attributedText = attributedString


        firstPointLabel.text = "발표를 잘해요"
        secondPointLabel.text = "UI/UX적으로 능해요"
        thirdPointLabel.text = "문서 정리를 잘해요"
        fourthPointLabel.text = "아이디어가 많아요"
        
        let charmPoints = user.charmPoints
        
        firstBarLabel.progress = charmPoints[0]
        secondBarLabel.progress = charmPoints[1]
        thirdBarLabel.progress = charmPoints[2]
        fourthBarLabel.progress = charmPoints[3]
    }
    
    @objc private func didTapMineButton() {
        let vc = ProfileViewController()
        
        guard let user = user else { print("user is nil"); return }
        vc.configure(user: user)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
