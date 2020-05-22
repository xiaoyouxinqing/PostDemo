//
//  SimpleExample.swift
//  WebImageDemo
//
//  Created by xiaoyouxinqing on 5/20/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

struct SimpleExample: View {
    let url: URL?
    
    @State private var data: Data?
    
    private var image: UIImage? {
        if let data = self.data { return UIImage(data: data) }
        return nil
    }
    
    var body: some View {
        let image = self.image
        return Group {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFill()
            } else {
                Color.gray
            }
        }
        .frame(height: 600)
        .clipped()
        .onAppear {
            if let url = self.url, self.data == nil {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.data = data
                    }
                }
            }
        }
    }
}
