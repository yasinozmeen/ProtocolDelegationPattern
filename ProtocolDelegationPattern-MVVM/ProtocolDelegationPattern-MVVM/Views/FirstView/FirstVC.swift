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
    let secondVC = SecondVC()
    var firstView: FirstView?
    var secondVCDelegate: ChangeLabelNameProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        delegateImplemantent()
    }
    
    // MARK: - Functions
    private func configureUI() {
        firstView = FirstView()
        self.view = firstView // view = FirstView() gibi tanimlamak yerine boyle tanimliyoruz ki firstView degiskeni FirstVC gitti zaman gitsin.
    }
    
    private func delegateImplemantent() {
        firstView?.buttonTapDelegate = self
        secondVCDelegate = secondVC
    }
    
    func didTapButton(text: String?) {
        secondVCDelegate?.getText(text: text,handler: {
            navigationController?.pushViewController(secondVC, animated: true)
        })
    }
}


