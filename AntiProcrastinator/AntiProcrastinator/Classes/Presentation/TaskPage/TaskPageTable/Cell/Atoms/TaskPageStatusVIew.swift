//
//  TaskPageStatusVIew.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 05.03.2024.
//

import UIKit

final class TaskPageStatusVIew: UIView {
    lazy var statusIconView = makeStatusIconView()
    lazy var statusLabel = makeStatusLabel()
    
    private lazy var textAttrsStatus = TextAttributes()
        .font(Fonts.Ubuntu.regular(size: 14))
        .lineHeight(28.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)
    
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
extension TaskPageStatusVIew {
    func setup(status: TaskStatus) {
        let statusLabelTextColor = status.color
        let currentTextAttrStatus = textAttrsStatus.textColor(statusLabelTextColor)

        let attributedStatus = status.text.attributed(with: currentTextAttrStatus)
        statusLabel.attributedText = attributedStatus
        
        statusIconView.backgroundColor = status.color
    }
}

//MARK: Private
private extension TaskPageStatusVIew {
    func initialize() {
        backgroundColor = UIColor.clear
    }
}

//MARK: Make constraints
private extension TaskPageStatusVIew {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            statusIconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            statusIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            statusIconView.widthAnchor.constraint(equalToConstant: 8.scale),
            statusIconView.heightAnchor.constraint(equalToConstant: 8.scale),
            
            statusLabel.leadingAnchor.constraint(equalTo: statusIconView.trailingAnchor, constant: 5.scale),
            statusLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

//MARK: Lazy initialization
private extension TaskPageStatusVIew {
    func makeStatusIconView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeStatusLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
