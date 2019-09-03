//
//  HomeViewController.swift
//  GymsCouch
//
//  Created by Abdelrahman Abu Sharkh on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var gymsTabelView: UITableView!
    
    // MARK: - Properties
    var gyms: [Gym] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        callApi(page: 1, perPage: 4)
    }
    
}

// MARK: - Tabel Data Source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.displayData(description: gyms[indexPath.row].description ?? "", title: gyms[indexPath.row].name ?? "", imagePath: gyms[indexPath.row].images![0])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }
}

// MARK: - Tabel View Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 238 + (gyms[indexPath.row].description?.height(withConstrainedWidth: tableView.frame.width, font: UIFont(name: "Gujarati Sangam MN", size: 16)!))!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - Private Functions
extension HomeViewController {
    
    private func configureCollectionView() {
        gymsTabelView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func callApi(page: Int, perPage: Int) {
        let queries: [Queries] = [
            Queries(key: "page", value: "\(page)"),
            Queries(key: "per_page", value: "\(perPage)")
        ]
        APIClient.getGyms(queries: queries) { (result) in
            switch result {
            case .success(let res):
                if res.code == 200 {
                    self.gyms = res.data?.items ?? []
                    self.gymsTabelView.reloadData()
                } else {
                    print("Error")
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
}
