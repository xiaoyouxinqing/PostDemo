//
//  WebImageExample.swift
//  WebImageDemo
//
//  Created by xiaoyouxinqing on 5/20/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct WebImageExample: View {
    let url: URL?
    
    var body: some View {
        WebImage(url: url)
            .placeholder { Color.gray }
            .resizable()
            .onSuccess(perform: { _, _, _ in
                print("Success")
                SDWebImageManager.shared.imageCache.clear(with: .all, completion: nil)
            })
            .onFailure(perform: { _ in
                print("Failure")
            })
            .scaledToFill()
            .frame(height: 600)
            .clipped()
    }
}
