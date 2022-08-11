//
//  VideoPlayer.swift
//  Youtubie
//
//  Created by Veer Singh on 8/9/22.
//

import SwiftUI
import WebKit
struct VideoPlayer: UIViewRepresentable {
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        let view = WKWebView()
        
        let embedUrlStrign = Constants.YOUTUBE_EMBED_URL + video.videoId
        let url = URL(string: embedUrlStrign)
        
        let request = URLRequest(url: url!)
        view.load(request)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer(video: Video())
    }
}
