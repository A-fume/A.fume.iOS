//
//  MypageCoordinator.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/11/06.
//

protocol MyPageCoordinator: AnyObject {

  var onOnboardingFlow: (() -> Void)? { get set }
  func runEditInfoFlow()
  func runChangePasswordFlow()
  func runWebFlow(with url: String)
  func showMyPageMenuViewController()
  func hideMyPageMenuViewController()
}

