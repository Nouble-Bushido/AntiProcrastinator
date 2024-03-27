//
//  MainPointsVesselView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 27.03.2024.
//

import UIKit

final class MainPointsVesselView: UIView {
    lazy var vesselView = makeVesselView()
    lazy var contentFillView = makeContentFillView()
    lazy var contentFillHeightConstraint = NSLayoutConstraint()
    
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
extension MainPointsVesselView {
    func setup(points: Fatigue) {
        updateContentFillHeight(with: CGFloat(points.value))
    }
}

//MARK: Private
private extension MainPointsVesselView {
    func initialize() {
        backgroundColor = UIColor.clear
    }
    
    func updateContentFillHeight(with points: CGFloat) {
        let maxHeight: CGFloat = 100
        let fillHeight = min(maxHeight, points)
        
        contentFillHeightConstraint = contentFillView.heightAnchor.constraint(equalToConstant: fillHeight)
        contentFillHeightConstraint.isActive = true
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
}

//MARK: Make constraints
private extension MainPointsVesselView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            vesselView.topAnchor.constraint(equalTo: topAnchor),
            vesselView.leadingAnchor.constraint(equalTo: leadingAnchor),
            vesselView.trailingAnchor.constraint(equalTo: trailingAnchor),
            vesselView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentFillView.bottomAnchor.constraint(equalTo: vesselView.bottomAnchor),
            contentFillView.leadingAnchor.constraint(equalTo: vesselView.leadingAnchor),
            contentFillView.trailingAnchor.constraint(equalTo: vesselView.trailingAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension MainPointsVesselView {
    func makeVesselView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 254, green: 245, blue: 232)
        view.layer.cornerRadius = 12.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeContentFillView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 242, green: 155, blue: 25)
        view.layer.cornerRadius = 12.scale
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
    
