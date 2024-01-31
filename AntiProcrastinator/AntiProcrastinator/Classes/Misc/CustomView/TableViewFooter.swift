//
//  TableViewFooter.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.01.2024.
//

import UIKit

class TableViewFooter: UIView {
    lazy var continueButton = makeContinueButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewFooter {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            continueButton.heightAnchor.constraint(equalToConstant: 50.scale),
            continueButton.topAnchor.constraint(equalTo: topAnchor, constant: 20.scale),
            continueButton.widthAnchor.constraint(equalToConstant: 300.scale),
            continueButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

extension TableViewFooter {
    func makeContinueButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .textAlignment(.center)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("Info.Start.Text".localized.attributed(with: attr), for: .normal)
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.layer.cornerRadius = 12.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
