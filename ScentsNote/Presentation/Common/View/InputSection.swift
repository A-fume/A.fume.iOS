//
//  InputSectionWithButton.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/10/26.
//

import UIKit
import RxRelay
import SnapKit

class InputSection: UIView {
  
  private let checkImage = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.image = .checkBeige
  }
  
  required init(title: String, textField: UITextField, button: UIButton? = nil, warningLabel: UILabel? = nil){
    super.init(frame: .zero)
    self.configureUI(title: title, textField: textField, button: button, warningLabel: warningLabel)
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI(title: String, textField: UITextField, button: UIButton?, warningLabel: UILabel?) {
    let titleLabel = UILabel().then {
      $0.text = title
      $0.font = .notoSans(type: .regular, size: 14)
      $0.textColor = .darkGray7d
    }
    
    let underLineView = UIView().then {
      $0.backgroundColor = .blackText
    }
    
    self.addSubview(titleLabel)
    titleLabel.snp.makeConstraints {
      $0.top.left.equalToSuperview()
    }
    
    self.addSubview(textField)
    textField.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.left.equalToSuperview()
    }
    
    self.addSubview(underLineView)
    underLineView.snp.makeConstraints {
      $0.top.equalTo(textField.snp.bottom).offset(8)
      $0.bottom.left.right.equalToSuperview()
      $0.height.equalTo(1)
    }

    self.addSubview(self.checkImage)
    self.checkImage.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    self.checkImage.snp.makeConstraints {
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-8)
    }
    self.checkImage.isHidden = true

    if let label = warningLabel {
      self.addSubview(label)
      label.snp.makeConstraints {
        $0.top.equalTo(underLineView.snp.bottom).offset(8)
        $0.left.right.equalToSuperview()
      }
    }
    
    if let button = button {
      self.addSubview(button)
      button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
      button.snp.makeConstraints {
        $0.right.equalToSuperview()
        $0.bottom.equalToSuperview().offset(-8)
      }
      
      textField.snp.makeConstraints {
        $0.right.equalTo(button.snp.left).offset(-8)
      }
    } else {
      textField.snp.makeConstraints {
        $0.right.equalTo(self.checkImage.snp.right).offset(-8)
      }
    }
  }
  
  func updateUI(state: InputState) {
    self.checkImage.isHidden = state != .success
  }
}
