//
//  model.swift
//  Covid-19-
//
//  Created by alanood on 20/04/1443 AH.
//

import UIKit


struct CovidModel: Decodable {
    let infected: Int?
    let tested: StringOrInt?
    let recovered: StringOrInt?
    let deceased: StringOrInt?
    let country: String
    let lastUpdatedApify: String
}

enum StringOrInt: Decodable {
    
    case string(String)
    case int(Int)
    
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw Error.couldNotFindStringOrInt
    }
    func get() -> String {
        switch self {
        case .int(let num):
            return String(num)
        case .string(let num):
            return num
        }
    }
    enum Error: Swift.Error {
        case couldNotFindStringOrInt
    }
}
