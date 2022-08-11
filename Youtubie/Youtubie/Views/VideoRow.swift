//
//  VideoRow.swift
//  Youtubie
//
//  Created by Veer Singh on 8/9/22.
//

import SwiftUI

struct VideoRow: View {
    @ObservedObject var videoPreview: VideoPreview
    @State private var isShowing = false
    var body: some View {
        Button(action: {}) {
            isShowing = true
            VStack(alignment: .leading, spacing: 10) {
                GeometryReader { geometry in
                    Image(uiImage: daraa )
                }
                
            }
        }
        .sheet(isPresented: $isShowing, content: {
            VideoDetail(video: VideoPreview.video)
        })
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow()
    }
}
