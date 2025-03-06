//
//  ImageSliderViewController.swift
//  Sogaeteam
//
//  Created by 송규섭 on 3/4/25.
//

import UIKit


class ImageSliderViewController: UIViewController {

    private let images: [UIImage] = [
        UIImage(named: "DS")!,
        UIImage(named: "God")!,
        UIImage(named: "GodTwo")!,
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(hexCode: "ffffff")
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private lazy var pageControl: CustomPageControl = {
        let control = CustomPageControl()
        control.numberOfPages = images.count
        control.translatesAutoresizingMaskIntoConstraints = false
        
        return control
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("매칭 결과 확인하기", for: .normal)
        button.setTitleColor(UIColor(hexCode: "403524"), for: .normal)
        button.backgroundColor = UIColor(hexCode: "ffd371")
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        actionButton.addTarget(self, action: #selector(didTapResultButton), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hexCode: "fffaf7")
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(actionButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            pageControl.widthAnchor.constraint(equalToConstant: 150),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -16),
            actionButton.widthAnchor.constraint(equalToConstant: 180),
            actionButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc private func didTapResultButton() {
        print("result 버튼 탭!!")
    }
    
}

extension ImageSliderViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            print("이미지셀 is nil")
            return UICollectionViewCell()
        }
        cell.configureImage(image: images[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
    }
    
}


// 총 페이지 너비 (스크롤 영역 ) = 페이지 개수 * pageWidth
// currentPage * pageWidth = Int(scrollView.contentOffset.x + pageWidth / 2)
