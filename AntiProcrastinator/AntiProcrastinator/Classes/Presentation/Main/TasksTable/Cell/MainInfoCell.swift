//
//  MainInfoCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.03.2024.
//

import UIKit

final class MainInfoCell: UITableViewCell {
    lazy var greetingLabel = makeGreetingLabel()
    lazy var fatiguePointsLabel = makeFatiguePointsLabel()
    lazy var vesselView = makeVesselView()
    lazy var motivationView = makeMotivationView()
    lazy var fatigueLabel = makeFatigueLevelLabel()
    lazy var fatigueLevelDescriptionLabel = makeFatigueLevelDescriptionLabel()
    var didSelectedDate: ((Date) -> Void)?
    
    private lazy var textAttrsPoints = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.regular(size: 16))
        .letterSpacing(-0.20.scale)
    
    private lazy var textAttrsGreeting = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(28.scale)
        .font(Fonts.Ubuntu.medium(size: 24))
        .letterSpacing(-0.20.scale)
    
    private lazy var textAttrsDescription = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(16.scale)
        .font(Fonts.Ubuntu.regular(size: 14))
        .letterSpacing(-0.20.scale)
    
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(22.scale)
        .font(Fonts.Ubuntu.medium(size: 18))
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
extension MainInfoCell {
    func setup(fatiguePoints: Fatigue, description: String, userName: String) {
        let localizedTextPoints = "Main.Balls.Text".localized
        let localizedTextGreeting = "Main.Greeting.Text".localized
        
        fatiguePointsLabel.attributedText = "\(fatiguePoints.value) \(localizedTextPoints)".attributed(with: textAttrsPoints)
        fatigueLevelDescriptionLabel.attributedText = description.attributed(with: textAttrsDescription)
        greetingLabel.attributedText = "\(localizedTextGreeting) \(userName)".attributed(with: textAttrsGreeting)
        vesselView.setup(points: fatiguePoints)
    }
}

//MARK: Private
private extension MainInfoCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension MainInfoCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30.scale),
            greetingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            greetingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60.scale),
            
            fatiguePointsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25.scale),
            fatiguePointsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.scale),
            
            motivationView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 25.scale),
            motivationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            motivationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70.scale),
            motivationView.bottomAnchor.constraint(equalTo: fatigueLabel.topAnchor, constant: -10.scale),
            
            vesselView.topAnchor.constraint(equalTo: fatiguePointsLabel.bottomAnchor, constant: 5.scale),
            vesselView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            vesselView.leadingAnchor.constraint(lessThanOrEqualTo: motivationView.trailingAnchor, constant: -30.scale),
            vesselView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            fatigueLabel.topAnchor.constraint(equalTo: motivationView.bottomAnchor, constant: 10.scale),
            fatigueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            fatigueLabel.trailingAnchor.constraint(equalTo: vesselView.leadingAnchor, constant: -30.scale),
            
            fatigueLevelDescriptionLabel.topAnchor.constraint(equalTo: fatigueLabel.bottomAnchor, constant: 5.scale),
            fatigueLevelDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            fatigueLevelDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: vesselView.leadingAnchor, constant: -30.scale),
            fatigueLevelDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension MainInfoCell {
    func makeGreetingLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeFatiguePointsLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeVesselView() -> MainPointsVesselView {
        let view = MainPointsVesselView()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeMotivationView() -> MainMotivationView {
        let view = MainMotivationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
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
        contentView.addSubview(view)
        return view
    }
    
    func makeFatigueLevelDescriptionLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
