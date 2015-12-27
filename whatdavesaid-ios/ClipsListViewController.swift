//
//  ClipsListViewController.swift
//  whatdavesaid-ios
//
//  Created by Joe Fearnley on 12/27/15.
//  Copyright © 2015 Joe Fearnley. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ClipsListViewController : UIViewController {
    
    @IBOutlet weak var clipsList: UITableView!
    
    var clips = []
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clips.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var sound = self.clips[indexPath.row]
        var cell = UITableViewCell()
        cell.textLabel!.text = sound.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var path = NSBundle.mainBundle().pathForResource("black-metal", ofType: "mp3")
        var url = NSURL.fileURLWithPath(path!)
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOfURL: url)
            self.audioPlayer.play()
            
        } catch let error as NSError {
            print("AV Sound Error: \(error.localizedDescription)")
        }
    }
    
}