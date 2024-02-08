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
private extension MainView {
    func initialize() {
        backgroundColor = UIColor.white
    }
}

//MARK: Make constraints
private extension MainView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: topAnchor, constant: 60.scale),
            infoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.scale),
            infoButton.widthAnchor.constraint(equalToConstant: 50),
            infoButton.heightAnchor.constraint(equalToConstant: 50),
            
  
            addTaskButton.topAnchor.constraint(equalTo: topAnchor, constant: 60.scale),
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.scale),
        ])
    }
}

//MARK: lazy initialization
private extension MainView {
    func makeInfoButton() -> UIButton {
        let view = UIButton()
        view.setImage(UIImage(systemName: "info.circle"), for: .normal)
        view.tintColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeAddTaskButton() -> UIButton {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        view.tintColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
