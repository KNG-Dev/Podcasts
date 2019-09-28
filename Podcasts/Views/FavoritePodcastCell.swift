//
//  FavoritePodcastCell.swift
//  Podcasts
//
//  Created by Kenny Ho on 7/20/18.
//  Copyright © 2018 Kenny Ho. All rights reserved.
//

import UIKit

class FavoritePodcastCell: UICollectionViewCell {
    
    var podcast: Podcast! {
        didSet {
            nameLbl.text = podcast.trackName
            artistNameLbl.text = podcast.artistName
            
            let url = URL(string: podcast.artworkUrl600 ?? "")
            imageView.sd_setImage(with: url)
        }
    }
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "appicon"))
    let nameLbl = UILabel()
    let artistNameLbl = UILabel()
    
    fileprivate func stylizeUI() {
        nameLbl.text = "Podcast Name"
        nameLbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        artistNameLbl.text = "Artist Name"
        artistNameLbl.font = UIFont.systemFont(ofSize: 14)
        artistNameLbl.textColor = .lightGray
    }
    
    fileprivate func setupViews() {
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLbl, artistNameLbl])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stylizeUI()
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
