//
//  TaskPageDetailsCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.02.2024.
//

import UIKit

final class TaskPageDetailsCell: UITableViewCell {
    lazy var taskNameLabel = makeNameTaskLabel()
    lazy var taskStatusImageView = makeStatusTaskImageView()
    lazy var taskStatusLabel = makeStatusTaskLabel()
    lazy var taskDescriptionLabel = makeTaskDescriptionLabel()
    lazy var taskDateImageView = makeDateTaskImageView()
    lazy var taskDateLabel = makeDateTaskLabel()
    
    private let formater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        return formater
    }()
    
    private lazy var textAttrsDate = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .font(Fonts.Ubuntu.regular(size: 16))
        .lineHeight(28.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)
    
    private lazy var textAttrsStatusOpen = TextAttributes()
        .textColor(UIColor(integralRed: 25, green: 178, blue: 0))
        .font(Fonts.Ubuntu.regular(size: 14))
        .lineHeight(28.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)
    
    private lazy var textAttrsStatusClose = TextAttributes()
        .textColor(UIColor(integralRed: 242, green: 155, blue: 25))
        .font(Fonts.Ubuntu.regular(size: 14))
        .lineHeight(28.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension TaskPageDetailsCell {
    func setup(task: Task, status: TaskStatus) {
        taskNameLabel.text = task.name
        taskDescriptionLabel.text = task.description
        let attributedDate = formater.string(from: task.date).attributed(with: textAttrsDate)
        taskDateLabel.attributedText = attributedDate
        
        switch status {
        case .open(let image, let text):
            taskStatusImageView.image = image
            let attributedText = text.attributed(with: textAttrsStatusOpen)
            taskStatusLabel.attributedText = attributedText
        case .completed(let image, let text):
            taskStatusImageView.image = image
            let attributedText = text.attributed(with: textAttrsStatusClose)
            taskStatusLabel.attributedText = attributedText
        }
    }
}

//MARK: Private
private extension TaskPageDetailsCell {
    func initialize() {
        makeConstraints()
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension TaskPageDetailsCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30.scale),
            taskNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            taskNameLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 30.scale),
            
            taskStatusLabel.centerYAnchor.constraint(equalTo: taskNameLabel.centerYAnchor, constant: -1.scale),
            taskStatusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            taskStatusImageView.heightAnchor.constraint(equalToConstant: 8.scale),
            taskStatusImageView.widthAnchor.constraint(equalToConstant: 8.scale),
            taskStatusImageView.centerYAnchor.constraint(equalTo: taskNameLabel.centerYAnchor),
            taskStatusImageView.trailingAnchor.constraint(equalTo: taskStatusLabel.leadingAnchor, constant: -5.scale),
            
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
    
    func makeStatusTaskImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeStatusTaskLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
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
