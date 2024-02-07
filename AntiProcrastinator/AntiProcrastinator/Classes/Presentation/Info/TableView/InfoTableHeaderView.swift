//
//  InfoTableHeaderView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.01.2024.
//

import UIKit

class InfoTableHeaderView: UIView {
    lazy var label = makeLabel()
    lazy var button = makeButton()
    lazy var separatorView = makeSeparatorView()
    var toggleSectionHandler: (() -> Void)?
    
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
        .textAlignment(.center)
        .font(Fonts.Ubuntu.medium(size: 16))
        .letterSpacing(-0.41.scale)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(integralRed: 255, green: 255, blue: 255)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
//MARK: Public
    extension InfoTableHeaderView {
        func configure(withTitle title: String, isExpanded: Bool, section: Int, hasSeparator: Bool) {
            let attributedText = title.attributed(with: textAttrs)
            label.attributedText = attributedText
            button.setImage(UIImage(systemName: isExpanded ? "chevron.up" : "chevron.down"), for: .normal)
            separatorView.isHidden = !hasSeparator
        }
    }

//MARK: Private
private extension InfoTableHeaderView {
    @objc func sectionToggleButtonTapped() {
        toggleSectionHandler?()
    }
}

//MARK: Make constraints
private extension InfoTableHeaderView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.scale),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10.scale),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22.scale),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10.scale),
            
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.scale),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25.scale),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
}

//MARK: lazy initialization
private extension InfoTableHeaderView {
    func makeLabel() -> UILabel {
        let view = UILabel()
        view.font = Fonts.Ubuntu.medium(size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeButton() -> UIButton {
        let view = UIButton()
        view.tintColor = UIColor(integralRed: 0, green: 0, blue: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(sectionToggleButtonTapped), for: .touchUpInside)
        addSubview(view)
        return view
    }
    
    func makeSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 200, green: 200, blue: 200)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
