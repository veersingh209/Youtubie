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
    @State private var imageHeight: CGFloat = 0
    var body: some View {
        Button(action: {
            isShowing = true
        }) {
            VStack(alignment: .leading, spacing: 10) {
                GeometryReader { geometry in
                    Image(uiImage: UIImage(data: videoPreview.thumbnailData) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.width * 9/16)
                        .clipped()
                        .onAppear {
                            imageHeight = geometry.size.width * 9/16
                        }
                }
                .frame(height: imageHeight)
                
                Text(videoPreview.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Text(videoPreview.date)
                    .foregroundColor(.gray)
            }
            .font(.system(size: 19))
        }
        .sheet(isPresented: $isShowing, content: {
            VideoDetail(video: videoPreview.video)
        })
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(videoPreview: VideoPreview(video: Video()))
    }
}
