//
//  AddTaskCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskCell: UITableViewCell {
    lazy var nameLabel = makeLabel()
    lazy var addTaskTextField = makeTextField()
    
    private lazy var textAttrs = TextAttributes()
        .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
        .lineHeight(20.scale)
        .font(Fonts.Ubuntu.light(size: 16))
        .letterSpacing(-0.20.scale)
    
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
extension AddTaskCell {
    func setup(task: String) {
        nameLabel.text = task
    }
}

//MARK: Private
private extension AddTaskCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension AddTaskCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.scale),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.scale),
            
            addTaskTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            addTaskTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.scale),
            addTaskTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.scale),
            addTaskTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            addTaskTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension AddTaskCell {
    func makeLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeTextField() -> UITextField {
        let placeHolderAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
            .lineHeight(24.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .letterSpacing(-0.41.scale)
        
        let defaultTextAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
            .font(Fonts.Ubuntu.light(size: 14.scale))
            .lineHeight(24.scale)
            .letterSpacing(-0.38.scale)
        
        let view = UITextField()
        view.attributedPlaceholder = "AddTask.TaskNameFormat.Text".localized.attributed(with: placeHolderAttrs)
        view.defaultTextAttributes = defaultTextAttrs.dictionary
        view.borderStyle = .none
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.size.height))
        view.leftViewMode = .always
        view.layer.cornerRadius = 12.scale
        view.backgroundColor = UIColor(integralRed: 243, green: 244, blue: 247)
        view.keyboardType = .alphabet
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
