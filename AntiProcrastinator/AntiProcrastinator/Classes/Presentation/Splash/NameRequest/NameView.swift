//
//  NameView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class NameView: UIView {
    lazy var whiteBackgroundView = makeWhiteBackgroundView()
    lazy var nameLabel = makeNameLabel()
    lazy var nameTextField = makeNameTextField()
    lazy var continueButton = makeContinueButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Make constraints
private extension NameView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            whiteBackgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            whiteBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5.scale),
            whiteBackgroundView.heightAnchor.constraint(equalToConstant: 172.scale),
            whiteBackgroundView.widthAnchor.constraint(equalToConstant: 343.scale),
            
            nameLabel.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor, constant: 5.scale),
            nameLabel.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20.scale),
            nameLabel.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -20.scale),
            
            nameTextField.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -15.scale),
            nameTextField.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20.scale),
            nameTextField.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -20.scale),
            nameTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            
            continueButton.bottomAnchor.constraint(equalTo: whiteBackgroundView.bottomAnchor, constant: -15.scale),
            continueButton.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20.scale),
            continueButton.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -20.scale),
            continueButton.heightAnchor.constraint(equalToConstant: 50.scale)
            
        ])
    }
}

// MARK: Lazy initialization
private extension NameView {
    func makeWhiteBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 255, green: 255, blue: 255, alpha: 1)
        view.layer.cornerRadius = 20.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeNameLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29, alpha: 1))
            .lineHeight(28.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.medium(size: 17))
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "NameRequest.Name.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
    
    func makeNameTextField() -> UITextField {
        let placeHolderAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170, alpha: 1))
            .lineHeight(24.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.bold(size: 16))
            .letterSpacing(-0.41.scale)
        
        let defaultTextAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29, alpha: 1))
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .lineHeight(24.scale)
            .letterSpacing(-0.38.scale)
        
        let view = UITextField()
        view.attributedPlaceholder = "NameRequest.NameFormat.Text".localized.attributed(with: placeHolderAttrs)
        view.defaultTextAttributes = defaultTextAttrs.dictionary
        view.borderStyle = .none
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.size.height))
        view.leftViewMode = .always
        view.layer.cornerRadius = 12.scale
        view.backgroundColor = UIColor(integralRed: 243, green: 244, blue: 247, alpha: 1)
        view.keyboardType = .alphabet
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
    
    func makeContinueButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .textAlignment(.center)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("NameRequest.Continue.Text".localized.attributed(with: attr), for: .normal)
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209, alpha: 0.6)
        view.layer.cornerRadius = 12.scale
        view.isEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
}
