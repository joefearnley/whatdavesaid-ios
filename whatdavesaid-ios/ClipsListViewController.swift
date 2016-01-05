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

class ClipsListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var clipsList: UITableView!
    
    var clips: [Clip] = []
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clips.append(Clip(fileName: "wheres-the-buffet", title: "Where's the Buffet?"))
        clips.append(Clip(fileName: "hot-damn", title: "Hot Damn"))
        clips.append(Clip(fileName: "pansy-immune-system", title: "Pansy Immune System"))
        clips.append(Clip(fileName: "upper-football", title: "Upper Football"))
        clips.append(Clip(fileName: "william-butterfield", title: "William Butterfield"))
        clips.append(Clip(fileName: "smooth-as-silk", title: "Smooth as Silk"))
        clips.append(Clip(fileName: "black-metal", title: "Black Metal"))
        clips.append(Clip(fileName: "large-can-of-beer", title: "Large Can of Beer"))
        clips.append(Clip(fileName: "bought-a-new-part", title: "Bought a New Part"))
        clips.append(Clip(fileName: "who-is-this", title: "Who is this?"))
        clips.append(Clip(fileName: "futons-instead-of-pews", title: "Futons Instead of Pews"))
        clips.append(Clip(fileName: "challenge-to-a-duel", title: "Challenge to a Dual"))
        clips.append(Clip(fileName: "hahaha", title: "Hahahaha"))
        clips.append(Clip(fileName: "where-you-going", title: "Where You Going?"))
        clips.append(Clip(fileName: "pessimistic", title: "Pessimistic"))
        clips.append(Clip(fileName: "clamy-feeling", title: "Clamy Feeling"))
        
        clipsList.dataSource = self
        clipsList.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clips.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let clip = self.clips[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel!.text = clip.title
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let clip = self.clips[indexPath.row]
        
        let path = NSBundle.mainBundle().pathForResource(clip.fileName, ofType: "mp3")
        let url = NSURL.fileURLWithPath(path!)
        
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOfURL: url)
            self.audioPlayer.play()
            
        } catch let error as NSError {
            print("AV Sound Error: \(error.localizedDescription)")
        }
    }
    
}