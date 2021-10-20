//
//  UsefulExtensions.swift
//  NYTimesAPI
//
//  Created by Munro Azumi on 10/15/21.
//

import Foundation

extension String {
    func convertToDate(current: String, convertTo: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = current
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        dateFormatter.dateFormat = convertTo
        return dateFormatter.string(from: date)
    }
}
