//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var coinManager = CoinManager()
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate  = self
        
       
        //let urlString = (coinManager.baseURL + "/()" + coinManager.apiKey)
    //    let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=8F27EEDB-9BF2-46F4-A4CF-282D35F1375B"
      //  let urlStrinTwo = coinManager.baseURL + "/" +  + coinManager.apiKey
       
       // print(urlString)
       
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(coinManager.currencyArray[row])
        let selectedCurency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurency)
        
      //  bitcoinLabel.text = coinManager.getCoinPrice(for: selectedCurency)
        
    }

//    func performRequest(with: urlString: String) {
//
//    }
    
}

extension ViewController: CoinManagerDelagate {
    func updataInterface(_: CoinManager, currency: String, with finalPrice: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = finalPrice
            self.currencyLabel.text = currency
    }
    
   
        
    }
    
    
    
    
    
}
