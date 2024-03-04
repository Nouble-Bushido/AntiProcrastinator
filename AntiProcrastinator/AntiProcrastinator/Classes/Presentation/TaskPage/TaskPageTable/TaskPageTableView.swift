//
//  TaskPageTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.02.2024.
//

import UIKit

final class TaskPageTableView: UITableView {
    lazy var elements = [TaskPageElements]()
    var completeButtonTappedHandler: (() -> Void)?
    var removeButtonTappedHandler: (() -> Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension TaskPageTableView {
    func setup(elements: [TaskPageElements]) {
        self.elements = elements
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension TaskPageTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch elements[indexPath.row] {
        case .image(let representation):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskPageTypeCell.self)) as? TaskPageTypeCell else { return UITableViewCell()}
            cell.setup(representation: representation)
            return cell
        case .details(let task, let status):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskPageDetailsCell.self)) as? TaskPageDetailsCell else { return UITableViewCell()}
            cell.setup(task: task, status: status)
            return cell
        case .buttons:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskPageButtonsCell.self)) as? TaskPageButtonsCell else { return UITableViewCell()}
            cell.completeButtonTappedHandler = { [weak self] in
                self?.completeButtonTappedHandler?()
            }
            cell.removeButtonTappedHandler = { [weak self] in
                self?.removeButtonTappedHandler?()
            }
            return cell
        }
    }
}

// MARK: Private
private extension TaskPageTableView {
    func initialize() {
        register(TaskPageTypeCell.self, forCellReuseIdentifier: String(describing: TaskPageTypeCell.self))
        register(TaskPageDetailsCell.self, forCellReuseIdentifier: String(describing: TaskPageDetailsCell.self))
        register(TaskPageButtonsCell.self, forCellReuseIdentifier: String(describing: TaskPageButtonsCell.self))
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        dataSource = self
    }
}
