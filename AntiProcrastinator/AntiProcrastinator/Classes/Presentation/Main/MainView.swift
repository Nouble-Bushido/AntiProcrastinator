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
            infoButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10.scale),
            infoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.scale),
            infoButton.widthAnchor.constraint(equalToConstant: 24.scale),
            infoButton.heightAnchor.constraint(equalToConstant: 24.scale),
  
            addTaskButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10.scale),
            addTaskButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.scale),
            addTaskButton.widthAnchor.constraint(equalToConstant: 24.scale),
            addTaskButton.heightAnchor.constraint(equalToConstant: 24.scale),
        ])
    }
}

//MARK: lazy initialization
private extension MainView {
    func makeInfoButton() -> UIButton {
        let view = UIButton()
        view.setImage(UIImage(systemName: "info.circle"), for: .normal)
        view.tintColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeAddTaskButton() -> UIButton {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        view.tintColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
