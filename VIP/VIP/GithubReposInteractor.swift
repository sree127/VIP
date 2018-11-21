//
//  GithubReposInteractor.swift
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

protocol GithubReposBusinessLogic
{
  func doSomething(request: GithubRepos.FetchRepos.Request)
}

protocol GithubReposDataStore
{
  //var name: String { get set }
}

class GithubReposInteractor: GithubReposBusinessLogic, GithubReposDataStore
{
  var presenter: GithubReposPresentationLogic?
  var worker: GithubReposWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: GithubRepos.FetchRepos.Request)
  {
    worker = GithubReposWorker()
    let fetchedRepos = worker?.repositoriesBy(request.userId ?? "sree127")
    presenter?.presentSomething(response: GithubRepos.FetchRepos.Response(result: fetchedRepos))
  }
}
