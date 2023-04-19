//
//  GuidedViewController.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import UIKit

class GuidedViewController: UIViewController {
    
    private var viewModel: GuidedVM = GuidedViewModel()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = CGRect(origin: CGPoint(x: view.bounds.origin.x, y: view.bounds.origin.x + 40), size: CGSize(width: view.bounds.width, height: view.bounds.height - 40)) // 40 - height of segment control
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "RouteTableViewCell", bundle: nil), forCellReuseIdentifier: "RouteTableViewCell")
    }
    
    private func setupViewModel() {
        viewModel.delegate = self
    }
}

extension GuidedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell") as? RouteTableViewCell else { return UITableViewCell() }
        cell.configure(with: viewModel.routes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

extension GuidedViewController: GuidedDelegate {
    func didUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
