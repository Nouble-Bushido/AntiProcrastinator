//
//  AddTaskView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskView: UIView {
    lazy var tableView = makeTableview()
    lazy var readyButton = makeButton()
    
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
}

//MARK: Make constraints
private extension AddTaskView{
    func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: readyButton.topAnchor, constant: -15.scale),
            
            readyButton.heightAnchor.constraint(equalToConstant: 50.scale),
            readyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.scale),
            readyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.scale),
            readyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension AddTaskView{
    func makeTableview() -> AddTaskTableView {
        let view = AddTaskTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
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
//        view.isEnabled = false
        addSubview(view)
        return view
    }
}
