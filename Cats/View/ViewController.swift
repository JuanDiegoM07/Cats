//
//  ViewController.swift
//  Cats
//
//  Created by Juan Diego Marin on 10/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Private Properties
    
    private var viewModel = CatsViewModel(repository: ApiCats())
    
    // MARK: - Life cycle View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getCats()
        viewModel.success = {
            self.tableView.reloadData()
        }
        viewModel.error = { error in
            print(error)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.cat = viewModel.cats[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       250
    }
    
}
