//
//  TasksCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class MainCell: UITableViewCell {
    lazy var taskNameLabel = makeTaskNameLabel()
    
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
extension MainCell {
    func setup(task: Task) {
        let attributedString = task.name.attributed(with: textAttrs)
        taskNameLabel.attributedText = attributedString
    }
}

//MARK: Private
private extension MainCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension MainCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            taskNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            taskNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10.scale),
            taskNameLabel.topAnchor.constraint(equalTo: topAnchor),
            taskNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension MainCell {
    func makeTaskNameLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
