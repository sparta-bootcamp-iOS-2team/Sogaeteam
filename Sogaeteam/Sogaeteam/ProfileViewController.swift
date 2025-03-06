//
//  ProfileDetailViewController.swift
//  Sogaeteam
//
//  Created by 송규섭 on 3/4/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var imageSliderVC = ImageSliderViewController()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필"
        label.textColor = UIColor(hexCode: "403524")
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let bottomBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexCode: "fdfcfc", alpha: 1.0)
        view.layer.cornerRadius = 15.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이다성"
        label.textColor = UIColor(hexCode: "403524")
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "31"
        label.textColor = UIColor(hexCode: "403524")
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "서울 동작구"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let blogLabel: UILabel = {
        let label = UILabel()
        label.text = "https://uddt.tistory.com/"
        label.textColor = UIColor(hexCode: "403524")
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let roleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS 앱 개발자"
        label.textColor = UIColor(hexCode: "403524")
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let bloodTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "O형"
        label.textColor = UIColor(hexCode: "403524")
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let tagsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexCode: "cacaca")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요 ㅋㅋ\n차은우는 아닙니다 ㅋ"
        label.textColor = UIColor(hexCode: "403524")
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupChildViewController()
        setupConstraints()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexCode: "fffaf7")
        setupCustomBackButton()
        
        self.view.backgroundColor = UIColor(hexCode: "fffaf7")
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
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // 태그 생성
        let tags = ["ENTJ", "사진", "여행", "기획"]
        let tagColors: [UIColor] = [.systemGreen, .systemPurple, .systemBlue, .systemBlue]
        
        for (index, tag) in tags.enumerated() {
            let tagView = createTagView(text: tag, color: tagColors[index])
            tagsStackView.addArrangedSubview(tagView)
        }
        
        // 스크롤뷰 추가
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // UI 요소 추가
        view.addSubview(profileHeaderLabel)
        
        contentView.addSubview(bottomBackgroundView)
        bottomBackgroundView.addSubview(nameLabel)
        bottomBackgroundView.addSubview(locationLabel)
        bottomBackgroundView.addSubview(blogLabel)
        bottomBackgroundView.addSubview(roleLabel)
        bottomBackgroundView.addSubview(ageLabel)
        bottomBackgroundView.addSubview(bloodTypeLabel)
        bottomBackgroundView.addSubview(tagsStackView)
        bottomBackgroundView.addSubview(separatorLine)
        bottomBackgroundView.addSubview(bioLabel)
    }
    
    private func setupChildViewController() {
        
        // 자식 뷰컨트롤러로 추가
        addChild(imageSliderVC)
        view.addSubview(imageSliderVC.view)
        imageSliderVC.didMove(toParent: self)
        
        // 이미지 슬라이더 뷰 제약조건 설정
        imageSliderVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageSliderVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageSliderVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageSliderVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageSliderVC.view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0) // 사진 비율 1:1
        ])
    }
    
    private func setupConstraints() {
        // 기본 scrollView 제약조건
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: profileHeaderLabel.bottomAnchor, constant: 4),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // contentView 제약조건
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // contentView의 height는 최소한 scrollView의 height보다 커야 스크롤이 가능합니다
        // 단, 내용물이 scrollView보다 작을 경우는 scrollView의 height와 같아야 합니다
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow // 우선순위 낮게 설정해 다른 제약조건에 의해 높이가 늘어날 수 있도록 함
        contentViewHeightConstraint.isActive = true

        NSLayoutConstraint.activate([
            // 프로필 헤더
            profileHeaderLabel.topAnchor.constraint(equalTo: imageSliderVC.view.bottomAnchor, constant: 12),
            profileHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            bottomBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bottomBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bottomBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // 이름과 나이
            nameLabel.topAnchor.constraint(equalTo: bottomBackgroundView.topAnchor, constant: 22),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 12),
            ageLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            
            // 위치 정보
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            locationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            // URL 정보
            blogLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            blogLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            // 추가 정보 1
            roleLabel.topAnchor.constraint(equalTo: blogLabel.bottomAnchor, constant: 10),
            roleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            // 추가 정보 2
            bloodTypeLabel.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: 10),
            bloodTypeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            // 태그 스택뷰
            tagsStackView.topAnchor.constraint(equalTo: bloodTypeLabel.bottomAnchor, constant: 12),
            tagsStackView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            tagsStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
            
            separatorLine.leadingAnchor.constraint(equalTo: bottomBackgroundView.leadingAnchor, constant: 4),
            separatorLine.trailingAnchor.constraint(equalTo: bottomBackgroundView.trailingAnchor, constant: -4),
            separatorLine.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor, constant: 8),
            separatorLine.heightAnchor.constraint(equalToConstant: 2),
            
            // 자기소개
            bioLabel.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 10),
            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            bioLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomBackgroundView.bottomAnchor, constant: -20)
        ])
    }
    
    // 태그 뷰 생성 함수
    private func createTagView(text: String, color: UIColor) -> UIView {
        let container = UIView()
        container.backgroundColor = color
        container.layer.cornerRadius = 12
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 6),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -6),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12)
        ])
        
        return container
    }
}
