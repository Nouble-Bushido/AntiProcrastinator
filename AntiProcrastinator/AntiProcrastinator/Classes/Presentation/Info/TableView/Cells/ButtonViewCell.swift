//
//  ButtonViewCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 01.02.2024.
//

import UIKit

final class ButtonViewCell: UITableViewCell {
    lazy var continueButton = makeContinueButton()
    var continueButtonTappedHandler: (() -> Void)?
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
        .textAlignment(.center)
        .font(Fonts.Ubuntu.regular(size: 16))
        .letterSpacing(-0.41.scale)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension ButtonViewCell {
    func setup(name: String) {
        continueButton.setTitle(name, for: .normal)
    }
}

//MARK: Private
private extension ButtonViewCell {
    func initialize() {
        selectionStyle = .none
    }
    
    @objc func continueButtonTapped() {
              continueButtonTappedHandler?()
          }
}

//MARK: Make constraints
private extension ButtonViewCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            continueButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 50.scale),
            continueButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.scale),
            continueButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.scale),
            continueButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension ButtonViewCell {
    func makeContinueButton() -> UIButton {
        let view = UIButton()
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.layer.cornerRadius = 12.scale
        view.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
