//
//  ProjectsCollectionViewController.swift
//  Portfilio
//
//  Created by 朱莎 on 9/7/21.
//

import UIKit



class ProjectsCollectionViewController: UICollectionViewController {
    
    let CELL_IMAGE = "imageCell"
    let imageListPath = ["1","2","3","4"]
    var projects: [Project] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProject()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        

        // Do any additional setup after loading the view.
        
    }
    
    func loadProject(){
        projects.append(Project(name: "DiscoverMelb", imageName: "1",imageName2: "d2", imageName3: "d3", videoName:"discover", intro:"This iOS application is a location-aware application to serve as an aid for tourists interested in Melbourne City’s historical sights. \n Features: \n - Check historical sights information on the map. \n - Create your own sights. \n - Send notification to you when you enter within the proximity of an attraction. ", tech: "- Map View \n- Image capture & storage  \n- Notification \n- Persistent storage", icon: "120"))
        projects.append(Project(name: "O MA GARDEN", imageName: "2",imageName2: "o2", imageName3: "o3",videoName:"garden",intro:"This iOS application is to guide the users for information on horticulture of fruits and vegetables in their garden, and diagnose plants' health through the leaf photos. \n Features: \n - Display your location's weather. \n - Track plants' growth progress. \n - Advises on the season recommended for planting. \n - Diagnose plant's health through a photo of a plant's leaf uploaded. \n - Display nearby markets and their routes.", tech: "- Web services\n- Image Capture\n- TableView\n- Progress bar \n- Notification \n- Map view", icon: "180"))
        projects.append(Project(name: "Greens-Caretaker-Auto-Irrigation", imageName: "3",imageName2: "i2", imageName3: "i3",videoName:"green",intro:"Auto irrigation is to ensure the soil moisture is maintained within low and high limits range. The Caretaker unit will irrigate when the soil moisture is lower than the low limit, but will not irrigate when higher than the high limit, or the user can choose to water immediatedly. When the ambient light brightness is lower than the brightness limit, light can be auto turned on by settings.\n Features:\n - Display plant soil moisture and sunlight status.\n - Auto irrigation and provide light based on your plan (set soil moisture low/high limit, brightness low limit).\n - Check plant's situation by taking a photo. \n - Send notification when the moisture is low.", tech: "- Raspberry Pi \n- Sensors: Soil moisture detector sensor, light sensor, camera, water pump, light. \n- Firebase \n- Realm framework", icon: "114"))
        projects.append(Project(name: "Pelikin", imageName: "4",imageName2: "p2", imageName3: "p3",videoName: "pelikin",intro:"Pelikin is a travel card built to help young travellers do epic things around the world.\n Features:\n- Spend in over 150 countries using your Pelikin card \n- Hold and swap 5 currencies in the app- Send, receive and request money from friends instantly and for free \n- Track your spend and balance with instant push notifications \n- Create your own @handle to send money and talk to your friends \n- Freeze/Unfreeze your card instantly", tech: "- Reusable components\n- HTML, CSS\n- React navigation 5\n- Web API", icon: "p"))
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue" {
            let detailVC = segue.destination as! DetailViewController
            if let indextPath = collectionView.indexPathsForSelectedItems?.first{
                detailVC.project = projects[indextPath.row]
            }
        }
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let project = projects[indexPath.item]
////        let detailVC = self.storyboard?.instantiateViewController(identifier: "detailSegue") as! DetailViewController
////        detailVC.project = project
////        self.navigationController?.pushViewController(detailVC, animated: false)
//        performSegue(withIdentifier: "detailSegue", sender: nil)
//
//    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return projects.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IMAGE, for: indexPath) as! ProjectCollectionViewCell
    
        cell.imageView.image = UIImage(named: projects[indexPath.row].imageName)
        cell.imageView2.image = UIImage(named: projects[indexPath.row].imageName2)
        cell.imageView3.image = UIImage(named: projects[indexPath.row].imageName3)
        cell.iconImageView.image = UIImage(named: projects[indexPath.row].icon)
        cell.title.text = projects[indexPath.row].name
        cell.imageView.layer.cornerRadius = 20
        cell.imageView2.layer.cornerRadius = 20
        cell.imageView3.layer.cornerRadius = 20
        cell.iconImageView.layer.cornerRadius = 10
        //cell.layer.cornerRadius = 30
       
        
        cell.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
            //UIColor(red: 0.98, green: 0.97, blue: 0.96, alpha: 1.00)
        
        
        

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
