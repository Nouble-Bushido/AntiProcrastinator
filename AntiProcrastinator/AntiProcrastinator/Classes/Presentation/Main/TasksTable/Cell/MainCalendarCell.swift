//
//  MainCalendarCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.03.2024.
//

import UIKit

final class MainCalendarCell: UITableViewCell {
    lazy var collectionView = makeCollectionView()
    lazy var selectedDateLabel = makeSelectedDateLabel()
    lazy var mainNoTaskView = makeNoTaskView()
    var didSelectedDate: ((Date) -> Void)?
    
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor(integralRed: 28, green: 28, blue: 28))
        .lineHeight(22.scale)
        .font(Fonts.Ubuntu.medium(size: 18))
        .letterSpacing(-0.20.scale)
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialize()
        makeConstraints()
        
        collectionView.didSelectDate = { [weak self] selectedDate in
            self?.didSelectedDate?(selectedDate)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension MainCalendarCell {
    func setup(task: Task) {
        guard task.id != -1 else { addNoTaskView()
            return }
        
        mainNoTaskView.removeFromSuperview()
        dateFormatter.dateFormat = "d MMMM"
        selectedDateLabel.attributedText = dateFormatter.string(from: task.date).attributed(with: textAttrs)
    }
}

//MARK: Private
private extension MainCalendarCell {
    func initialize() {
        selectionStyle = .none
    }
    
    func addNoTaskView() {
        addSubview(mainNoTaskView)
        NSLayoutConstraint.activate([
            mainNoTaskView.topAnchor.constraint(equalTo: selectedDateLabel.bottomAnchor, constant: -10),
            mainNoTaskView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainNoTaskView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainNoTaskView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

//MARK: Make constraints
private extension MainCalendarCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 56.scale),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30.scale),
            
            selectedDateLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15.scale),
            selectedDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.scale),
            selectedDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            selectedDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension MainCalendarCell {
    func makeCollectionView() -> MainСalendarCollectionView {
        let view = MainСalendarCollectionView()
        view.bounces = false
        view.backgroundColor = .none
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeSelectedDateLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeNoTaskView() -> MainNoTaskIndicationView {
        let view = MainNoTaskIndicationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
