//
//  AddTaskTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskTableView: UITableView {
    lazy var elements = [AddTaskSection]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension AddTaskTableView {
    func setup(elements: [AddTaskSection]) {
        self.elements = elements
        reloadData()
    }
}

//MARK: UITableViewDataSource
extension AddTaskTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch elements[indexPath.row] {
        case .taskName(let text), .description(let text):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddTaskCell.self)) as? AddTaskCell else { return UITableViewCell()}
            cell.setup(task: text)
            return cell
        case .date(let text):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddTaskDateCell.self)) as? AddTaskDateCell else { return UITableViewCell()}
            cell.setup(task: text)
            return cell
        }
    }
}

//MARK: Private
private extension AddTaskTableView {
    func initialize() {
        register(AddTaskCell.self, forCellReuseIdentifier: String(describing: AddTaskCell.self))
        register(AddTaskDateCell.self, forCellReuseIdentifier: String(describing: AddTaskDateCell.self))
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        dataSource = self
    }
}
