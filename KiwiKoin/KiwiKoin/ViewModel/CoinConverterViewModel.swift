//
//  CoinConverterViewModel.swift
//  KiwiKoin
//
//  Created by Anderson Moura on 23/02/24.
//

import Foundation

class CoinConverterViewModel {
    public func getCoins(params:String, onCompletion: @escaping (ExchangeCoins?, String?) -> Void) {
        WebService().getCoins(pathParam: params) { (data, error) in
            if let coins = data {
                onCompletion(coins, nil)
            } else {
                onCompletion(nil,error)
            }
        }
    }
    
    public func calculateCoins(valueInfo:String, valueCoin:String) -> String {
        let value:Float = Float(valueInfo)!
        let coin:Float = Float(valueCoin)!
        
        let calc:Float = coin * value
        
        let calcStr:String = String(calc)
        
        return calcStr
        
    }
    
    public func getListCoins() -> [String] {
        return EnumCoins.allCases.map {$0.rawValue}
    }
}
