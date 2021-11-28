//
//  ProfileViewController.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tickersTableView: UITableView!
    @IBOutlet weak var rating: UIButton!
    @IBOutlet weak var name: UILabel!
    
    var user: ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tickersTableView.register(TickerTableViewCell.self, forCellReuseIdentifier: TickerTableViewCell.id)
        tickersTableView.dataSource = self
        tickersTableView.tableFooterView = UIView()
        
        tickersTableView.rowHeight = 100
        tickersTableView.separatorStyle = .none
        
        FetchProfile.shared.fetchProfile { result in
            
            switch result{
            case .success(let model):
                
                DispatchQueue.main.async {
                    self.user = model
                    self.updateUser()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func updateUser(){
        
        rating.setTitle("Рейтинг" + "\(user?.rating ?? 0)", for: .normal)
        name.text = user?.username ?? ""
    }
}

extension ProfileViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tickersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TickerTableViewCell.id) as? TickerTableViewCell else { return UITableViewCell()}
        
        cell.tickerName.text = tickersArray[indexPath.row].name
        cell.tickerCode.text = tickersArray[indexPath.row].code
        
        cell.tickerImage.image = tickersArray[indexPath.row].image
        
        return cell
    }
    
    
}
