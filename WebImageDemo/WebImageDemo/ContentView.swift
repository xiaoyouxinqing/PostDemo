//
//  ContentView.swift
//  WebImageDemo
//
//  Created by xiaoyouxinqing on 5/20/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

private let url = URL(string: "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/006PdkDogy1gap6ngiyn3j30u011idle.jpg")!

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SimpleExample(url: url)) {
                    Text("Simple example")
                }
                NavigationLink(destination: WebImageExample(url: url)) {
                    Text("Web image example")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
