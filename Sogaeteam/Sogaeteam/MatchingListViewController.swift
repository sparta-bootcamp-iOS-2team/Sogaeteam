//
//  MatchingListViewController.swift
//  Sogaeteam
//
//  Created by NH on 3/4/25.
//

import UIKit

class MatchingListViewController: UIViewController {
    @IBOutlet weak var matchingCollectionView: UICollectionView!
    @IBOutlet weak var matchingTitle: UILabel!
    @IBOutlet var matchingView: UIView!
    @IBOutlet weak var matchingButton: UIButton!
    
    let matchingList : [Matching] = Matching.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchingCollectionView.backgroundColor = UIColor(hexCode: "FFFAF7")
        
        matchingCollectionView.dataSource = self
        matchingCollectionView.delegate = self
        
        // 배경색 설정
        matchingView.backgroundColor = UIColor(hexCode: "FFFAF7")
        
        
        // 타이틀 라벨 폰틑 설정
        let fullText = "정확한 매칭을 위해\n해당되는 항목을 선택해주세요!"
        let boldText1 = "정확한 매칭"
        let boldText2 = "항목을 선택"
                
        let attributedString = NSMutableAttributedString(string: fullText)
                
        // ✅ "정확한 매칭" 부분을 Bold 처리
        if let range = fullText.nsRange(of: boldText1) {
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        }
                
        // ✅ "항목을 선택" 부분을 Bold 처리
        if let range = fullText.nsRange(of: boldText2) {
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        }
                
        // UILabel에 적용
        matchingTitle.attributedText = attributedString
        
        
        // ✅ 여러 개의 셀을 동시에 선택할 수 있도록 설정
        matchingCollectionView.allowsMultipleSelection = true
        
        // 버튼 색상 변경
        buttonColorChange(matchingButton, color: "FFD371")
        
        matchingButton.addTarget(self, action: #selector(didTapMatchingButton), for: .touchUpInside)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
            // ✅ 네비게이션 바 숨기기
            self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            
            // ✅ 네비게이션 바 다시 보이기 (다른 뷰로 이동할 때)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func didTapMatchingButton() {
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// 버튼 색 변경 함수
func buttonColorChange(_ sender: UIButton, color: String) {
    sender.tintColor = UIColor(hexCode: color)
}

// 컬렉션 뷰 셀 코드 연결
extension MatchingListViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matchingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "matchingListTableViewCell", for: indexPath) as! MatchingListCollectionViewCell
        
        let matching = matchingList[indexPath.item]
        
        cell.configure(matching)
        
        return cell
    }
}

extension MatchingListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 50, height: 50)
    }
}

