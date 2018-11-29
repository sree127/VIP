//
//  GithubReposViewController.swift
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

protocol GithubReposDisplayLogic: class
{
  func displaySomething(viewModel: [GithubRepos.FetchRepos.ViewModel])
}

class GithubReposViewController: UIViewController, GithubReposDisplayLogic
{
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var viewModel: [GithubRepos.FetchRepos.ViewModel] = []
  
  var interactor: GithubReposBusinessLogic?
  var router: (NSObjectProtocol & GithubReposRoutingLogic & GithubReposDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = GithubReposInteractor()
    let presenter = GithubReposPresenter()
    let router = GithubReposRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = GithubRepos.FetchRepos.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: [GithubRepos.FetchRepos.ViewModel])
  {
    self.viewModel = viewModel
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

extension GithubReposViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    
    cell.textLabel?.text = viewModel[indexPath.row].repoName
    cell.detailTextLabel?.text = viewModel[indexPath.row].repoURL
    
    return cell
  }
}


extension GithubReposViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    let request = GithubRepos.FetchRepos.Request(userId: searchBar.text)
    interactor?.doSomething(request: request)
  }
}
