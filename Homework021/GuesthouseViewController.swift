//
//  GuesthouseViewController.swift
//  Homework021
//
//  Created by Chun-Yi Lin on 2021/12/21.
//

import UIKit
import Kingfisher

class GuesthouseViewController: UIViewController {
    
    var items = [GuesthouseInfo]()
    
    @IBOutlet weak var guesthouseTableView: UITableView!
    
    @IBOutlet weak var mainActivityIndicatorView: UIActivityIndicatorView!
    
    @IBSegueAction func guesthouseSegue(_ coder: NSCoder) -> GuesthouseDetailViewController? {
        
        if let row = guesthouseTableView.indexPathForSelectedRow?.row{
            return GuesthouseDetailViewController(coder: coder, guesthouseInfo: items[row])
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchItems()
    }
    
    func fetchItems(){
    
        let urlString = "https://data.coa.gov.tw/OpenData/Service/OpenData/ODwsv/ODwsvTravelStay.aspx"
        
        let child = SpinnerViewController()
        let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        mainActivityIndicatorView.transform = transfrom
        mainActivityIndicatorView.startAnimating()
        
        //測試有沒有網址
        if let url = URL(string: urlString)
        {
            //加入屏幕
            addChild(child)
            child.view.frame = view.frame
            view.addSubview(child.view)
            child.didMove(toParent: self)
            
            URLSession.shared.dataTask(with: url) {data, response, error in
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let guesthouseInfo = try decoder.decode([GuesthouseInfo].self, from: data)
                        self.items = guesthouseInfo
                        DispatchQueue.main.async {
                            self.guesthouseTableView.reloadData()
                            
                            //移除 UIActivityIndicatorView 與屏幕
                            child.willMove(toParent: nil)
                            child.view.removeFromSuperview()
                            child.removeFromParent()
                            self.mainActivityIndicatorView.removeFromSuperview()
                        }
                    } catch {
                    }
                } 
                
            }.resume()
        }
    }
}

extension GuesthouseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = guesthouseTableView.dequeueReusableCell(withIdentifier: "\(GuesthouseTableViewCell.self)", for: indexPath) as? GuesthouseTableViewCell
        else {return UITableViewCell()}
        
        let item = items[indexPath.row]
        cell.guesthouseImageView.kf.setImage(with: URL(string: item.Photo ?? ""))
        cell.cityLabel.text = item.City
        cell.townLabel.text = item.Town
        cell.nameLabel.text = item.Name
        cell.hostWordsLabel.text = item.HostWords
        
        return cell
    }
}




