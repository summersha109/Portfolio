//
//  DetailViewController.swift
//  Portfilio
//
//  Created by 朱莎 on 9/7/21.
//

import UIKit
import AVFoundation
import AVKit

class DetailViewController: UIViewController {
    
    var project: Project?
    
    var videoPlayer: AVPlayer?
    var videoPlayerViewController: AVPlayerViewController?
    var videoName: String?

    @IBOutlet weak var introdTextView: UITextView!
    
    @IBOutlet weak var techTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let project = project {
            navigationItem.title = project.name
            videoName = project.videoName
            introdTextView.text = project.intro
            techTextView.text = project.tech
            
        }
        
        if let videoURL = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            
            videoPlayer = AVPlayer(url: videoURL)
            
            videoPlayer?.play()
            
            videoPlayerViewController = AVPlayerViewController()
            
            guard let videoPlayerViewController = videoPlayerViewController else {
                print("Video Player VC couldn't be created.")
                return
            }
            videoPlayerViewController.player = videoPlayer
            videoPlayerViewController.view.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
            videoPlayerViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(videoPlayerViewController.view)
            addChild(videoPlayerViewController)

            NSLayoutConstraint.activate([
                videoPlayerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
                videoPlayerViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
                videoPlayerViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
                videoPlayerViewController.view.widthAnchor.constraint(equalTo: videoPlayerViewController.view.heightAnchor, constant: 0)
            ])
            
        }

        // Do any additional setup after loading the view.
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
