//
//  MyPageReviewGroupCell.swift
//  ScentsNote
//
//  Created by 황득연 on 2022/12/06.
//

import Foundation

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

final class MyPageReviewGroupCell: UICollectionViewCell {
  
  // MARK: - Var $ Let
  var onClickReview: ((Int) -> Void)?
  
  var disposeBag = DisposeBag()
  var reviews = BehaviorRelay<[ReviewInMyPage]>(value: [])
  
  // MARK: - UI
  private let bgView = UIImageView().then {
    $0.image = .bgMypageReview
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewLayoutFactory.reviewInMyPageLayout).then {
    $0.backgroundColor = .clear
    $0.isScrollEnabled = false
    $0.register(MyPageReviewCell.self)
  }
  
  // MARK: - Life Cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configureUI()
    self.bindUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.disposeBag = DisposeBag()
    self.bindUI()
  }
  
  // MARK: Configure
  func configureUI() {
    self.contentView.addSubview(self.bgView)
    self.bgView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(86)
      $0.left.right.equalToSuperview()
    }
    
    self.contentView.addSubview(self.collectionView)
    self.collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func bindUI() {
    self.reviews
      .bind(to: self.collectionView.rx.items(cellIdentifier: "MyPageReviewCell", cellType: MyPageReviewCell.self)) { _, review, cell in
        cell.updateUI(review: review)
        cell.onClickReview = self.onClickReview
      }
      .disposed(by: self.disposeBag)
  }
  
  func updateUI(reviews: [ReviewInMyPage]) {
    self.reviews.accept(reviews)
  }
  
}
