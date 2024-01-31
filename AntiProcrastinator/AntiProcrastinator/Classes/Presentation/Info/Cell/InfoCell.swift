//
//  InfoCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoCell: UITableViewCell {
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor.black)
        .lineHeight(18.scale)
        .font(Fonts.Ubuntu.light(size: 16))
        .letterSpacing(-0.41.scale)

    lazy var label = makeInfoLabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

//MARK: Make constraints
private extension InfoCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.scale),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
}
