//
//  TaskPageButtonsCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 29.02.2024.
//

import UIKit

final class TaskPageButtonsCell: UITableViewCell {
    lazy var closeTaskButton = makeCloseTaskButton()
    lazy var removeTaskButton = makeRemoveTaskButton()
    var completeButtonTappedHandler: (() -> Void)?
    var removeButtonTappedHandler: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Private
private extension TaskPageButtonsCell {
    func initialize() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    @objc func pressedCloseButton() {
        completeButtonTappedHandler?()
    }
    
    @objc func pressedRemoveButton() {
        removeButtonTappedHandler?()
    }
}

//MARK: Make constraints
private extension TaskPageButtonsCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            closeTaskButton.heightAnchor.constraint(equalToConstant: 46.scale),
            closeTaskButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.scale),
            closeTaskButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            closeTaskButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            removeTaskButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 46.scale),
            removeTaskButton.topAnchor.constraint(equalTo: closeTaskButton.bottomAnchor, constant: 10.scale),
            removeTaskButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            removeTaskButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            removeTaskButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension TaskPageButtonsCell {
    func makeCloseTaskButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(28.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("TaskPage.CloseTaskButton.Text".localized.attributed(with: attr), for: .normal)
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.layer.cornerRadius = 12.scale
        view.addTarget(self, action: #selector(pressedCloseButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeRemoveTaskButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 28, green: 55, blue: 209))
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(28.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("TaskPage.RemoveTaskButton.Text".localized.attributed(with: attr), for: .normal)
        view.backgroundColor = UIColor(integralRed: 255, green: 255, blue: 255)
        view.layer.cornerRadius = 12.scale
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(integralRed: 28, green: 55, blue: 209).cgColor
        view.addTarget(self, action: #selector(pressedRemoveButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
