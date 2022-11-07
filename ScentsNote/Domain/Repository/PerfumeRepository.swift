//
//  PerfumeRepository.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/11/01.
//

import Foundation
import RxSwift
import Moya

protocol PerfumeRepository {
  // MARK: - Survey
  func fetchPerfumesInSurvey(completion: @escaping (Result<ListInfo<Perfume>?, NetworkError>) -> Void)
  func fetchKeywords(completion: @escaping (Result<ListInfo<SurveyKeyword>?, NetworkError>) -> Void)
  func fetchSeries(completion: @escaping (Result<ListInfo<SurveySeries>?, NetworkError>) -> Void)
  
  // MARK: - Home
  func fetchPerfumesRecommended(completion: @escaping (Result<ListInfo<Perfume>?, NetworkError>) -> Void)
  func fetchPerfumesPopular(completion: @escaping (Result<ListInfo<Perfume>?, NetworkError>) -> Void)
  func fetchRecentPerfumes(completion: @escaping (Result<ListInfo<Perfume>?, NetworkError>) -> Void)
  func fetchNewPerfumes(completion: @escaping (Result<ListInfo<Perfume>?, NetworkError>) -> Void)

}
