//
//  APIHandler.swift
//  NYTimesAPI
//
//  Created by Munro Azumi on 10/15/21.
//

import Foundation

class APIHandler {
    
    static let shared = APIHandler.init()
    typealias Completion = ((ArticleResult?, Error?) -> ())?
    
    //private init(){}
    
    func get(url: URL, completionHandler: Completion) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
                let decoder = JSONDecoder()
                //decoder.dateDecodingStrategy = .iso8601
            
            let jsonResponse = try? decoder.decode(ArticleResult.self, from: data!)
            completionHandler?(jsonResponse, error)
            
        } .resume()
    }
    
}
