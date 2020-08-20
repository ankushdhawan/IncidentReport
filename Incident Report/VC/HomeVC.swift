//
//  HomeVC.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import UIKit
protocol HomeProtocol {
    func noRecordAdded()
}

class HomeVC: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    var viewModel: HomeViewModelProtocol?
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var searchBar:UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlusButton()
        self.tableView.rowHeight = UITableView.automaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.delegate = self
        fetchRecords()
    }
    func fetchRecords()
    {
        viewModel?.fetchIncidents(completionHandler: {[weak self] in
            self?.tableView.dataSource = self?.viewModel?.dataSource as! UITableViewDataSource
            self?.tableView.reloadData()
        })
    }
    
    func addPlusButton()
    {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItems = [add]
    }
    @objc func addTapped()
    {
        coordinator?.addIncidentScreen()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension HomeVC:HomeProtocol
{
    func noRecordAdded() {
        self.presentAlertWithTitle(title: "", message: "No record found", options: "OK") {[weak self]_ in
            
        }
    }
}
extension HomeVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}
extension HomeVC:UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel?.searchText(serach:searchText)
        tableView.reloadData()
    }
}