//
//  AlertView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 12.02.2024.
//

import UIKit

final class AlertView: UIView {
    lazy var whiteBackgroundView = makeWhiteBackgroundView()
    lazy var titleLabel = makeTitleLabel()
    lazy var textLabel = makeTextLabel(userName: "")
    lazy var closeButton = makeCloseButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Make constraints
private extension AlertView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            whiteBackgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            whiteBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -45.scale),
            whiteBackgroundView.heightAnchor.constraint(equalToConstant: 240.scale),
            whiteBackgroundView.widthAnchor.constraint(equalToConstant: 343.scale),
            
            titleLabel.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 52.scale),
            titleLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor),
            
            textLabel.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 15.scale),
            textLabel.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15.scale),
            textLabel.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -15.scale),
            
            closeButton.heightAnchor.constraint(equalToConstant: 48.scale),
            closeButton.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 15.scale),
            closeButton.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15.scale),
            closeButton.bottomAnchor.constraint(equalTo: whiteBackgroundView.bottomAnchor, constant: -15.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension AlertView {
    func makeWhiteBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 255, green: 255, blue: 255, alpha: 1)
        view.layer.cornerRadius = 20.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let attr = TextAttributes()
            .lineHeight(28.scale)
            .textAlignment(.center)
            .font(Fonts.Ubuntu.regular(size: 52))
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "AddTasl.AlertTitle.Text".localized.attributed(with: attr)
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
    
    func makeTextLabel(userName: String) -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29, alpha: 1))
            .lineHeight(20.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        let fullText = "\(userName) " + "AddTask.Alert.Text".localized
        view.attributedText = fullText.attributed(with: attr)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
    
    func makeCloseButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .textAlignment(.center)
            .font(Fonts.Ubuntu.medium(size: 17))
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("AddTask.CloseButton.Text".localized.attributed(with: attr), for: .normal)
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209, alpha: 1)
        view.layer.cornerRadius = 12.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
}
