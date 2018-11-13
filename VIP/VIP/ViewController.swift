//
//  ViewController.swift
//  VIP
//
//  Created by Sreejith Njamelil on 13.11.18.
//  Copyright © 2018 Sreejith Njamelil. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  let searchController = UISearchController(searchResultsController: nil)
  var searchBar: UISearchBar { return searchController.searchBar }
  
  var viewModel = ViewModel()
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    configureSearchBar()

    viewModel.data.drive(tableView.rx.items(cellIdentifier: "Cell")) { _, repository, cell in
      cell.textLabel?.text = repository.repoName
      cell.detailTextLabel?.text = repository.repoURL
    }.addDisposableTo(disposeBag)
  }

  func configureSearchBar() {
    searchController.obscuresBackgroundDuringPresentation = false
    searchBar.showsCancelButton = true
    searchBar.text = "Sreejith"
    searchBar.placeholder = "Enter GitHub ID, e.g., \"sree27\""
    tableView.tableHeaderView = searchController.searchBar
    definesPresentationContext = true
  }

}

