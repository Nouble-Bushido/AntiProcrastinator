//
//  InfoTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoTableView: UITableView {
    lazy var infoElements = [InfoElements]()
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
    func setup(allElements: [InfoElements]) {
        self.infoElements = allElements
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension InfoTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        infoElements.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch infoElements[section] {
        case .sections(let sectionInfo):
            return sectionInfo.isExpanded ? 1 : 0
        default:
            
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch infoElements[indexPath.section] {
        case .imageCell(let imageName):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoImageCell.self)) as? InfoImageCell else { return UITableViewCell()}
            cell.setup(imageName: imageName)
            return cell
        case .sections(let section):
            switch section.elements {
            case .fatigueLevels(let text), .points(let text), .punishment(let text):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoCell.self)) as? InfoCell else { return UITableViewCell()}
                cell.setup(text: text)
                return cell
            }
        case .buttonCell(let name):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoButtonCell.self)) as? InfoButtonCell else { return UITableViewCell()}
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
        switch infoElements[section] {
        case let .sections(sectionInfo):
            let headerView = InfoTableHeaderView()
            headerView.configure(withTitle: sectionInfo.title,
                                 isExpanded: sectionInfo.isExpanded,
                                 section: section,
                                 target: self,
                                 action: #selector(toggleSection(sender:)),
                                 hasSeparator: sectionInfo.hasSeparator)
            return headerView
        default:
            return nil
        }
    }
}

// MARK: Private
private extension InfoTableView {
    func initialize() {
        register(InfoImageCell.self, forCellReuseIdentifier: String(describing: InfoImageCell.self))
        register(InfoCell.self, forCellReuseIdentifier: String(describing: InfoCell.self))
        register(InfoButtonCell.self, forCellReuseIdentifier: String(describing: InfoButtonCell.self))
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        dataSource = self
        delegate = self
    }
    
    @objc func toggleSection(sender: UIButton) {
        guard let headerView = sender.superview as? InfoTableHeaderView else { return }
        let section = headerView.section
        guard case var .sections(sectionInfo) = infoElements[section] else { return }
        sectionInfo.isExpanded.toggle()
        sectionInfo.hasSeparator = !sectionInfo.isExpanded
        infoElements[section] = .sections(sectionInfo)
        self.reloadData()
    }
}
