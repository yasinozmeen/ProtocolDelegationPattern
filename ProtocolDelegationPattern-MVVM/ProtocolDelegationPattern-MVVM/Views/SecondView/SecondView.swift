//
//  FirstView.swift
//  ProtocolDelegationPattern-MVVM
//
//  Created by Kadir Yasin Özmen on 13.06.2023.
//

import UIKit.UIView
import SnapKit

protocol ChangeLabelProtocol:AnyObject {
    func changeLabel(text:String)
}
class SecondView: UIView,ChangeLabelProtocol {
    let secondVC = SecondVC()
    weak var buttonTapDelegate: ButtonTapProtocol?
    
    // MARK: - UI Elements
    private var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "....."
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    private let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("click for back", for: .normal)
        button.tintColor = .label
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Clycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        secondVC.changeLAbelDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func configure() {
        backgroundColor = .systemGray5
        setupSecondLabel()
        setupSecondButton()
    }
    // MARK: - Action
    @objc func buttonTapped(){
        buttonTapDelegate?.didTapButton(text: nil)
    }
    func changeLabel(text: String) {
        secondLabel.text = text
    }
    
    
}
// MARK: - UI Configure Function With SnapKit
extension SecondView {
    func setupSecondLabel() {
        addSubview(secondLabel)
        
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualToSuperview().inset(20)
        }
    }
    func setupSecondButton() {
        addSubview(secondButton)
        secondButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondLabel.snp.bottom).offset(20)
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualToSuperview().inset(20)
        }
    }
}

