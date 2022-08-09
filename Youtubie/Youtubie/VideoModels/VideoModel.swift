//
//  VideoModel.swift
//  Youtubie
//
//  Created by Veer Singh on 8/9/22.
//

import Foundation
import Alamofire

class VideoModel: ObservableObject {
    @Published var videos = [Video]()
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        guard let url = URL(string: "\(Constants.API_URL)/playlistItems")
        else {
            return
        }
        
        let decorder = JSONDecoder()
        decorder.dateDecodingStrategy = .iso8601
        
        AF.request(
            url,
            parameters: ["part": "snippet", "playlistId": Constants.PLAYLIST_ID, "key": Constants.API_KEY]
        )
        .validate()
        .responseDecodable(of: Response.self, decoder: decorder) { response in
            switch response.result {
            case .success:
                break
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
            
            if let items = response.value?.items {
                DispatchQueue.main.async {
                    self.videos = items
                }
            }
        }
    }
}
