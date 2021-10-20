//
//  Article.swift
//  NYTimesAPI
//
//  Created by Munro Azumi on 10/15/21.
//

import Foundation

struct ArticleResult: Codable {
    let results: [Article]
}

struct Article: Codable {
    let title: String
    let byline: String
    let published_date: String
    let url: String
}
