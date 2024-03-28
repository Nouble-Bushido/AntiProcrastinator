//
//  CalendarCollectionViewCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.03.2024.
//

import UIKit

final class CalendarCollectionViewCell: UICollectionViewCell {
    lazy var dayOfWeekLabel = makeDayOfWeekLabel()
    lazy var numberOfDayLabel = makeNumberOfDayLabel()
    
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
extension CalendarCollectionViewCell {
    func setup() {
        
    }
}

//MARK: Private
private extension CalendarCollectionViewCell {
    func initialize() {
        backgroundColor = UIColor.clear
        layer.cornerRadius = 10
    }
}

//MARK: Make constraints
private extension CalendarCollectionViewCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.scale),
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            numberOfDayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.scale),
            numberOfDayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension CalendarCollectionViewCell {
    func makeDayOfWeekLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
            .lineHeight(20.scale)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.20.scale)
        
        let view = UILabel()
        view.attributedText = "Thur".attributed(with: attr)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeNumberOfDayLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
            .lineHeight(20.scale)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.20.scale)
        
        let view = UILabel()
        view.attributedText = "17".attributed(with: attr)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
