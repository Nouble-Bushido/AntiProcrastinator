//
//  TaskPageClosedTaskView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class TaskPageClosedTaskView: UIView {
    lazy var mainImageView = makeImageView()
    lazy var persuadeLabel = makePersuadeLabel()
    lazy var taskNameLabel = makeNameTaskLabel()
    lazy var statusTaskImageView = makeStatusTaskImageView()
    lazy var statusTaskLabel = makeStatusTaskLabel()
    lazy var taskDescriptionLabel = makeTaskDescription()
    lazy var dateTaskImageView = makeDateTaskImageView()
    lazy var dateTaskLabel = makeDateTaskLabel()
    
    private lazy var textAttrsName = TextAttributes()
        .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
        .font(Fonts.Ubuntu.medium(size: 18))
        .lineHeight(28.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)
    
    private lazy var textAttrsDescription = TextAttributes()
        .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
        .font(Fonts.Ubuntu.light(size: 14))
        .lineHeight(20.scale)
        .textAlignment(.left)
        .letterSpacing(-0.41.scale)
    
    private lazy var textAttrsDate = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .font(Fonts.Ubuntu.regular(size: 16))
        .lineHeight(28.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)
    
    private let formater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        return formater
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTask(task: Task) {
        taskNameLabel.attributedText = task.name.attributed(with: textAttrsName)
        taskDescriptionLabel.attributedText = task.description.attributed(with: textAttrsDescription)
        let attributedDate = formater.string(from: task.date).attributed(with: textAttrsDate)
        dateTaskLabel.attributedText = attributedDate
    }
}

//MARK: Private
private extension TaskPageClosedTaskView {
    func initialize() {
        backgroundColor = UIColor.white
    }
}

//MARK: Make constraints
private extension TaskPageClosedTaskView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 95.scale),
            mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 237.scale),
            mainImageView.widthAnchor.constraint(equalToConstant: 237.scale),
            
            persuadeLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10.scale),
            persuadeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            persuadeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            
            taskNameLabel.topAnchor.constraint(equalTo: persuadeLabel.bottomAnchor, constant: 30.scale),
            taskNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            
            statusTaskLabel.centerYAnchor.constraint(equalTo: taskNameLabel.centerYAnchor, constant: -1.scale),
            statusTaskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            
            statusTaskImageView.heightAnchor.constraint(equalToConstant: 8.scale),
            statusTaskImageView.widthAnchor.constraint(equalToConstant: 8.scale),
            statusTaskImageView.centerYAnchor.constraint(equalTo: taskNameLabel.centerYAnchor),
            statusTaskImageView.trailingAnchor.constraint(equalTo: statusTaskLabel.leadingAnchor, constant: -5.scale),
            
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 10.scale),
            taskDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            taskDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            
            dateTaskImageView.heightAnchor.constraint(equalToConstant: 24.scale),
            dateTaskImageView.widthAnchor.constraint(equalToConstant: 24.scale),
            dateTaskImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            dateTaskImageView.topAnchor.constraint(equalTo: taskDescriptionLabel.bottomAnchor, constant: 15.scale),
            
            dateTaskLabel.centerYAnchor.constraint(equalTo: dateTaskImageView.centerYAnchor),
            dateTaskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 39.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension TaskPageClosedTaskView {
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "CloseTask.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makePersuadeLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
            .font(Fonts.Ubuntu.regular(size: 16))
            .lineHeight(20.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "TaskPage.CloseTask.Persuade.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeNameTaskLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeStatusTaskImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "CloseIndicator.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeStatusTaskLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 242, green: 155, blue: 25))
            .font(Fonts.Ubuntu.regular(size: 14))
            .lineHeight(28.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "TaskPage.CloseStatusTask.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTaskDescription() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeDateTaskImageView() -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: "TaskPage.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeDateTaskLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
