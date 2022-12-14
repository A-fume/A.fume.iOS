//
//  SaveLoginInfoUseCase.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/12/05.
//

final class SaveLoginInfoUseCase {
  private let userRepository: UserRepository
  
  init(userRepository: UserRepository) {
    self.userRepository = userRepository
  }
  
  func execute(loginInfo: LoginInfo, email: String?, password: String?) {
    self.userRepository.saveLoginInfo(loginInfo: loginInfo, email: email, password: password)
  }
}
