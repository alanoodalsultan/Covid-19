//
//  covidManager.swift
//  Covid-19-
//
//  Created by alanood on 20/04/1443 AH.
//

import UIKit
import SwiftUI

protocol CovidDelegate {
    func didUpdateDataforCovid(_ covidManager:CovidManager, covidData:[CovidModel])
    
}
struct CovidManager {
  
    var delegate: CovidDelegate?
    
    private let covidURL = "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST"
    
    
    func getCovidData(){
        guard let url = URL(string: covidURL)
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let data = data else {
                    return
                }

                if let covidData = parsjson(covidData: data){
                   print("covid Data after parsing \(covidData)")
                    self.delegate?.didUpdateDataforCovid(self, covidData: covidData)
                }
                
                
            }else{
            print(error!)
            }
                
        }.resume()
    }
    private func parsjson(covidData:Data) -> [CovidModel]? {
        var data:[CovidModel]?
        do {
        data = try JSONDecoder().decode([CovidModel].self, from: covidData)
        } catch {
            print(error)
        }
       return data
    }
    
}
 

