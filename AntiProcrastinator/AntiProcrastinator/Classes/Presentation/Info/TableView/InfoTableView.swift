//
//  InfoTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoTableView: UITableView {
    lazy var allElements = [AllElements]()
    var continueButtonTappedHandler: (() -> Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTableView {
    func setup(allElements: [AllElements]) {
        self.allElements = allElements
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension InfoTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        allElements.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch allElements[section] {
        case .sections(let sectionInfo):
            return sectionInfo.isExpanded ? 1 : 0
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch allElements[indexPath.section] {
        case .imageCell(let imageName):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageViewCell.self)) as? ImageViewCell else { return UITableViewCell()}
            cell.setup(imageName: imageName)
            return cell
        case .sections(let section):
            switch section.elements {
            case .fatigueLevels(let text), .points(let text), .punishment(let text):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoViewCell.self)) as? InfoViewCell else { return UITableViewCell()}
                cell.setup(text: text)
                return cell
            }
        case .buttonCell(let name):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ButtonViewCell.self)) as? ButtonViewCell else { return UITableViewCell()}
            cell.setup(name: name)
            cell.continueButtonTappedHandler = { [weak self] in
                self?.continueButtonTappedHandler?()
            }
            return cell
        }
    }
}

//MARK: UITableViewDelegate
extension InfoTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = InfoTableHeaderView()
        switch allElements[section] {
        case let .sections(sectionInfo):
            headerView.configure(withTitle: sectionInfo.title,
                                 isExpanded: sectionInfo.isExpanded,
                                 section: section,
                                 target: self,
                                 action: #selector(toggleSection(sender:)))
        default:
            break
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch allElements[section] {
        case .sections:
            let separatorView = UIView()
            let insets = tableView.separatorInset
            let width = tableView.bounds.width - insets.left - insets.right
            let separatorFrame = CGRect(x: insets.left, y: 0, width: width, height: 0.5)
            
            let separator = CALayer()
            separator.frame = separatorFrame
            separator.backgroundColor = tableView.separatorColor?.cgColor
            separatorView.layer.addSublayer(separator)
            return separatorView
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
}

// MARK: Private
private extension InfoTableView {
    func initialize() {
        register(ImageViewCell.self, forCellReuseIdentifier: String(describing: ImageViewCell.self))
        register(InfoViewCell.self, forCellReuseIdentifier: String(describing: InfoViewCell.self))
        register(ButtonViewCell.self, forCellReuseIdentifier: String(describing: ButtonViewCell.self))
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        dataSource = self
        delegate = self
    }
    
    @objc func toggleSection(sender: UIButton) {
        let section = sender.tag
        guard case var .sections(sectionInfo) = allElements[section] else { return }
        sectionInfo.isExpanded.toggle()
        allElements[section] = .sections(sectionInfo)
        self.reloadData()
    }
}
