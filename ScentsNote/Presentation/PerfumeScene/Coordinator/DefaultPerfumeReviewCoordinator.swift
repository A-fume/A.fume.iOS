//
//  DefaultPerfumeReviewCoordinator.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/12/02.
//

import UIKit

final class DefaultPerfumeReviewCoordinator: BaseCoordinator, PerfumeReviewCoordinator {
  
  var finishFlow: (() -> Void)?
  var perfumeReviewViewController: PerfumeReviewViewController
  
  override init(_ navigationController: UINavigationController) {
    self.perfumeReviewViewController = PerfumeReviewViewController()
    super.init(navigationController)
  }
  
  func start(perfumeDetail: PerfumeDetail) {
    self.perfumeReviewViewController.viewModel = PerfumeReviewViewModel(
      coordinator: self,
      perfumeDetail: perfumeDetail,
      fetchKeywordsUseCase: FetchKeywordsUseCase(repository: DefaultKeywordRepository(keywordService: DefaultKeywordService.shared)),
      addReviewUseCase: AddReviewUseCase(repository: DefaultPerfumeRepository(perfumeService: DefaultPerfumeService.shared))
    )
    self.navigationController.pushViewController(self.perfumeReviewViewController, animated: true)
  }
  
  func showKeywordBottomSheetViewController(keywords: [Keyword]) {
    let vc = KeywordBottomSheetViewController()
    vc.viewModel = KeywordBottomSheetViewModel(
      coordinator: self,
      delegate: self.perfumeReviewViewController.viewModel!,
      keywords: keywords
    )

    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overCurrentContext
    self.navigationController.present(vc, animated: false)
  }
  
  func hideKeywordBottomSheetViewController(keywords: [Keyword]) {
    
  }
}
