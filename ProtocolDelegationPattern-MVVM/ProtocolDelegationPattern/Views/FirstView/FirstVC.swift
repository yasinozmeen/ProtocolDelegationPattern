//
//  ViewController.swift
//  ProtocolDelegationPattern-MVVM
//
//  Created by Kadir Yasin Özmen on 13.06.2023.
//

import UIKit
protocol ButtonTapProtocol: AnyObject {
    func didTapButton(text: String?)
}
final class FirstVC: UIViewController, ButtonTapProtocol {
    // MARK: - Properties
    let secondVC = SecondVC()
    var firstView: FirstView?
    var secondVCDelegate: PrepareChangeLabelNameProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        delegateImplemantent()
    }
    
    // MARK: - Functions
    private func configureUI() {
        firstView = FirstView()
        self.view = firstView
    }
    
    private func delegateImplemantent() {
        firstView?.buttonTapDelegate = self
        secondVCDelegate = secondVC
    }
    
    func didTapButton(text: String?) {
        secondVCDelegate?.getText(text: text) {
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }
}


