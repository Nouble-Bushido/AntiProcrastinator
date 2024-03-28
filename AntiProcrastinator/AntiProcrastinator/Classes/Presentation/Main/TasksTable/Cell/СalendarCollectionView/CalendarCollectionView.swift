//
//  CalendarCollectionView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.03.2024.
//

import UIKit

final class CalendarCollectionView: UICollectionView {
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension CalendarCollectionView {
    func setup() {
        
    }
}

//MARK: Private
private extension CalendarCollectionView {
    func initialize() {
        backgroundColor = UIColor.clear
        bounces = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        register(CalendarCollectionViewCell.self,
                 forCellWithReuseIdentifier: String(describing: CalendarCollectionViewCell.self))
        delegate = self
        dataSource = self
    }
}

//MARK: UICollectionViewDataSource
extension CalendarCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CalendarCollectionViewCell.self), for: indexPath) as? CalendarCollectionViewCell else {
            return UICollectionViewCell() }
        return cell
    }
}

//MARK: UICollectionViewDelegate
extension CalendarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapCell")
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension CalendarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7.0
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
