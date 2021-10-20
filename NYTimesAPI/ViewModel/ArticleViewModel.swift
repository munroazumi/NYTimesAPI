//
//  ArticleViewModel.swift
//  NYTimesAPI
//
//  Created by Munro Azumi on 10/15/21.
//

import Foundation

class ArticleViewModel {
    
    typealias Completion = (() -> ())?
    
    private var arrayResponseResult: ArticleResult?
    private var arrayResponse = [Article]()
    private var error: Error?
    
    func get(completionHandler: Completion) {
        APIHandler.shared.get(url: URL.init(string: Constant.NYTIMES_URL.rawValue)!) { response, err in
                self.arrayResponseResult = response
                self.arrayResponse = self.arrayResponseResult?.results ?? [Article]()
                self.error = err
                completionHandler?()
        }
    }
    
    func getArray() -> [Article] {
        return arrayResponse
    }
    
    func getRowCount() -> Int {
        return arrayResponse.count
    }
    
    func getTitle(index: Int) -> String {
        return arrayResponse[index].title
    }
    
    func getByline(index: Int) -> String {
        return arrayResponse[index].byline
    }
    
    func getPublishedDate(index: Int) -> String {
        return arrayResponse[index].published_date
    }
    
    func getError() -> Error? {
        return error
    }
}
