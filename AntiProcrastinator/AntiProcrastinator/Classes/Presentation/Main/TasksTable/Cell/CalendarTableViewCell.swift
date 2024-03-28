//
//  CalendarTableViewCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.03.2024.
//

import UIKit

final class CalendarTableViewCell: UITableViewCell {
    lazy var collectionView = makeCollectionView()
    
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.light(size: 16))
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
extension CalendarTableViewCell {
    func setup() {

    }
}

//MARK: Private
private extension CalendarTableViewCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension CalendarTableViewCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension CalendarTableViewCell {
    func makeCollectionView() -> CalendarCollectionView {
        let view = CalendarCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
