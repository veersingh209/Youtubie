//
//  CacheManager.swift
//  Youtubie
//
//  Created by Veer Singh on 8/9/22.
//

import Foundation

class CacheManager {
    static var cache = [String : Data]()
    
    static func setVideoCache(_ url : String, _ data : Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
