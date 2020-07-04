

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewmodel!
    
    var colorArray = [UIColor]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 100 / 255, green: 57 / 255, blue: 20 / 255, alpha: 1.0),
            UIColor(red: 15 / 255, green: 45 / 255, blue: 70 / 255, alpha: 1.0),
            UIColor(red: 25 / 255, green: 60 / 255, blue: 120 / 255, alpha: 1.0),
            UIColor(red: 50 / 255, green: 20 / 255, blue: 150 / 255, alpha: 1.0),
            UIColor(red: 30 / 255, green: 35 / 255, blue: 180 / 255, alpha: 1.0),
            UIColor(red: 80 / 255, green: 39 / 255, blue: 125 / 255, alpha: 1.0)
            
            
        ]
        
        
        getData()


    }
    
    func getData(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataset/master/crypto.json")!
        
        
        webService().downloadcurrency(url: url) { (cryptos) in
            
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewmodel(cryptoCurrencyList: cryptos)
                
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
                
                
            }
            
            
        }
    
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        
        cell.currencyText.text = cryptoViewModel.name
        
        cell.priceText.text = cryptoViewModel.price
        
        cell.backgroundColor = colorArray[indexPath.row % 6]
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
        
    }
    


}

