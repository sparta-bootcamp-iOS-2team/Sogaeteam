//
//  CustomPageControl.swift
//  Sogaeteam
//
//  Created by 송규섭 on 3/4/25.
//

import UIKit

class CustomPageControl: UIView {

    private let stackView = UIStackView()
    private var indicators = [UIView]()
    private let indicatorWidth: CGFloat = 20
    private let indicatorHeight: CGFloat = 3
    private let spacing: CGFloat = 2
    private let selectedColor = UIColor.white
    private let defaultColor = UIColor.white.withAlphaComponent(0.3)
    
    var currentPage: Int = 0 {
        didSet {
            updateIndicator()
        }
    }
    
    var numberOfPages: Int = 3 {
        didSet {
            setupIndicators()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = spacing
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func setupIndicators() {
        indicators.forEach { $0.removeFromSuperview() }
        indicators.removeAll()
        
        for _ in 0..<numberOfPages {
            let indicator = UIView()
            indicator.layer.cornerRadius = 2
            indicator.backgroundColor = defaultColor
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.widthAnchor.constraint(equalToConstant: indicatorWidth).isActive = true
            indicator.heightAnchor.constraint(equalToConstant: indicatorHeight).isActive = true
            stackView.addArrangedSubview(indicator)
            indicators.append(indicator)
        }
        
        updateIndicator()
    }
    
    private func updateIndicator() {
        for (index, indicator) in indicators.enumerated() {
            if index == currentPage {
                UIView.animate(withDuration: 0.3) {
                    indicator.backgroundColor = self.selectedColor
                }
            }
            else {
                UIView.animate(withDuration: 0.3) {
                    indicator.backgroundColor = self.defaultColor
                }
            }
        }
    }
    
}
