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
                motivationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65.scale),
                motivationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28.scale),
                motivationLabel.heightAnchor.constraint(equalToConstant: 70.scale),
                motivationLabel.bottomAnchor.constraint(equalTo: bigCyrcleView.topAnchor),
                
                bigCyrcleView.widthAnchor.constraint(equalToConstant: 17.scale),
                bigCyrcleView.heightAnchor.constraint(equalToConstant: 17.scale),
                bigCyrcleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11.scale),
                bigCyrcleView.bottomAnchor.constraint(equalTo: smallCyrcleView.topAnchor),
                
                smallCyrcleView.widthAnchor.constraint(greaterThanOrEqualToConstant: 11.scale),
                smallCyrcleView.heightAnchor.constraint(greaterThanOrEqualToConstant: 11.scale),
                smallCyrcleView.leadingAnchor.constraint(equalTo: leadingAnchor),
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
            .lineHeight(20.scale)
            .letterSpacing(-0.41.scale)
            .font(Fonts.Ubuntu.regular(size: 16))
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
        
        let view = PaddingLabel()
        view.numberOfLines = 0
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15.scale
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.attributedText = "Main.Motivation.Text".localized.attributed(with: textAttrs)
        view.padding = UIEdgeInsets(top: 1, left: 10.scale, bottom: 0.scale, right: 25.scale)
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
