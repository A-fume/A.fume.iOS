//
//  SurveyCoordinator.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/10/28.
//

import Foundation

protocol SurveyCoordinator: AnyObject {
  
  var finishFlow: (() -> Void)? { get set }

//  func runSurveyFlow()
}
