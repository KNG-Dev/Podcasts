//
//  PodcastCell.swift
//  Podcasts
//
//  Created by Kenny Ho on 7/4/18.
//  Copyright © 2018 Kenny Ho. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel! 
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else { return }
            
//            URLSession.shared.dataTask(with: url) { (data, _, _) in
//                print("Finished downloading image data", data)
//                //you do this because data ^ is optional can self.podcastImageView.image is looking for non optional data
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    self.podcastImageView.image = UIImage(data: data)
//
//                }
//
//            }.resume()
            
            //using SDWebImage caches images. handles the top portion of code with 1 line
            podcastImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    
}
