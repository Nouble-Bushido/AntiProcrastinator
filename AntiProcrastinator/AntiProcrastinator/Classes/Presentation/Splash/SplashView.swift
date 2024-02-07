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
            
            lifeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.scale),
            lifeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.scale),
            lifeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -140.scale),
            lifeLabel.heightAnchor.constraint(equalToConstant: 64.scale),
            
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
    
    func makeTextLife() -> PaddingLabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255, alpha: 1))
            .font(Fonts.Ubuntu.medium(size: 18))
            .lineHeight(20.scale)
            .textAlignment(.left)
            .letterSpacing(-0.41.scale)
    
        let view = PaddingLabel()
        view.attributedText = "Splash.Life.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.layer.cornerRadius = 20.scale
        view.clipsToBounds = true
        view.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 208)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTextAffairs() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255, alpha: 1))
            .font(Fonts.Ubuntu.medium(size: 18))
            .lineHeight(22.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "Splash.Affairs.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.layer.cornerRadius = 20.scale
        view.clipsToBounds = true
        view.backgroundColor =  UIColor(integralRed: 242, green: 156, blue: 25, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTextTimePasses() -> UILabel {
        let attr = TextAttributes()
            .textColor(UIColor(integralRed: 255, green: 255, blue: 255, alpha: 1))
            .font(Fonts.Ubuntu.medium(size: 18))
            .lineHeight(22.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "Splash.TimePasses.Text".localized.attributed(with: attr)
        view.numberOfLines = 0
        view.layer.cornerRadius = 20.scale
        view.clipsToBounds = true
        view.backgroundColor = UIColor(integralRed: 105, green: 126, blue: 248, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
