//
//  PerfumeReviewCoordinator.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/12/02.
//

import Foundation

protocol PerfumeReviewCoordinator: PopUpCoordinator {
  var finishFlow: (() -> Void)? { get set }
  var runPerfumeDetailFlow: ((Int) -> Void)? { get set}
  func showKeywordBottomSheetViewController(keywords: [Keyword])
  func hideKeywordBottomSheetViewController(keywords: [Keyword])
}
