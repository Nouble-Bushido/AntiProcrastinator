//
//  MainMotivationView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 09.03.2024.
//

import UIKit

final class MainMotivationView: UIView {
    lazy var smallCyrcleView = makeSmallCyrcleView()
    lazy var bigCyrcleView = makeBigCyrcleView()
    lazy var motivationLabel = makeMotivationLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Private
private extension MainMotivationView {
    func initialize() {
        backgroundColor = UIColor.clear
    }
}

//MARK: Make Constraints
private extension MainMotivationView {
   func makeConstraints(){
        NSLayoutConstraint.activate([
            motivationLabel.topAnchor.constraint(equalTo: topAnchor),
            motivationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65.scale),
            motivationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28.scale),
            
            bigCyrcleView.widthAnchor.constraint(equalToConstant: 17.scale),
            bigCyrcleView.heightAnchor.constraint(equalToConstant: 17.scale),
            bigCyrcleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11.scale),
            bigCyrcleView.topAnchor.constraint(equalTo: motivationLabel.bottomAnchor, constant: 5.scale),
            
            smallCyrcleView.widthAnchor.constraint(equalToConstant: 11.scale),
            smallCyrcleView.heightAnchor.constraint(equalToConstant: 11.scale),
            smallCyrcleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            smallCyrcleView.topAnchor.constraint(equalTo: bigCyrcleView.bottomAnchor, constant: 5.scale),
            smallCyrcleView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

//MARK: Lazy initialization
private extension MainMotivationView {
    func makeSmallCyrcleView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 5.5.scale
        view.backgroundColor = UIColor(integralRed: 210, green: 214, blue: 242)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }

    func makeBigCyrcleView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 8.5.scale
        view.backgroundColor = UIColor(integralRed: 141, green: 155, blue: 232)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }

    func makeMotivationLabel() -> PaddingLabel {
        let textAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .lineHeight(18.scale)
            .font(Fonts.Ubuntu.regular(size: 14))
            .letterSpacing(-0.41.scale)

        let view = PaddingLabel()
        view.numberOfLines = 0
        view.attributedText = "Помнишь девушку из кафе? Может, она сейчас там сидит. Иди познакомься".attributed(with: textAttrs)
        view.paddingLeft = 10.scale
        view.paddingRight = 20.scale
        view.layer.cornerRadius = 15.scale
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
