//
//  ContentView.swift
//  NetworkDemo
//
//  Created by xiaoyouxinqing on 4/21/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text(text).font(.title)
            
            Button(action: {
                self.startLoad()
            }) {
                Text("Start").font(.largeTitle)
            }
            
            Button(action: {
                self.text = ""
            }) {
                Text("Clear").font(.largeTitle)
            }
        }
    }
    
    func startLoad() {
        NetworkAPI.hotPostList { result in
            switch result {
            case let .success(list): self.updateText("Post count \(list.list.count)")
            case let .failure(error): self.updateText(error.localizedDescription)
            }
        }
    }
    
    func updateText(_ text: String) {
        self.text = text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
