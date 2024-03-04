//
//  TaskPageDetailsCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.02.2024.
//

import UIKit

final class TaskPageDetailsCell: UITableViewCell {
    lazy var taskNameLabel = makeNameTaskLabel()
    lazy var statusView = makeStatusView()
    lazy var statusIconView = makeStatusIconView()
    lazy var statusLabel = makeStatusLabel()
    lazy var taskDescriptionLabel = makeTaskDescriptionLabel()
    lazy var taskDateImageView = makeDateTaskImageView()
    lazy var taskDateLabel = makeDateTaskLabel()
    
    private let formater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        return formater
    }()
    
    private lazy var textAttrsTaskName = TextAttributes()
        .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
        .font(Fonts.Ubuntu.medium(size: 18))
        .lineHeight(28.scale)
        .textAlignment(.left)
        .letterSpacing(-0.41.scale)
    
    private lazy var textAttrsStatus = TextAttributes()
        .font(Fonts.Ubuntu.regular(size: 14))
        .lineHeight(28.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)

    private lazy var textAttrsDescription = TextAttributes()
        .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
        .font(Fonts.Ubuntu.light(size: 14))
        .lineHeight(28.scale)
        .textAlignment(.left)
        .letterSpacing(-0.41.scale)
    
    private lazy var textAttrsDate = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .font(Fonts.Ubuntu.regular(size: 16))
        .lineHeight(28.scale)
        .textAlignment(.center)
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
extension TaskPageDetailsCell {
    func setup(task: Task, status: TaskStatus) {
        let attributedTaskName = task.name.attributed(with: textAttrsTaskName)
        taskNameLabel.attributedText = attributedTaskName
        
        let attributedDescription = task.description.attributed(with: textAttrsDescription)
        taskDescriptionLabel.attributedText = attributedDescription
        
        let attributedDate = formater.string(from: task.date).attributed(with: textAttrsDate)
        taskDateLabel.attributedText = attributedDate
        
        let textColor = UIColor(integralRed: status.colorComponents.red,
                                green: status.colorComponents.green,
                                blue: status.colorComponents.blue)
        let currentTextAttrStatus = textAttrsStatus.textColor(textColor)
        
        let attributedStatus = status.text.attributed(with: currentTextAttrStatus)
        statusLabel.attributedText = attributedStatus
        
        statusIconView.backgroundColor = UIColor(integralRed: status.colorComponents.red,
                                                 green: status.colorComponents.green,
                                                 blue: status.colorComponents.blue)
    }
}

//MARK: Private
private extension TaskPageDetailsCell {
    func initialize() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}

//MARK: Make constraints
private extension TaskPageDetailsCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30.scale),
            taskNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            taskNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: statusView.leadingAnchor, constant: -10.scale),
            
            statusView.centerYAnchor.constraint(equalTo: taskNameLabel.centerYAnchor),
            statusView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            statusIconView.leadingAnchor.constraint(equalTo: statusView.leadingAnchor),
            statusIconView.centerYAnchor.constraint(equalTo: statusView.centerYAnchor),
            statusIconView.widthAnchor.constraint(equalToConstant: 8.scale),
            statusIconView.heightAnchor.constraint(equalToConstant: 8.scale),
            
            statusLabel.leadingAnchor.constraint(equalTo: statusIconView.trailingAnchor, constant: 5.scale),
            statusLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor),
            
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 10.scale),
            taskDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            taskDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            taskDateImageView.heightAnchor.constraint(equalToConstant: 24.scale),
            taskDateImageView.widthAnchor.constraint(equalToConstant: 24.scale),
            taskDateImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            taskDateImageView.topAnchor.constraint(equalTo: taskDescriptionLabel.bottomAnchor, constant: 20.scale),
            
            taskDateLabel.centerYAnchor.constraint(equalTo: taskDateImageView.centerYAnchor),
            taskDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 39.scale),
            taskDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        taskNameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        taskNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
}

//MARK: Lazy initialization
private extension TaskPageDetailsCell {
    func makeNameTaskLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeStatusView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeStatusIconView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        statusView.addSubview(view)
        return view
    }
    
    func makeStatusLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        statusView.addSubview(view)
        return view
    }
    
    func makeTaskDescriptionLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeDateTaskImageView() -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: "TaskPage.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeDateTaskLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
