//
//  SignUpGenderViewController.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/10/27.
//

import UIKit
import RxSwift
import SnapKit
import Then

final class SignUpGenderViewController: UIViewController {
  var viewModel: SignUpGenderViewModel?
  private var disposeBag = DisposeBag()
  
  private let container = UIView()
  private let titleLabel = UILabel().then {
    $0.text = "성별을 선택해주세요."
    $0.textColor = .darkGray7d
    $0.font = .notoSans(type: .regular, size: 14)
  }
  
  private let manButton = UIButton().then { $0.setImage(.btnManInactive, for: .normal) }
  private let womanButton = UIButton().then { $0.setImage(.btnWomanInactive, for: .normal) }
  private let manLabel = UILabel().then {
    $0.text = "남자"
    $0.textColor = .grayCd
    $0.font = .notoSans(type: .regular, size: 15)
  }
  private let womanLabel = UILabel().then {
    $0.text = "여자"
    $0.textColor = .grayCd
    $0.font = .notoSans(type: .regular, size: 15)
  }
  
  private let dividerTop = UIView().then { $0.backgroundColor = .blackText }
  private let dividerCenter = UIView().then { $0.backgroundColor = .blackText }
  private let dividerBottom = UIView().then { $0.backgroundColor = .blackText }
  
  private let nextButton = NextButton(frame: .zero, title: "다음")

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureUI()
    self.bindViewModel()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
}

extension SignUpGenderViewController {
  private func configureUI() {
    self.view.backgroundColor = .white
    self.setBackButton()
    self.setNavigationTitle(title: "회원가입")
    
    self.view.addSubview(self.container)
    self.container.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.bottom.equalToSuperview()
      $0.left.right.equalToSuperview().inset(20)
    }
    
    self.container.addSubview(self.titleLabel)
    self.titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(32)
      $0.left.equalToSuperview()
    }
    
    self.container.addSubview(self.dividerTop)
    self.dividerTop.snp.makeConstraints {
      $0.top.equalTo(self.titleLabel.snp.bottom).offset(16)
      $0.left.right.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    self.container.addSubview(self.dividerCenter)
    self.dividerCenter.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(self.dividerTop.snp.bottom).offset(16)
      $0.height.equalTo(126)
      $0.width.equalTo(0.5)
    }
    
    self.container.addSubview(self.dividerBottom)
    self.dividerBottom.snp.makeConstraints {
      $0.top.equalTo(self.dividerCenter.snp.bottom).offset(16)
      $0.left.right.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    self.container.addSubview(self.manButton)
    self.manButton.snp.makeConstraints {
      $0.top.equalTo(self.dividerTop.snp.bottom).offset(19)
      $0.left.equalToSuperview()
      $0.right.equalTo(self.dividerCenter.snp.left)
    }
    
    self.container.addSubview(self.manLabel)
    self.manLabel.snp.makeConstraints {
      $0.centerX.equalTo(self.manButton)
      $0.top.equalTo(self.manButton.snp.bottom).offset(8)
    }
    
    self.container.addSubview(self.womanButton)
    self.womanButton.snp.makeConstraints {
      $0.top.equalTo(self.dividerTop.snp.bottom).offset(19)
      $0.right.equalToSuperview()
      $0.left.equalTo(self.dividerCenter.snp.right)
    }
    
    self.container.addSubview(self.womanLabel)
    self.womanLabel.snp.makeConstraints {
      $0.centerX.equalTo(self.womanButton)
      $0.top.equalTo(self.womanButton.snp.bottom).offset(8)
    }
    
    self.view.addSubview(self.nextButton)
    self.nextButton.snp.makeConstraints {
      $0.left.right.equalToSuperview()
      $0.height.equalTo(86)
      $0.bottom.equalToSuperview()
    }
  }
}

extension SignUpGenderViewController {
  private func bindViewModel() {
    let input = SignUpGenderViewModel.Input(
      manButtonDidTapEvent: self.manButton.rx.tap.asObservable(),
      womanButtonDidTapEvent: self.womanButton.rx.tap.asObservable(),
      nextButtonDidTapEvent: self.nextButton.rx.tap.asObservable()
    )
    
    let output = self.viewModel?.transform(from: input, disposeBag: disposeBag)
    self.bindGenderSection(output: output)
  }
  
  private func bindGenderSection(output: SignUpGenderViewModel.Output?) {
    output?.selectedGenderState
      .asDriver(onErrorJustReturn: .none)
      .drive(onNext: { [weak self] state in
        self?.updateGenderSection(state: state)
        self?.updateNextButton(state: state)
      })
      .disposed(by: disposeBag)
  }
}

extension SignUpGenderViewController {
  private func updateGenderSection(state: GenderState) {
    self.manButton.setImage(state == .man ? .btnManActive : .btnManInactive, for: .normal)
    self.manLabel.textColor = state == .man ? .blackText : .grayCd
    self.womanButton.setImage(state == .woman ? .btnWomanActive : .btnWomanInactive, for: .normal)
    self.womanLabel.textColor = state == .woman ? .blackText : .grayCd
  }
  
  private func updateNextButton(state: GenderState) {
    self.nextButton.isHidden = state == .none
  }
}
