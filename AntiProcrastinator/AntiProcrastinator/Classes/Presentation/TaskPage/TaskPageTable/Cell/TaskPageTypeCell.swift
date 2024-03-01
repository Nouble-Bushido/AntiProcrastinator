//
//  TaskPageImageTextCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.02.2024.
//

import UIKit

final class TaskPageTypeCell: UITableViewCell {
    lazy var mainImageView = makeImageView()
    lazy var persuadeLabel = makePersuadeLabel()
    
    private lazy var textAttrsPersuade = TextAttributes()
        .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
        .font(Fonts.Ubuntu.regular(size: 16))
        .lineHeight(20.scale)
        .textAlignment(.center)
        .letterSpacing(-0.41.scale)
    
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
extension TaskPageTypeCell {
    func setup(status: TaskStatus) {
        switch status {
        case .open(let image, let text):
            mainImageView.image = image
            let attributedText = text.attributed(with: textAttrsPersuade)
            persuadeLabel.attributedText = attributedText
        case .completed(let image, let text):
            mainImageView.image = image
            let attributedText = text.attributed(with: textAttrsPersuade)
            persuadeLabel.attributedText = attributedText
        }
    }
}

//MARK: Private
private extension TaskPageTypeCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension TaskPageTypeCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 237.scale),
            mainImageView.widthAnchor.constraint(equalToConstant: 237.scale),
            
            persuadeLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10.scale),
            persuadeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            persuadeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            persuadeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension TaskPageTypeCell {
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "OpenTask.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makePersuadeLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
            .font(Fonts.Ubuntu.regular(size: 16))
            .lineHeight(20.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "TaskPage.OpenTask.Persuade.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
