//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "8F27EEDB-9BF2-46F4-A4CF-282D35F1375B"
   // let rate = 0.0
    
    
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String)  {
        
        //MARK: - Create urlString
        let urlString = baseURL + "/" + currency + "?apikey=" + apiKey
        //MARK: - Create URL
        if  let url = URL(string: urlString) {
            //MARK: - Create session
            let session = URLSession(configuration: .default)
            //MARK: - Create task
            let task = session.dataTask(with: url) { (data, rasponce, error) in
                if let safeData = data {
                  //  let dataString  = String(data: data, encoding: .utf8)
                   // print(dataString)
                    self.parseJSON(safeData)
                   // print(parseJSON(safeData))
                    
                }
            }
            //MARK: - Start task
            task.resume()
            }
    }
    
    func parseJSON(_ data: Data)  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
           let lastRoundPriceString =  String(format: "%.2f", lastPrice)
            print(lastRoundPriceString)
         //   return lastPrice
        } catch {
            print(error)
          //  return nil
        }
        
    }
    
    
    
}
