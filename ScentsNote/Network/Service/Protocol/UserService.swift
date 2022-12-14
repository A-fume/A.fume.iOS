//
//  UserService.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/10/20.
//

import Foundation
import RxSwift
import Moya

protocol UserService {
  // MARK: - Login
  func login(email: String, password: String) -> Observable<LoginInfo>
  
  // MARK: - SignUp
  func signUp(signUpInfo: SignUpInfo) -> Observable<LoginInfo>
  func checkDuplicateEmail(email: String) -> Observable<Bool>
  func checkDuplicateNickname(nickname: String) -> Observable<Bool>
  
  // MARK: - Survey
  func registerSurvey(perfumeList: [Int], keywordList: [Int], seriesList: [Int]) -> Observable<String>
  
  // MARK: - My Page
  func fetchPerfumesInMyPage(userIdx: Int) -> Observable<ListInfo<PerfumeInMyPageResponseDTO>>
  func updateUserInfo(userIdx: Int, userInfo: UserInfoRequestDTO) -> Observable<UserInfoResponseDTO>
  func changePassword(password: PasswordRequestDTO) -> Observable<String>
  func fetchReviewsInMyPage() -> Observable<[ReviewInMyPageResponseDTO]>
}
