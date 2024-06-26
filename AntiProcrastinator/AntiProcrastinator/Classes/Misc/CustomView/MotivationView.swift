//
//  MotivationView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 03.04.2024.
//

import UIKit

class MotivationView: UIView {
    lazy var smallCircleView = makeSmallCircleView()
    lazy var bigCircleView = makeBigCircleView()
    lazy var motivationLabel = makeMotivationLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(motivationText: NSAttributedString, bgColor: UIColor, smallCircleColor: UIColor, bigCircleColor: UIColor, maskedCorners: CACornerMask, cornerRadius: CGFloat, maskToBounds: Bool) {
        motivationLabel.attributedText = motivationText
        motivationLabel.layer.cornerRadius = cornerRadius
         motivationLabel.layer.masksToBounds = maskToBounds
        backgroundColor = bgColor
        smallCircleView.backgroundColor = smallCircleColor
        bigCircleView.backgroundColor = bigCircleColor
        motivationLabel.layer.maskedCorners = maskedCorners
    }
}

private extension MotivationView {
    func initialize() {
        backgroundColor = UIColor.clear
    }
}

 extension MotivationView {
     func setupConstraints(_ constraints: [NSLayoutConstraint]) {
         removeConstraints(self.constraints)
         NSLayoutConstraint.activate(constraints)
     }
}

private extension MotivationView {
    func makeSmallCircleView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 5.5.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeBigCircleView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 8.5.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeMotivationLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
