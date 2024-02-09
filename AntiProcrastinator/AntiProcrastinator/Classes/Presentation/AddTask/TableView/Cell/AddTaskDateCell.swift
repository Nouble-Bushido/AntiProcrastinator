//
//  AddTaskDateCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskDateCell: UITableViewCell {
    lazy var nameLabel = makeLabel()
    lazy var dateTextField = makeTaskDateTextField()
    lazy var picture = makeImageView()
    
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
extension AddTaskDateCell {
    func setup(task: String) {
        nameLabel.text = task
    }
}

//MARK: Private
private extension AddTaskDateCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension AddTaskDateCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.scale),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.scale),
            
            dateTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            dateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.scale),
            dateTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.scale),
            dateTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            dateTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15.scale),
            
            picture.widthAnchor.constraint(equalToConstant: 20.scale),
            picture.heightAnchor.constraint(equalToConstant: 20.scale),
            picture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35.scale),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension AddTaskDateCell {
    func makeLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeTaskDateTextField() -> UITextField {
        let placeHolderAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
            .lineHeight(24.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .letterSpacing(-0.41.scale)
        
        let defaultTextAttr = TextAttributes()
            .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
            .font(Fonts.Ubuntu.light(size: 14.scale))
            .lineHeight(24.scale)
            .letterSpacing(-0.38.scale)
        
        let view = UITextField()
        view.attributedPlaceholder = "AddTask.TaskDateFormat.Text".localized.attributed(with: placeHolderAttrs)
        view.defaultTextAttributes = defaultTextAttr.dictionary
        view.borderStyle = .none
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.size.height))
        view.leftViewMode = .always
        view.layer.cornerRadius = 12.scale
        view.backgroundColor = UIColor(integralRed: 243, green: 244, blue: 247)
        view.keyboardType = .alphabet
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "AddTask.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        bringSubviewToFront(dateTextField)
        contentView.addSubview(view)
        return view
    }
}
