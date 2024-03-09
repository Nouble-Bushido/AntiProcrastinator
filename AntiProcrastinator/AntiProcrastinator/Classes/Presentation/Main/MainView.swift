//
//  MainView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class MainView: UIView {
    lazy var infoButton = makeInfoButton()
    lazy var addTaskButton = makeAddTaskButton()
    lazy var tableView = makeTableView()
    lazy var greetingLabel = makeGreetingLabel()
    lazy var fatigueLabel = makeFatigueLevelLabel()
    lazy var fatigueLevelDescriptionLabel = makeFatigueLevelDescriptionLabel()
    lazy var fatiguePointsLabel = makeFatiguePointsLabel()
    
    lazy var textAttrsGreeting = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(28.scale)
        .font(Fonts.Ubuntu.medium(size: 24))
        .letterSpacing(-0.20.scale)

    lazy var textAttrsDescription = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(16.scale)
        .font(Fonts.Ubuntu.regular(size: 14))
        .letterSpacing(-0.20.scale)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension MainView {
    func setup(fatiguePoints: FatiguePoints, fatigueLevel: FatigueLevel, userName: String) {
        fatiguePointsLabel.text = String(fatiguePoints.value)
        
        let attributedDescription = fatigueLevel.description.attributed(with: textAttrsDescription)
        fatigueLevelDescriptionLabel.attributedText = attributedDescription
        
        let localizedText = "Main.Greeting.Text".localized
        let fullText = "\(localizedText) \(userName)"
        greetingLabel.attributedText = fullText.attributed(with: textAttrsGreeting)
    }
}

//MARK: Private
private extension MainView {
    func initialize() {
        backgroundColor = UIColor.white
    }
}

//MARK: Make constraints
private extension MainView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10.scale),
            infoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.scale),
            infoButton.widthAnchor.constraint(equalToConstant: 24.scale),
            infoButton.heightAnchor.constraint(equalToConstant: 24.scale),
  
            addTaskButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10.scale),
            addTaskButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.scale),
            addTaskButton.widthAnchor.constraint(equalToConstant: 24.scale),
            addTaskButton.heightAnchor.constraint(equalToConstant: 24.scale),
            
            greetingLabel.topAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: 10.scale),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            
            fatigueLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 10.scale),
            fatigueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            
            fatigueLevelDescriptionLabel.topAnchor.constraint(equalTo: fatigueLabel.bottomAnchor),
            fatigueLevelDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            fatigueLevelDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: fatiguePointsLabel.leadingAnchor, constant: -10.scale),
            fatigueLevelDescriptionLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 5.scale),
            
            fatiguePointsLabel.centerYAnchor.constraint(equalTo: fatigueLevelDescriptionLabel.centerYAnchor),
            fatiguePointsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: fatiguePointsLabel.bottomAnchor, constant: 10.scale),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        fatigueLevelDescriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        fatiguePointsLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

//MARK: lazy initialization
private extension MainView {
    func makeInfoButton() -> UIButton {
        let view = UIButton()
        view.setImage(UIImage(systemName: "info.circle"), for: .normal)
        view.tintColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeAddTaskButton() -> UIButton {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        view.tintColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeGreetingLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeFatigueLevelLabel() -> UILabel {
        let textAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 28, green: 55, blue: 209))
            .lineHeight(20.scale)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.20.scale)
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = "Main.FatigueLevel.Name.Text".localized.attributed(with: textAttrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeFatigueLevelDescriptionLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeFatiguePointsLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTableView() -> MainTableView {
        let view = MainTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
