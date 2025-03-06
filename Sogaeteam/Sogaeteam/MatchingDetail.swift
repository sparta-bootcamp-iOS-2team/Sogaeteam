//
//  MatchingDetail.swift
//  Sogaeteam
//
//  Created by Lee on 3/5/25.
//

import UIKit



struct MatchingResult {
    let name: String
    let imageName: String
    let description: String
    let charmPoints: [Float] // 매력 포인트와 퍼센트 값 저장
}

class MatchingDetail: UIViewController {

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

    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!

    @IBOutlet weak var mineButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexCode: "#FFFAF7")
        getColor()
        getImage()
        setCharmingPoint()
        setPointLabel()
        buttonStyle()
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
        let name = "이다성"
        switch name {
        case "송규섭" :
            return gepImageView.image = UIImage(named: "person1")
        case "이다성" :
            return gepImageView.image = UIImage(named: "person2")
        case "명노훈" :
            return gepImageView.image = UIImage(named: "person3")
        default:
            return gepImageView.image = UIImage(named: "person1")
        }

    }

    func setCharmingPoint() {
        charmingPoint.text = "나의 매력 포인트"
        charmingPoint.font = UIFont.boldSystemFont(ofSize: 21)
    }


    func setPointLabel() {
        let name = "이다성"
        let fullText = "\(name)님과 \n\n환상의 호흡이에요!"
        let boldText = "\(name)"
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
    }
}
