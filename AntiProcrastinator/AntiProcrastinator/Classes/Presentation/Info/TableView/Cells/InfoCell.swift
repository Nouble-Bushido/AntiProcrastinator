//
//  InfoCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoCell: UITableViewCell {
    lazy var label = makeInfoLabel()
    lazy var separatorView = makeSeparatorView()
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.light(size: 16))
        .letterSpacing(-0.20.scale)
    
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
extension InfoCell {
    func setup(text: String) {
        let attributedText = text.attributed(with: textAttrs)
        label.attributedText = attributedText
    }
}

//MARK: Private
private extension InfoCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension InfoCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.scale),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25.scale),
            
            separatorView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10.scale),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.scale),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25.scale),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
}

//MARK: Lazy initialization
private extension InfoCell {
    func makeInfoLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 200, green: 200, blue: 200)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
