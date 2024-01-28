//
//  InfoCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoCell: UITableViewCell {
    lazy var label = makeInfoLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension InfoCell {
    func setup(text: String) {
        label.text = text
    }
}

//MARK: Make constraints
private extension InfoCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.scale),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension InfoCell {
    func makeInfoLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.backgroundColor = .white
        view.font = Fonts.Ubuntu.light(size: 16)
        view.layer.backgroundColor = UIColor(integralRed: 28, green: 28, blue: 28).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
