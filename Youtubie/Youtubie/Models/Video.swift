//
//  Video.swift
//  Youtubie
//
//  Created by Veer Singh on 8/9/22.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var publishedDate = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet
        
        case title
        case description
        case publishedDate = "publishedAt"
        
        case thumbnails
        case thumbnail = "url"
        case high
        
        case resourceId
        case videoId
    }
    
    init() {
        self.videoId = "123456789"
        self.title = "Init Video Title"
        self.description = "Init video description. Used as place holder for init. Should not be shown in production. Only to be used as initilization or Video."
        self.thumbnail = "https://i.ytimg.com/vi/9O5PhuW927w/hqdefault.jpg"
        self.publishedDate = Date()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.publishedDate = try snippetContainer.decode(Date.self, forKey: .publishedDate)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
