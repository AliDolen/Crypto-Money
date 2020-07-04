

import Foundation


struct CryptoListViewmodel {
    
    
    
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection () -> Int {
        
        return cryptoCurrencyList.count
        
    }
    func cryptoAtIndex(index: Int) -> cryptoviewModel{
        
        let crypto  = self.cryptoCurrencyList[index]
        
        return cryptoviewModel(cryptoCurrency: crypto)
        
        
        
    }
    
   
}

struct cryptoviewModel {
    
    
    let cryptoCurrency : CryptoCurrency
    
    
    var name : String {
        
        
        return cryptoCurrency.currency
        
    }
    
    var price : String {
        
        return cryptoCurrency.price
        
        
    }
    
}
