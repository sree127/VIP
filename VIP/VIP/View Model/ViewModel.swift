//
//  ViewModel.swift
//  VIP
//
//  Created by Sreejith Njamelil on 13.11.18.
//  Copyright © 2018 Sreejith Njamelil. All rights reserved.
//

import RxSwift
import RxCocoa

class ViewModel {
  
  let searchText = Variable("")
  
  lazy var data: Driver<[Repository]> = {
    
    return searchText
      .asObservable()
      .debounce(0.3, scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .flatMapLatest(APIManager.repositoriesBy)
      .asDriver(onErrorJustReturn: [])
  }()
}
