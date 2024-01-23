//
//  SplashView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class SplashView: GradientView {
    lazy var imageView = makeImageView()
    lazy var lifeLabel = makeTextLife()
    lazy var affairsLabel = makeTextAffairs()
    lazy var timePassesLabel = makeTextTimePasses()
    
    
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
private extension SplashView {
    func initialize() {
        backgroundColor = .white
    }
}

//MARK: Make constraints
private extension SplashView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 375.scale),
            imageView.heightAnchor.constraint(equalToConstant: 375.scale),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 109.scale),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lifeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21.scale),
            lifeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.scale),
            lifeLabel.widthAnchor.constraint(equalToConstant: 219.scale),
            
            affairsLabel.topAnchor.constraint(equalTo: lifeLabel.bottomAnchor, constant: 20.scale),
            affairsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 189.scale),
            affairsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30.scale),
            affairsLabel.heightAnchor.constraint(equalToConstant: 46.scale),
            
            timePassesLabel.topAnchor.constraint(equalTo: affairsLabel.bottomAnchor, constant: 20.scale),
            timePassesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75.scale),
            timePassesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80.scale),
            timePassesLabel.heightAnchor.constraint(equalToConstant: 46.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension SplashView {
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "Splash.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTextLife() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
            .font(Fonts.Ubuntu.medium(size: 18))
            .lineHeight(24.scale)
            .textAlignment(.left)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "Splash.Life.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.layer.cornerRadius = 20.scale
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 0.11, green: 0.216, blue: 0.82, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTextAffairs() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
            .font(Fonts.Ubuntu.medium(size: 18))
            .lineHeight(20.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "Splash.Affairs.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.layer.cornerRadius = 20.scale
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 0.95, green: 0.61, blue: 0.099, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTextTimePasses() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
            .font(Fonts.Ubuntu.medium(size: 18))
            .lineHeight(22.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "Splash.TimePasses.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.layer.cornerRadius = 20.scale
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 0.413, green: 0.496, blue: 0.971, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
