//
//  ImageCell.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 01.02.2024.
//

import UIKit

final class ImageCell: UITableViewCell {
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
extension ImageCell {
    func setup(imageName: String) {
     picture.image = UIImage(named: imageName)
    }
}

//MARK: Private
private extension ImageCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make constraints
private extension ImageCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            picture.heightAnchor.constraint(equalToConstant: 375.scale),
            picture.widthAnchor.constraint(greaterThanOrEqualToConstant: 375.scale),
            picture.topAnchor.constraint(equalTo: contentView.topAnchor),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension ImageCell {
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
