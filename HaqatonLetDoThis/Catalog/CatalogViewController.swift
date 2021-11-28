//
//  CatalogViewController.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation
import UIKit
class CatalogViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    var tickers = Ticker()
    var tickersInfo = TickerInfo()
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Enter Ticker"
        searchBar.delegate = self
        return searchBar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.backgroundColor = .secondarySystemBackground
        setupNavigationBar()
        collectionView.backgroundColor = .white
        collectionView.register(CatalogViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tickers.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        return CGSize(width: width, height: 40)
    }
    override func viewWillAppear(_ animated: Bool) {
        searchBar.isHidden = false
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tickerProfileController = TickerProfileController()
        tickerProfileController.tickerName = tickers[indexPath.item].symbol
        navigationController?.pushViewController(tickerProfileController, animated: false)
        searchBar.isHidden = true
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatalogViewCell
        cell.ticker = tickers[indexPath.item]
     
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let fetchData = FetchData()
        if searchText.isEmpty {
            fetchData.fetchData(searcText: "") { ticker in
                DispatchQueue.main.async {
                    self.tickers = ticker
                    self.collectionView.reloadData()
                    print(self.tickers)
                }
            }
        } else {
            fetchData.fetchData(searcText: searchText) { ticker in
                DispatchQueue.main.async {
                    self.tickers = ticker
                    self.collectionView.reloadData()
                    print(self.tickers)
                }
            }
        }
        self.collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    fileprivate func setupNavigationBar() {
        guard let bar = navigationController?.navigationBar else {return}
        bar.addSubview(searchBar)
        searchBar.constraints(top: bar.topAnchor, bottom: bar.bottomAnchor, left: bar.leftAnchor, right: bar.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingleft: 8, paddingRight: 8, width: 0, height: 0)
    }
}
