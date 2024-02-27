//
//  TaskPageAlertRemoveTaskView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 26.02.2024.
//

import UIKit

final class TaskPageAlertRemoveTaskView: UIView {
    lazy var whiteBackgroundView = makeWhiteBackgroundView()
    lazy var titleLabel = makeTitleLabel()
    lazy var textLabel = makeTextLabel()
    lazy var closeButton = makeCloseButton()
    lazy var whiteBackgroundViewConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public
extension TaskPageAlertRemoveTaskView {
    func initialize() {
        backgroundColor = UIColor.black.withAlphaComponent(0)
    }
}

// MARK: Make constraints
private extension TaskPageAlertRemoveTaskView {
    func makeConstraints() {
        whiteBackgroundViewConstraint = whiteBackgroundView.topAnchor.constraint(equalTo: bottomAnchor)
        whiteBackgroundViewConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            whiteBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            whiteBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
        
            titleLabel.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor, constant: 20.scale),
            titleLabel.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 15.scale),
            textLabel.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15.scale),
            
            closeButton.heightAnchor.constraint(equalToConstant: 48.scale),
            closeButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10.scale),
            closeButton.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 15.scale),
            closeButton.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15.scale),
            closeButton.bottomAnchor.constraint(equalTo: whiteBackgroundView.bottomAnchor, constant: -15.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension TaskPageAlertRemoveTaskView {
    func makeWhiteBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 255, green: 255, blue: 255, alpha: 1)
        view.layer.cornerRadius = 20.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let attr = TextAttributes()
            .lineHeight(40.scale)
            .textAlignment(.center)
            .font(Fonts.Ubuntu.regular(size: 52))
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "TaskPage.AlertRemoveTaskTitle.Text".localized.attributed(with: attr)
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
    
    func makeTextLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29, alpha: 1))
            .lineHeight(20.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "TaskPage.AlertRemoveDescription.Text".localized.attributed(with: attr)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        whiteBackgroundView.addSubview(view)
        return view
    }
    
    func makeCloseButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .textAlignment(.center)
            .font(Fonts.Ubuntu.medium(size: 17))
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("TaskPage.AlertRemoveTaskButton.Text".localized.attributed(with: attr), for: .normal)
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209, alpha: 1)
        view.layer.cornerRadius = 12.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.addSubview(view)
        return view
    }
}
