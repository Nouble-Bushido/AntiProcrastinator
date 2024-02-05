//
//  InfoView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoView: UIView {
    lazy var tableView = makeTableView()

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
private extension InfoView {
    func initialize() {
        backgroundColor = UIColor.white
    }
}

//MARK: Constraints
private extension InfoView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.scale),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: -47.scale),
        ])
    }
}

//MARK: Lazy initialization
private extension InfoView {
    func makeTableView() -> InfoTableView {
        let view = InfoTableView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
