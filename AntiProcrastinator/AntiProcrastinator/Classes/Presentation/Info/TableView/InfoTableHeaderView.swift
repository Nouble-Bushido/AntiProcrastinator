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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
//MARK: Public
    extension InfoTableHeaderView {
        func configure(withTitle title: String, isExpanded: Bool, section: Int, target: Any?, action: Selector) {
            label.text = title
            button.setImage(UIImage(systemName: isExpanded ? "chevron.up" : "chevron.down"), for: .normal)
            button.tag = section
            button.addTarget(target, action: action, for: .touchUpInside)
        }
    }

//MARK: Make constraints
private extension InfoTableHeaderView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.scale),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.scale),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.scale)
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
        view.tintColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
