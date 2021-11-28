//
//  FetchProfile.swift
//  HacatonStocksChatApp
//
//  Created by Садык Мусаев on 27.11.2021.
//

import Foundation


class FetchProfile{
    
    //singleton
    public static let shared = FetchProfile()
    private init(){}
    
    private let url = URL(string: "https://inv-soc-network.herokuapp.com/api/user/5")!
    
    //let urlConnection = NSURLConnection(request: request, delegate: self)
    
    func fetchProfile(complition: @escaping (Result<ProfileModel, URLError>)->()){
        
        var request = URLRequest(url: url)
        
        let username = "DWAdmin"
        let password = "12345"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in

            guard error == nil else {
                print(error!)
                complition(.failure(URLError.init( .unknown)))
                return
            }
            
            //print((response as? HTTPURLResponse))
            
            guard let data = data else {
                print("Data is empty")
                complition(.failure(URLError.init( .unknown)))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let result = try decoder.decode(ProfileModel.self, from: data)
                complition(.success(result))
                
            } catch {
                print("Decoding error")
                complition(.failure(URLError.init( .cannotParseResponse)))
            }
        }.resume()
    }
}
