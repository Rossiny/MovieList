//
//  APIClient.swift
//  MovieList
//
//  Created by Rossiny Amaral on 03/04/19.
//  Copyright © 2019 Rossiny. All rights reserved.
//

import Foundation
import Alamofire


typealias MoviesJSON = [String: Any]

class APIClient {
    
    static func getMoviesAPI(completion: @escaping (MoviesJSON?) -> Void) {
        
        let url = URL(string: "https://sky-exercise.herokuapp.com/api/Movies")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? MoviesJSON
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    static func getMoviesAPI2(completion: @escaping (MoviesJSON?) -> Void) {
        Alamofire.request("https://sky-exercise.herokuapp.com/api/Movies")
            .response { response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200, 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                
                guard let _ = response.data else { return }
                
                //to get JSON return value
                if let result = response.data {
                    //let json = IXON(data: result)
                    let decoder = JSONDecoder()
                    
                    //using the array to put values
                    let mvs = try! decoder.decode([Movie].self, from: result)
                    //print(responseJSON)
                    //print(json)
                }
                            
        }
    }
    
    
}
