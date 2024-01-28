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
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear

        let label = UILabel()
        label.textColor = UIColor(integralRed: 0, green: 0, blue: 0)
        label.font = Fonts.Ubuntu.medium(size: 16.scale)
        label.textAlignment = .center
        label.text = sections[section].title
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton()
        button.setImage(UIImage(systemName: sections[section].isExpanded ? "chevron.up" : "chevron.down"), for: .normal)
        button.tintColor = UIColor(integralRed: 0, green: 0, blue: 0)
        button.addTarget(self, action: #selector(toggleSection(sender:)), for: .touchUpInside)
        button.tag = section
        button.translatesAutoresizingMaskIntoConstraints = false

        headerView.addSubview(label)
        headerView.addSubview(button)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16.scale),
            label.topAnchor.constraint(equalTo: headerView.topAnchor),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10.scale),
            
            button.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            button.topAnchor.constraint(equalTo: headerView.topAnchor),
            button.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10.scale)
        ])

        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoCell.self)) as? InfoCell else { return UITableViewCell()}
        
        switch sections[indexPath.section].elements {
        case .fatigueLevels(let text), .points(let text), .punishment(let text):
            cell.setup(text: text)
        }
        return cell
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
        dataSource = self
        delegate = self
    }
    
    @objc func toggleSection(sender: UIButton) {
        let section = sender.tag
        sections[section].isExpanded.toggle()
        
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
