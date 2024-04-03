//
//  MainNoTaskIndicationView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 02.04.2024.
//

import UIKit

final class MainNoTaskIndicationView: UIView {
    lazy var congratulationImageView = makeCongratulationImageView()
    lazy var firstView = makeFirstView()
    lazy var secondView = makeSecondView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Private
private extension MainNoTaskIndicationView {
    func initialize() {
        backgroundColor = UIColor.clear
    }
}

//MARK: Make constraints
private extension MainNoTaskIndicationView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            congratulationImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5.scale),
            congratulationImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            congratulationImageView.widthAnchor.constraint(equalToConstant: 245.scale),
            congratulationImageView.heightAnchor.constraint(equalToConstant: 245.scale),
            
            firstView.topAnchor.constraint(equalTo: congratulationImageView.bottomAnchor, constant: 10.scale),
            firstView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 5.scale),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension MainNoTaskIndicationView {
    func makeCongratulationImageView() -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: "Main.NoTask.Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeFirstView() -> MainFirstNoTaskFeedbackView {
        let view = MainFirstNoTaskFeedbackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeSecondView() -> MainSecondNoTaskFeedbackView {
        let view = MainSecondNoTaskFeedbackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
