//
//  String+Extension.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 24.10.2023.
//

import Foundation

extension String {
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self) ?? Date()
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
}
