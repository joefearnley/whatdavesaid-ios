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
    
    var clips = [
        {
            filename: "wheres-the-buffet",
            title: "Where's the Buffet?"
        },{
            filename: "hot-damn",
            title: "Hot Damn"
        },{
            filename: "pansy-immune-system",
            title: "Pansy Immune System"
        },{
            filename: "upper-football",
            title: "Upper Football"
        },{
            filename: "william-butterfield",
            title: "William Butterfield"
        },{
            filename: "smooth-as-silk",
            title: "Smooth as Silk"
        },{
            filename: "black-metal",
            title: "Black Metal"
        },{
            filename: "large-can-of-beer",
            title: "Large Can of Beer"
        },{
            filename: "bought-a-new-part",
            title: "Bought a New Part"
        },{
            filename: "who-is-this",
            title: "Who is this?"
        },{
            filename: "futons-instead-of-pews",
            title: "Futons Instead of Pews"
        },{
            filename: "challenge-to-a-duel",
            title: "Challenge to a Dual"
        },{
            filename: "hahaha",
            title: "Hahahaha"
        },{
            filename: "where-you-going",
            title: "Where You Going?"
        },{
            filename: "pessimistic",
            title: "Pessimistic"
        },{
            filename: "clamy-feeling",
            title: "Clamy Feeling"
    }
    
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