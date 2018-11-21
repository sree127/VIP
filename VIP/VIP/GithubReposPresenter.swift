//
//  GithubReposPresenter.swift
//  VIP
//
//  Created by Sreejith Njamelil on 14.11.18.
//  Copyright (c) 2018 Sreejith Njamelil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift
import RxCocoa

protocol GithubReposPresentationLogic
{
  func presentSomething(response: GithubRepos.FetchRepos.Response)
}

class GithubReposPresenter: GithubReposPresentationLogic
{
  weak var viewController: GithubReposDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: GithubRepos.FetchRepos.Response) {
    
    let some = response.result?.flatMap { value -> Observable<[GithubRepos.FetchRepos.ViewModel]> in
      
      let itemMap = value.map { item -> GithubRepos.FetchRepos.ViewModel in
        guard let repoName = item["name"] as? String,
          let repoURL = item["html_url"] as? String else {
            return GithubRepos.FetchRepos.ViewModel(repoName: "", repoURL: "")
        }
        return GithubRepos.FetchRepos.ViewModel(repoName: repoName, repoURL: repoURL)
      }
      
      return Observable.from(optional: itemMap)
    }
    viewController?.displaySomething(viewModel: some!.asDriver(onErrorJustReturn: []))
  }
}
