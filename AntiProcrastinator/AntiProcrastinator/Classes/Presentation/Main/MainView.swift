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
    lazy var motivationView = makeMotivationView()
    lazy var greetingLabel = makeGreetingLabel()
    lazy var fatigueLabel = makeFatigueLevelLabel()
    lazy var fatigueLevelDescriptionLabel = makeFatigueLevelDescriptionLabel()
    lazy var fatiguePointsLabel = makeFatiguePointsLabel()
    lazy var tableView = makeTableView()
    
    lazy var textAttrsPoints = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.regular(size: 16))
        .letterSpacing(-0.20.scale)
    
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
        let localizedTextPoints = "Main.Balls.Text".localized
        let fullTextPoints = "\(String(fatiguePoints.value)) \(localizedTextPoints)"
        fatiguePointsLabel.attributedText = fullTextPoints.attributed(with: textAttrsPoints)
        
        let attributedDescription = fatigueLevel.description.attributed(with: textAttrsDescription)
        fatigueLevelDescriptionLabel.attributedText = attributedDescription
        
        let localizedTextGreeting = "Main.Greeting.Text".localized
        let fullTextGreeting = "\(localizedTextGreeting) \(userName)"
        greetingLabel.attributedText = fullTextGreeting.attributed(with: textAttrsGreeting)
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
            
            fatiguePointsLabel.topAnchor.constraint(equalTo: addTaskButton.bottomAnchor, constant: 10.scale),
            fatiguePointsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            
            motivationView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 10.scale),
            motivationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            motivationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70.scale),
            
            fatigueLabel.topAnchor.constraint(equalTo: motivationView.bottomAnchor, constant: 10.scale),
            fatigueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            
            fatigueLevelDescriptionLabel.topAnchor.constraint(equalTo: fatigueLabel.bottomAnchor),
            fatigueLevelDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            fatigueLevelDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -40.scale),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: fatigueLevelDescriptionLabel.bottomAnchor, constant: 10.scale),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
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
    
    func makeMotivationView() -> MainMotivationView {
        let view = MainMotivationView()
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
