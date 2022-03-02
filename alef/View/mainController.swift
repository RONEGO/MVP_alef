//
//  ViewController.swift
//  alef
//
//  Created by Yegor Geronin on 01.03.2022.
//

import UIKit

class mainController: UIViewController {
    
    private var mainScrollDefHeight: CGFloat = 0
    private let mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
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
        //mainScrollView.backgroundColor = .red
        mainScrollView.frame = CGRect(x: view.width * ( 1 - .mainWidth ) / 2,
                                      y: navigationBar.bottom,
                                      width: view.width * .mainWidth,
                                      height: view.bottom -
                                      navigationBar.bottom -
                                      view.safeAreaInsets.bottom)
        mainScrollDefHeight = mainScrollView.height
        
        // set personal data
        personalData = personalDataView(frame: CGRect(  x: 0,
                                                        y: 0,
                                                        width: mainScrollView.width,
                                                        height: .labelHeight + .formHeight))
        
        // set button
        cleanButton = cleanButtonView(frame: CGRect(    x: (mainScrollView.width -
                                                        mainScrollView.width / 1.5) / 2,
                                                        y: view.bottom -
                                                        navigationBar.bottom -
                                                        view.safeAreaInsets.bottom -
                                                        .labelHeight,
                                                        width: mainScrollView.width / 1.5,
                                                        height: .labelHeight))
        
        // set table
        childrenTable = childrenTableView(frame: CGRect(x: 0,
                                                        y: personalData!.bottom + 20,
                                                        width: mainScrollView.width,
                                                        height: cleanButton!.top -
                                                        personalData!.bottom - 40))
        
        Presenter.childrenClass.tableView       = childrenTable
        Presenter.childrenClass.personalView    = personalData
        
        cleanButton!.addTarget(self,
                               action: #selector(showAlert),
                               for: .touchUpInside)
        
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(personalData!)
        mainScrollView.addSubview(cleanButton!)
        mainScrollView.addSubview(childrenTable!)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardAppears(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardDisappears(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
}

// MARK: Alert Show
extension mainController {
    @objc
    private func showAlert() {
        let alertCenter = UIAlertController(title: "",
                                            message: "Очистить всю информацию?",
                                            preferredStyle: .actionSheet)
        alertCenter.addAction(UIAlertAction(title: "Очистить",
                                            style: .default,
                                            handler: { _ in
            Presenter.childrenClass.cleanAll()
        }))
        alertCenter.addAction(UIAlertAction(title: "Отмена",
                                            style: .cancel,
                                            handler: nil))
        present(alertCenter,
                animated: true)
    }
}

// MARK: Keyboard
extension mainController {
    @objc
    private func keyBoardAppears( _ notification: Notification) {
        guard  let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            print("error!")
            return
        }
        self.mainScrollView.contentSize = CGSize(width: mainScrollView.width,
                                                 height: mainScrollView.height +
                                                 keyboardFrame.cgRectValue.height)
    }
    @objc
    private func keyBoardDisappears( _ notification: Notification) {
        self.mainScrollView.contentSize = CGSize(width: mainScrollView.width,
                                                 height: mainScrollDefHeight)
    }
}

