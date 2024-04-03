//
//  MainСalendarCollectionView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.03.2024.
//

import UIKit

final class MainСalendarCollectionView: UICollectionView {
    var didSelectDate: ((Date) -> Void)?
    
    private let collectionLayout = UICollectionViewFlowLayout()
    private let calendar = Calendar.current
    private var selectedDate: Date?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: UICollectionViewDataSource
extension MainСalendarCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let range = calendar.range(of: .day, in: .year, for: Date()) else { return 0 }
        return range.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MainCalendarCollectionViewCell.self), for: indexPath) as? MainCalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let date = calendar.date(byAdding: .day, value: indexPath.item, to: Date())!
        cell.setup(date: date, isSelected: isSelectedDate(date))
        return cell
    }
}

//MARK: UICollectionViewDelegate
extension MainСalendarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let date = calendar.date(byAdding: .day,
                                       value: indexPath.item,
                                       to: Date()) else { return }
        selectedDate = date
        didSelectDate?(date)
        reloadData()
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension MainСalendarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7.5
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
}

//MARK: Private
private extension MainСalendarCollectionView {
    func initialize() {
        register(MainCalendarCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MainCalendarCollectionViewCell.self))
        collectionLayout.minimumLineSpacing = 3
        collectionLayout.scrollDirection = .horizontal
        delegate = self
        dataSource = self
    }
    
    func isSelectedDate(_ date: Date) -> Bool {
        guard let selectedDate = selectedDate else { return calendar.isDateInToday(date) }
        return calendar.isDate(selectedDate, inSameDayAs: date)
    }
}
