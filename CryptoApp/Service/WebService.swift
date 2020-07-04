

import Foundation


class webService {
    
    
    func downloadcurrency (url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
                
                
                let cryptolist = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptolist)
                
               
                
                if let cryptoList = cryptolist {
                    
                     completion(cryptolist)
                    
                    
                }
                
            }
            
            
        }.resume()
        
        
        
        
    }
    
    
}
