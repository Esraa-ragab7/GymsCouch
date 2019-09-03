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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    var gyms: [Gym] = []
    var page = 1
    var perPage = 4
    var totalPages = 0
    var loadData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        callApi(page: page, perPage: perPage)
    }
    
    // MARK: - Prepare Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsViewController" {
            let destinationViewController = segue.destination as! GymDetailsViewController
            destinationViewController.gymDetailsViewModel = GymDetailsViewModel(gym: gyms[sender as! Int])
        }
    }
    
    // MARK: - Logout Action
    @IBAction func logOut(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "LogOut!", message: "Are You Sure?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "yes", style: .default, handler: { (action: UIAlertAction!) in
            UserDefaults.standard.set(false, forKey: "Login")
            AppDelegate.shared.rootViewController.switchToLogout()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "no", style: .cancel, handler: nil))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
}

// MARK: - Tabel Data Source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        gyms[indexPath.row].selectedImage = gyms[indexPath.row].images![indexPath.row%gyms[indexPath.row].images!.count]
        cell.displayData(description: gyms[indexPath.row].description ?? "", title: gyms[indexPath.row].name ?? "", imagePath: gyms[indexPath.row].selectedImage!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }
    
}

// MARK: - Scroll View Delegate
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        if deltaOffset <= 0 {
            if !loadData {
                if page < totalPages {
                    loadData = true
                    page = page + 1
                    callApi(page: page, perPage: perPage)
                }
            }
        }
    }
}

// MARK: - Tabel View Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 238 + (gyms[indexPath.row].description?.height(withConstrainedWidth: tableView.frame.width, font: UIFont(name: "Gujarati Sangam MN", size: 16)!))!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailsViewController", sender: indexPath.row)
    }
}

// MARK: - Private Functions
extension HomeViewController {
    
    private func configureCollectionView() {
        gymsTabelView.tableFooterView = UIView()
        gymsTabelView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func callApi(page: Int, perPage: Int) {
        let queries: [Queries] = [
            Queries(key: "page", value: "\(page)"),
            Queries(key: "per_page", value: "\(perPage)")
        ]
        beginLoading()
        APIClient.getGyms(queries: queries) { (result) in
            switch result {
            case .success(let res):
                if res.code == 200 {
                    self.gyms.append(contentsOf: res.data?.items ?? [])
                    self.totalPages = res.data?.totalPages ?? 0
                    self.gymsTabelView.reloadData()
                    self.stopLoading()
                } else {
                    self.stopLoading()
                }
            case .failure(_):
                self.stopLoading()
            }
        }
    }
    
    private func beginLoading() {
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false
        loadData = true
    }
    
    private func stopLoading() {
        loadingIndicator.stopAnimating()
        loadData = false
    }
    
}
