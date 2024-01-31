//
//  InfoTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoTableView: UITableView {
    lazy var sections = [InfoTableSection]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTableView {
    func setup(sections: [InfoTableSection]) {
        self.sections = sections
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension InfoTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = InfoTableHeaderView()
        headerView.configure(withTitle: sections[section].title,
                             isExpanded: sections[section].isExpanded,
                             section: section,
                             target: self,
                             action: #selector(toggleSection(sender:)))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.scale
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].isExpanded ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoCell.self)) as? InfoCell else { return UITableViewCell()}
        
        switch sections[indexPath.section].elements {
        case .fatigueLevels(let text), .points(let text), .punishment(let text):
            cell.setup(text: text)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let result = UIView()
        let insets = tableView.separatorInset
        let width = tableView.bounds.width - insets.left - insets.right
        let separatorFrame = CGRect(x: insets.left, y: -0.5, width: width, height: 0.5)
        
        let separator = CALayer()
        separator.frame = separatorFrame
        separator.backgroundColor = tableView.separatorColor?.cgColor
        result.layer.addSublayer(separator)
        
        return result
    }
}

//MARK: UITableViewDelegate
extension InfoTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].isExpanded ? UITableView.automaticDimension : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        sections[section].isExpanded.toggle()
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}

// MARK: Private
private extension InfoTableView {
    func initialize() {
        register(InfoCell.self, forCellReuseIdentifier: String(describing: InfoCell.self))
        showsVerticalScrollIndicator = false
        dataSource = self
        delegate = self
    }
    
    @objc func toggleSection(sender: UIButton) {
        let section = sender.tag
        sections[section].isExpanded.toggle()
        self.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}
