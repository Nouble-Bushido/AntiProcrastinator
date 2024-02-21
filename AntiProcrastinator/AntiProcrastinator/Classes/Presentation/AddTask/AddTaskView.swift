//
//  AddTaskView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskView: UIView {
    lazy var scrollView = makeScrollView()
    lazy var contentView = makeContentView()
    lazy var nameLabel = makeNameLabel()
    lazy var nameTextField = makeNameTextField()
    lazy var descriptionLabel = makeDescriptionLabel()
    lazy var descriptionTextField = makeDescriptionTextField()
    lazy var dateLabel = makeDateLabel()
    lazy var dateTextField = makeTaskDateTextField()
    lazy var picture = makeImageView()
    lazy var toolBar = makeToolBar()
    lazy var datePicker = makeDatePicker()
    lazy var readyButton = makeButton()
    
    private let formater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        return formater
    }()
    
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
private extension AddTaskView{
    func initialize() {
        backgroundColor = UIColor.white
    }
    
    @objc func pressDoneButton() {
        dateTextField.text = formater.string(from: datePicker.date)
        dateTextField.resignFirstResponder()
    }
}

//MARK: Make constraints
private extension AddTaskView{
    func makeConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.scale),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10.scale),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.scale),
            nameTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15.scale),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            descriptionLabel.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant: -10.scale),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10.scale),
            descriptionTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            descriptionTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.scale),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 15.scale),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10.scale),
            dateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            dateTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.scale),
            dateTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            
            picture.widthAnchor.constraint(equalToConstant: 20.scale),
            picture.heightAnchor.constraint(equalToConstant: 20.scale),
            picture.centerYAnchor.constraint(equalTo: dateTextField.centerYAnchor),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30.scale),
            
            readyButton.heightAnchor.constraint(equalToConstant: 50.scale),
            readyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            readyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            readyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

//MARK: Lazy initialization
private extension AddTaskView {
    func makeScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeContentView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(view)
        return view
    }
    
    func makeNameLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
            .lineHeight(20.scale)
            .font(Fonts.Ubuntu.medium(size: 17))
            .letterSpacing(-0.20.scale)
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = "AddTask.TaskName.Text".localized.attributed(with: attr)
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeNameTextField() -> PaddingTextField {
        let placeHolderAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
            .lineHeight(18.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .letterSpacing(-0.41.scale)
        
        let defaultTextAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .lineHeight(24.scale)
            .letterSpacing(-0.38.scale)
        
        let view = PaddingTextField()
        view.attributedPlaceholder = "AddTask.TaskNameFormat.Text".localized.attributed(with: placeHolderAttrs)
        view.defaultTextAttributes = defaultTextAttrs.dictionary
        view.borderStyle = .none
        view.layer.cornerRadius = 12.scale
        view.backgroundColor = UIColor(integralRed: 243, green: 244, blue: 247)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeDescriptionLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
            .lineHeight(20.scale)
            .font(Fonts.Ubuntu.medium(size: 17))
            .letterSpacing(-0.20.scale)
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = "AddTask.TaskDescription.Text".localized.attributed(with: attr)
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeDescriptionTextField() -> PaddingTextField {
        let placeHolderAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
            .lineHeight(18.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .letterSpacing(-0.41.scale)
        
        let defaultTextAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .lineHeight(24.scale)
            .letterSpacing(-0.38.scale)
        
        let view = PaddingTextField()
        view.attributedPlaceholder = "AddTask.TaskDescriptionFormat.Text".localized.attributed(with: placeHolderAttrs)
        view.defaultTextAttributes = defaultTextAttrs.dictionary
        view.borderStyle = .none
        view.layer.cornerRadius = 12.scale
        view.backgroundColor = UIColor(integralRed: 243, green: 244, blue: 247)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeDateLabel() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 29, green: 29, blue: 29))
            .lineHeight(20.scale)
            .font(Fonts.Ubuntu.medium(size: 17))
            .letterSpacing(-0.20.scale)
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = "AddTask.TaskDate.Text".localized.attributed(with: attr)
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeTaskDateTextField() -> PaddingTextField {
        let placeHolderAttrs = TextAttributes()
            .textColor(UIColor(integralRed: 170, green: 170, blue: 170))
            .lineHeight(18.scale)
            .textAlignment(.left)
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .letterSpacing(-0.41.scale)
        
        let defaultTextAttr = TextAttributes()
            .textColor(UIColor(integralRed: 31, green: 31, blue: 31))
            .font(Fonts.Ubuntu.regular(size: 16.scale))
            .lineHeight(24.scale)
            .letterSpacing(-0.38.scale)
        
        let view = PaddingTextField()
        view.attributedPlaceholder = "AddTask.TaskDateFormat.Text".localized.attributed(with: placeHolderAttrs)
        view.defaultTextAttributes = defaultTextAttr.dictionary
        view.borderStyle = .none
        view.layer.cornerRadius = 12.scale
        view.backgroundColor = UIColor(integralRed: 243, green: 244, blue: 247)
        view.inputAccessoryView = toolBar
        view.inputView = datePicker
        view.tintColor = UIColor.clear
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
    
    func makeToolBar() -> UIToolbar {
        let view = UIToolbar()
        view.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(pressDoneButton))
        view.setItems([doneButton], animated: true)
        return view
    }
    
    func makeDatePicker() -> UIDatePicker {
        let view = UIDatePicker()
        view.preferredDatePickerStyle = .wheels
        view.datePickerMode = .date
        return view
    }
    
    func makeButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .textAlignment(.center)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("AddTask.Ready.Text".localized.attributed(with: attr), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209, alpha: 0.6)
        view.layer.cornerRadius = 12.scale
        view.isEnabled = false
        contentView.addSubview(view)
        return view
    }
}
