//
//  ResultViewController.swift
//  Sogaeteam
//
//  Created by NH on 3/4/25.
//

import UIKit
import SafariServices

class ResultViewController: UIViewController {
    @IBOutlet weak var resultCollectionView: UICollectionView!
    @IBOutlet var resultView: UIView!
    @IBOutlet weak var teamGoalLabel: UILabel!
    @IBOutlet weak var titmeTableLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var resultTimeTableView: UIView!
    @IBOutlet weak var resultTeamGoalView: UIView!
    
    var resultList: [Result] = Result.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
        
        // 배경색 설정
        resultView.backgroundColor = UIColor(hexCode: "FFFAF7")
        resultCollectionView.backgroundColor = UIColor(hexCode: "FFFAF7")
        
        if let flowlayout = resultCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // 오토레이아웃으로 셀 내 이미지뷰가 중앙정렬이 안되서 코드로 억지로 중앙정렬 시킴
        resultCollectionView.contentInset = UIEdgeInsets(top:0, left: 10, bottom: 0, right: 10)

        // 라벨 글씨 굵게
        teamGoalLabel.setAttributedText(fullText: "2팀은,\n완주가 목표에요!\n즐거운 만남을 추구해요!\n건강한 소통을 중시해요!", boldTexts: [
                ("2팀", UIFont.boldSystemFont(ofSize: 18)),
                ("완주가 목표", UIFont.boldSystemFont(ofSize: 18)),
                ("즐거운 만남", UIFont.boldSystemFont(ofSize: 18)),
                ("건강한 소통", UIFont.boldSystemFont(ofSize: 18))
            ]
        )
        
        // 라벨 글씨 굵게
        titmeTableLabel.setAttributedText(fullText: "오전 9시 30분 회의가 있어요!\n식사는 12시~13시 / 18~19시에 해요\n오후 3시에 중간 회의를 해요\n오후 8시 40분 마지막 강평 회의를 해요", boldTexts: [
                ("오전 9시 30분 회의", UIFont.boldSystemFont(ofSize: 18)),
                ("오후 3시에 중간 회의", UIFont.boldSystemFont(ofSize: 18)),
                ("오후 8시 40분 마지막 강평 회의", UIFont.boldSystemFont(ofSize: 18))
            ]
        )
        
        // View 둥굴게 만들기
        resultTeamGoalView.layer.cornerRadius = 15
        resultTimeTableView.layer.cornerRadius = 15
        
        // View 배경색 지정
        resultTeamGoalView.backgroundColor = UIColor(hexCode: "FDFCFC")
        resultTimeTableView.backgroundColor = UIColor(hexCode: "FDFCFC")
        
        // 버튼 배경색 지정
        buttonColorChange(resultButton, color: "FFD371")
        
        resultButton.addTarget(self, action: #selector(didTapResultButton), for: .touchUpInside)
    }
    
    @objc private func didTapResultButton() {
        let safariVC = SFSafariViewController(url: URL(string: "https://github.com/sparta-bootcamp-iOS-2team/Sogaeteam")!)
        
        self.present(safariVC, animated: true)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath) as? ResultCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let result = resultList[indexPath.item]
        cell.resultConfigure(result)
        return cell
    }
}

extension ResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 20
        let padding: CGFloat = 20 // contentInset 수치에 맞춰서 넣어줌

        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3 // 셀이 3개가 나란히 출력하기 위해 너비 값 설정

        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    // 연속되는 열에 있는 아이템 사이의 최소 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }


}


