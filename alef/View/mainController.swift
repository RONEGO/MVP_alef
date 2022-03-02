//
//  ViewController.swift
//  alef
//
//  Created by Yegor Geronin on 01.03.2022.
//

import UIKit

class mainController: UIViewController {
    
    private var personalData:   personalDataView?
    private var cleanButton:    cleanButtonView?
    private var childrenTable:  childrenTableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Тестовое Задание"
    }
    
    override func viewWillLayoutSubviews() {
        setMainUI()
    }
    
    private func setMainUI() {
        
        guard let navigationBar = navigationController?.navigationBar else {
            print("I need Navigation and Status Bars!")
            return
        }
        
        // set personal data
        personalData = personalDataView(frame: CGRect(  x: view.width * ( 1 - .mainWidth) / 2,
                                                        y: navigationBar.bottom,
                                                        width: view.width * .mainWidth,
                                                        height: .labelHeight + .formHeight))
        // set button
        cleanButton = cleanButtonView(frame: CGRect(    x: view.width * ( 1 - .mainWidth / 1.5) / 2,
                                                        y: view.bottom - view.safeAreaInsets.top,
                                                        width: view.width * .mainWidth / 1.5,
                                                        height: .labelHeight))
        // set table
        childrenTable = childrenTableView(frame: CGRect(x: view.width * ( 1 - .mainWidth) / 2,
                                                        y: personalData!.bottom + 20,
                                                        width: view.width * .mainWidth,
                                                        height: cleanButton!.top - personalData!.bottom - 40))
        
        Presenter.childrenClass.tableView       = childrenTable
        Presenter.childrenClass.personalView    = personalData
        
        cleanButton!.addTarget(Presenter.childrenClass,
                               action: #selector(Presenter.childrenClass.cleanAll),
                               for: .touchUpInside)
        
        view.addSubview(childrenTable!)
        view.addSubview(cleanButton!)
        view.addSubview(personalData!)
    }
    
}

