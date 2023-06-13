//
//  FirstView.swift
//  ProtocolDelegationPattern-MVVM
//
//  Created by Kadir Yasin Özmen on 13.06.2023.
//

import UIKit.UIView
import SnapKit

class FirstView: UIView {
    // MARK: - Varaibles
    
    // MARK: - UI Elements
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "........"
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    private let firstTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "enter something"
        return tf
    }()
    private let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("click for go", for: .normal)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func configure() {
        backgroundColor = .systemGray5
        setupFirstLabel()
        setupFirstTf()
        setupFirstButton()
    }
    // MARK: - Action
    @objc func buttonTapped(){
    }
}
// MARK: - UI Configure Function With SnapKit
extension FirstView {
    func setupFirstLabel() {
        addSubview(firstLabel)
        
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualToSuperview().inset(20)
        }
    }
    func setupFirstTf() {
        addSubview(firstTF)
        
        firstTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstLabel.snp.bottom).offset(20)
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualToSuperview().inset(20)
        }
    }
    func setupFirstButton() {
        addSubview(firstButton)
        firstButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstTF.snp.bottom).offset(20)
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualToSuperview().inset(20)
        }
    }
}

