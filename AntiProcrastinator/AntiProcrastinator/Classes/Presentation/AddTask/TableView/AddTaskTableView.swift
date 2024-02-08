//
//  AddTaskTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskTableView: UITableView {
    lazy var addTaskSections = [AddTaskSection]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: UITableViewDataSource
//extension AddTaskTableView {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        addTaskSections[section].elements.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}

//MARK: Private
private extension AddTaskTableView {
    func initialize() {
        register(AddTaskCell.self, forCellReuseIdentifier: String(describing: AddTaskCell.self))
        showsVerticalScrollIndicator = false
        separatorStyle = .none
//        dataSource = self
    }
}
