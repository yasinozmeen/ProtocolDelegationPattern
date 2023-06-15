//
//  SecondViewController.swift
//  ProtocolDelegationPattern-MVVM
//
//  Created by Kadir Yasin Özmen on 13.06.2023.
//

import UIKit

protocol ChangeLabelNameProtocol: AnyObject {
    func getText(text: String?, handler: (()->()))
    func changeLabel()
}
class SecondVC: UIViewController, ButtonTapProtocol {
    // MARK: - Varaibles
    var changeLAbelDelegate:ChangeLabelProtocol?
    var secondView: SecondView?
    var labelText:String = ""
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        delegateImplemantent()
        changeLabel()
    }
    
    // MARK: - Functions
    func configureUI() {
        navigationItem.hidesBackButton = true
        secondView = SecondView()
        view = secondView
    }
    func delegateImplemantent(){
        secondView?.buttonTapDelegate = self
    }
    func didTapButton(text: String?) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension SecondVC: ChangeLabelNameProtocol{
    func changeLabel() {
        changeLAbelDelegate = secondView
        changeLAbelDelegate?.changeLabel(text: labelText)
    }
    
    
    func getText(text: String?, handler: (()->())){
        if let text = text{
            self.labelText = text
            handler()
        }
    }
    
}
