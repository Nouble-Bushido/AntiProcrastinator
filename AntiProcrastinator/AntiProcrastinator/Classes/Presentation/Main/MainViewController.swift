//
//  MainViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    private lazy var mainView = MainView()
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButtons()
    }
}

//MARK: Private
private extension MainViewController {
    func actionButtons() {
        mainView.infoButton.addTarget(self, action: #selector(pressInfoButton), for: .touchUpInside)
        mainView.addTaskButton.addTarget(self, action: #selector(pressAddTaskButton), for: .touchUpInside)
    }
    
    @objc func pressInfoButton() {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @objc func pressAddTaskButton() {
        let vc = AddTaskViewController.make()
        navigationController?.pushViewController(vc, animated: true)
    }
}
