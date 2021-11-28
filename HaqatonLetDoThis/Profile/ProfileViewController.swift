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
    
    @IBAction func segmentDidChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            currentCell = 0
            tickersTableView.reloadData()
            tickersTableView.rowHeight = 100
        case 1:
            currentCell = 1
            tickersTableView.rowHeight = 200//UITableView().estimatedRowHeight
            tickersTableView.reloadData()
        case 2:
            currentCell = 2
            tickersTableView.rowHeight = UITableView().estimatedRowHeight
            tickersTableView.reloadData()
        default:
            break
        }
    }
    
    var currentCell = 0
    
    let userStatus = UserDefaults()
    let userIDDescriptor = "identificator"
    let userStatusDescriptor = "status"
    
    var user: ProfileModel?
    
    init(identifire: String) {
        
        super.init(nibName: nil, bundle: nil)
        
        userStatus.set(identifire, forKey: userIDDescriptor)
        userStatus.set(true, forKey: userStatusDescriptor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tickersTableView.register(TickerTableViewCell.self, forCellReuseIdentifier: TickerTableViewCell.id)
        tickersTableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.id)
        tickersTableView.register(SubscribesTableViewCell.self, forCellReuseIdentifier: SubscribesTableViewCell.id)
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
        
        if currentCell == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TickerTableViewCell.id) as? TickerTableViewCell else { return UITableViewCell()}
            
            cell.tickerName.text = tickersArray[indexPath.row].name
            cell.tickerCode.text = tickersArray[indexPath.row].code
            
            cell.tickerImage.image = tickersArray[indexPath.row].image
            
            return cell
        }
        else if currentCell == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.id) as? PostsTableViewCell else { return UITableViewCell()}
            
            
            cell.body.text = "wdqkwdpoqw[mdqwodwqodmqwdnqwpodiqndpidnpowqndpqwndqwdpqwdnnqoinwpdiqn"
            cell.hashtag.text = "#AAPL"
            cell.avatar.image = UIImage(named: "Avatar")!
            cell.name.text = "Peter Petrov"
            cell.date.text = "21.02.2020"
            
            return cell
        }
        else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SubscribesTableViewCell.id) as? SubscribesTableViewCell else { return UITableViewCell()}
            
            cell.tickerName.text = "SAS"
            cell.tickerCode.text = tickersArray[indexPath.row].code
            
            cell.tickerImage.image = tickersArray[indexPath.row].image
            
            return cell
        }
    }
}
