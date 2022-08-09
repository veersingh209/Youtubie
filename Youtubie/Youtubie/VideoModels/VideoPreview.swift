//
//  VideoPreview.swift
//  Youtubie
//
//  Created by Veer Singh on 8/9/22.
//

import Foundation
import Alamofire
import SwiftUI

class VideoPreview: ObservableObject {
    @Published var thumbnailData = Data()
    @Published var title: String
    @Published var date: String
    
    var video: Video
    init(video: Video) {
        self.video = video
        
        self.title = video.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.date = df.string(from: video.publishedDate)
        
        guard video.thumbnail != "" else {return}
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            thumbnailData = cachedData
            return
        }
        
        guard let url = URL(string: video.thumbnail) else {return}
        AF.request(url).validate().responseData { response in
            if let data = response.data {
                CacheManager.setVideoCache(video.thumbnail, data)
                DispatchQueue.main.async {
                    self.thumbnailData = data
                }
            }
        }
        
    }
}
