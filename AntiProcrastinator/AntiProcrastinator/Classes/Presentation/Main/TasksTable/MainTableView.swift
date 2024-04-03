//
//  MainTableView.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class MainTableView: UITableView {
    lazy var allElements = [MainTableElements]()
    var didSelectItem: ((Task) -> Void)?
    var didSelectedDate: ((Date) -> Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension MainTableView {
    func setup(allElements: [MainTableElements]) {
        self.allElements = allElements
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch allElements[indexPath.row] {
        case .Info(let info):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainInfoCell.self)) as? MainInfoCell else { return UITableViewCell()}
            cell.setup(fatiguePoints: info.fatiguePoints,
                       description: info.description,
                       userName: info.userName)
            return cell
        case .Calendar(let task):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainCalendarCell.self)) as? MainCalendarCell else { return UITableViewCell()}
            cell.didSelectedDate = { [weak self] date in
                self?.didSelectedDate?(date)
            }
            cell.setup(task: task)
            return cell
        case .Tasks(let task):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainTaskCell.self)) as? MainTaskCell else { return UITableViewCell() }
            cell.setup(task: task)
            return cell
        }
    }
}

//MARK: UITableViewDelegate
extension MainTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch allElements[indexPath.row] {
        case .Tasks(let task):
                didSelectItem?(task)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: Private
private extension MainTableView {
    func initialize() {
        register(MainInfoCell.self, forCellReuseIdentifier: String(describing: MainInfoCell.self))
        register(MainTaskCell.self, forCellReuseIdentifier: String(describing: MainTaskCell.self))
        register(MainCalendarCell.self, forCellReuseIdentifier: String(describing: MainCalendarCell.self))
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        dataSource = self
        delegate = self
    }
}
