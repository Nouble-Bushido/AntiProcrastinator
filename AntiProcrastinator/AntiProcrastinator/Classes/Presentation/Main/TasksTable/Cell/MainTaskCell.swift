//
//  MainTaskCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class MainTaskCell: UITableViewCell {
    lazy var backgroundUIView = makeBackgroundView()
    lazy var taskNameLabel = makeTaskNameLabel()
    lazy var timeTaskLabel = makeTimeTaskLabel()
    
    private lazy var textAttrsTaskName = TextAttributes()
        .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.regular(size: 16))
        .letterSpacing(-0.20.scale)
    
    private lazy var textAttrsTimeTask = TextAttributes()
        .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.light(size: 12))
        .letterSpacing(-0.20.scale)
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
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
extension MainTaskCell {
    func setup(task: Task) {
        taskNameLabel.attributedText = task.name.attributed(with: textAttrsTaskName)
        timeTaskLabel.attributedText = dateFormatter.string(from: task.date).attributed(with: textAttrsTimeTask)
    }
}

//MARK: Private
private extension MainTaskCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension MainTaskCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            backgroundUIView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.scale),
            backgroundUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.scale),
            backgroundUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            backgroundUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            taskNameLabel.trailingAnchor.constraint(equalTo: backgroundUIView.trailingAnchor),
            taskNameLabel.topAnchor.constraint(equalTo: backgroundUIView.topAnchor, constant: 5.scale),
            taskNameLabel.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale),
            
            timeTaskLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor),
            timeTaskLabel.trailingAnchor.constraint(equalTo: backgroundUIView.trailingAnchor),
            timeTaskLabel.bottomAnchor.constraint(equalTo: backgroundUIView.bottomAnchor, constant: -5.scale),
            timeTaskLabel.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension MainTaskCell {
    func makeBackgroundView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(integralRed: 241, green: 243, blue: 252)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeTaskNameLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(view)
        return view
    }
    
    func makeTimeTaskLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(view)
        return view
    }
}
