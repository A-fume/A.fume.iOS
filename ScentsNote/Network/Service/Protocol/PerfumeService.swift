//
//  PerfumeService.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/11/01.
//

import Foundation
import RxSwift

protocol PerfumeService {
  
  // Survey
  func fetchPerfumesInSurvey(completion: @escaping (Result<ListInfo<Perfume>?, NetworkError>) -> Void)
  func fetchKeywords(completion: @escaping (Result<ListInfo<SurveyKeyword>?, NetworkError>) -> Void)
  func fetchSeries(completion: @escaping (Result<ListInfo<SurveySeries>?, NetworkError>) -> Void)
  
  //Home
  func fetchPerfumesRecommended() -> Observable<ListInfo<Perfume>?>
  func fetchPerfumesPopular() -> Observable<ListInfo<Perfume>?>
  func fetchRecentPerfumes() -> Observable<ListInfo<Perfume>?>
  func fetchNewPerfumes() -> Observable<ListInfo<Perfume>?>
  
}
