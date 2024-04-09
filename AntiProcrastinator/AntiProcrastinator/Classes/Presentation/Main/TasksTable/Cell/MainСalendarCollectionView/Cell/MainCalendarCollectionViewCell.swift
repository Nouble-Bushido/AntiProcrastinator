//
//  CalendarCollectionViewCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.03.2024.
//

import UIKit

final class MainCalendarCollectionViewCell: UICollectionViewCell {
    lazy var dayOfWeekLabel = makeDayOfWeekLabel()
    lazy var numberOfDayLabel = makeNumberOfDayLabel()
    
    private lazy var attr = TextAttributes()
        .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.regular(size: 18))
        .letterSpacing(-0.20.scale)
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
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
extension MainCalendarCollectionViewCell {
    func setup(date: Date, isSelected: Bool) {
        dateFormatter.dateFormat = "EEE"
        let dayOfWeek = dateFormatter.string(from: date).uppercased()
        
        dateFormatter.dateFormat = "d"
        let dayOfMonth = dateFormatter.string(from: date)
        
        let selectedColor = UIColor(integralRed: 242, green: 155, blue: 25)
        let textColor = isSelected ? UIColor(integralRed: 255, green: 255, blue: 255) : attr.textColor
        
        dayOfWeekLabel.attributedText = dayOfWeek.attributed(with: attr)
        numberOfDayLabel.attributedText = dayOfMonth.attributed(with: attr)
        backgroundColor = isSelected ? selectedColor : UIColor.clear
        dayOfWeekLabel.textColor = textColor
        numberOfDayLabel.textColor = textColor
    }
}

//MARK: Private
private extension MainCalendarCollectionViewCell {
    func initialize() {
        backgroundColor = UIColor.clear
        layer.cornerRadius = 10
    }
}

//MARK: Make constraints
private extension MainCalendarCollectionViewCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dayOfWeekLabel.bottomAnchor.constraint(equalTo: numberOfDayLabel.topAnchor, constant: 5.scale),
            
            numberOfDayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            numberOfDayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension MainCalendarCollectionViewCell {
    func makeDayOfWeekLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeNumberOfDayLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
