//
//  StatisticsViewController.swift
//  Project-structure
//
//  Created by Elina Semenko on 01.03.2023.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak private var selectorView: UIView!
    @IBOutlet weak private var totalLength: UILabel!
    @IBOutlet weak private var chartContainerView: UIView!
    @IBOutlet weak private var tableContainer: UIView!
    
    @IBOutlet weak var temporaryImg: UIImageView!
    
    private var viewModel: StatisticsVM = StatisticsViewModel()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTableView()
        
        temporaryImg.contentMode = .scaleToFill
        temporaryImg.image = UIImage(named: "stat")
    }
    
    private func setupTableView() {
        tableContainer.addSubview(tableView)
        tableView.frame = CGRect(origin: tableContainer.bounds.origin, size: CGSize(width: view.bounds.width, height: tableContainer.bounds.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "WalkTableViewCell", bundle: nil), forCellReuseIdentifier: "WalkTableViewCell")
    }
    
    private func setupViewModel() {
        viewModel.delegate = self
    }
}

extension StatisticsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.walks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WalkTableViewCell", for: indexPath) as? WalkTableViewCell else { return UITableViewCell() }
        cell.configure(with: viewModel.walks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

extension StatisticsViewController: StatisticsDelegate {
    func didUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
