//
//  TaskPageView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.02.2024.
//

import UIKit

final class TaskPageView: UIView {
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
private extension TaskPageView {
    func initialize() {
        backgroundColor = UIColor.white
    }
}

//MARK: Make constraints
private extension TaskPageView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

//MARK: Lazy initialization
private extension TaskPageView {
    func makeTableView() -> TaskPageTableView {
        let view = TaskPageTableView()
        view.backgroundColor = UIColor(integralRed: 255, green: 255, blue: 255)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
