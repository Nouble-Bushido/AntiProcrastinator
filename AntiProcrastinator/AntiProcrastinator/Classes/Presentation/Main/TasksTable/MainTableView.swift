//
//  MainTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class MainTableView: UITableView {
    lazy var tasks: [Task] = []
    var didSelectItem: ((Task) -> Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTableView {
    func setup(tasks: [Task]) {
        self.tasks = tasks
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainCell.self)) as? MainCell else { return UITableViewCell() }
        let task = tasks[indexPath.row]
        cell.setup(task: task)
        return cell
    }
}

//MARK: UITableViewDelegate
extension MainTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = tasks[indexPath.row]
        didSelectItem?(selectedTask)
    }
}

// MARK: Private
private extension MainTableView {
    func initialize() {
        register(MainCell.self, forCellReuseIdentifier: String(describing: MainCell.self))
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        dataSource = self
        delegate = self
    }
}
