//
//  InfoView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoView: UIView {
    lazy var imageView = makeImageView()
    lazy var tableView = makeTableView()
    lazy var continueButton = makeContinueButton()
    
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
private extension InfoView {
    func initialize() {
        backgroundColor = .white
    }
}

//MARK: Constraints
private extension InfoView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 375.scale),
            imageView.widthAnchor.constraint(equalToConstant: 375.scale),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 47.scale),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20.scale),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.scale),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.scale),
            tableView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -5.scale),

            continueButton.heightAnchor.constraint(equalToConstant: 50.scale),
            continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.scale),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.scale),
            continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40.scale)
        ])
     
    }
}

//MARK: Lazy initialization
private extension InfoView {
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "Info.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTableView() -> InfoTableView {
        let view = InfoTableView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeContinueButton() -> UIButton {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255))
            .textAlignment(.center)
            .font(Fonts.Ubuntu.regular(size: 16))
            .letterSpacing(-0.41.scale)
        
        let view = UIButton()
        view.setAttributedTitle("Info.Start.Text".localized.attributed(with: attr), for: .normal)
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209)
        view.layer.cornerRadius = 12.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
