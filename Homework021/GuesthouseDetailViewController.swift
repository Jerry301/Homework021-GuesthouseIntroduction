//
//  GuesthouseDetailViewController.swift
//  Homework021
//
//  Created by Chun-Yi Lin on 2021/12/22.
//

import UIKit
import MapKit
import CoreMedia

class GuesthouseDetailViewController: UIViewController {
    
    let guesthouseInfo : GuesthouseInfo
    
    @IBOutlet weak var detailMKView: MKMapView!
    @IBOutlet weak var nameDetailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    init?(coder: NSCoder, guesthouseInfo: GuesthouseInfo) {
        self.guesthouseInfo = guesthouseInfo
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        nameDetailLabel.text = guesthouseInfo.Name
        addressLabel.text = guesthouseInfo.Address
        phoneLabel.text = guesthouseInfo.Tel
        descriptionLabel.text = guesthouseInfo.HostWords
        
        //地圖位址資料
        detailMKView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(guesthouseInfo.Latitude)!, longitude: Double(guesthouseInfo.Longitude)!), latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        //地圖標點資料
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: Double(guesthouseInfo.Latitude)!, longitude: Double(guesthouseInfo.Longitude)!)
        point.title = guesthouseInfo.Name
        detailMKView.addAnnotation(point)
        UserDefaults.standard.set("zh", forKey: "AppleLanguages")
        
    }
}
