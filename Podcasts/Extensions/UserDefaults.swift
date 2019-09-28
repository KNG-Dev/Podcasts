//
//  UserDefaults.swift
//  Podcasts
//
//  Created by Kenny Ho on 7/29/18.
//  Copyright © 2018 Kenny Ho. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let favoritedPodcastKey = "favoritedPodcastKey"
    static let downloadedEpisodesKey = "downloadedEpisodesKey"
    
    func deleteEpisode(episode: Episode) {
        let savedEpisodes = downloadedEpisodes()
        let filterEpisodes = savedEpisodes.filter { (e) -> Bool in
            return e.title != episode.title
        }
        
        do {
            
            let data = try JSONEncoder().encode(filterEpisodes)
            UserDefaults.standard.set(data, forKey: UserDefaults.downloadedEpisodesKey)
            
        } catch let encodeErr {
            print("Failed to encode episode:", encodeErr)
        }
    }
    
    func downloadEpisode(episode: Episode) {
        
        do {
            var episodes = downloadedEpisodes()
            if episodes.isEmpty {
                episodes.append(episode)
            } else {
                if !episodes.contains(where: { $0.title == episode.title && $0.author == episode.author}) {
                    episodes.insert(episode, at: 0)
                }
            }
            let data = try JSONEncoder().encode(episodes)
            UserDefaults.standard.set(data, forKey: UserDefaults.downloadedEpisodesKey)
            
        } catch let encodeErr {
            print("Failed to encode episode:", encodeErr)
            
        }
    }
    
    func downloadedEpisodes() -> [Episode] {
        guard let episodesData = data(forKey: UserDefaults.downloadedEpisodesKey) else { return [] }
        
        do {
            let episodes = try JSONDecoder().decode([Episode].self, from: episodesData)
            return episodes
            
        } catch let decodeErr {
            print("Failed to decode:", decodeErr)
        }
        
        return []
    }
    
    func savedPodcasts() -> [Podcast] {
        //fetch our saved podcast first
        //if you are unable to perform unwrap, just return empty array
        guard let savedPodcastData = UserDefaults.standard.data(forKey:
            UserDefaults.favoritedPodcastKey) else { return [] }
        guard let savedPodcasts = NSKeyedUnarchiver.unarchiveObject(with: savedPodcastData) as? [Podcast] else { return [] }
        return savedPodcasts
    }
    
    func deletePodcast(podcast: Podcast) {
        let podcasts = savedPodcasts()
        let filteredPodcasts = podcasts.filter { (p) -> Bool in
            return p.trackName != podcast.trackName || (p.trackName == podcast.trackName && p.artistName != podcast.artistName)
        }
        
        let data = NSKeyedArchiver.archivedData(withRootObject: filteredPodcasts)
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedPodcastKey)
    }
}

