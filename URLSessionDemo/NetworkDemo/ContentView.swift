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
                Text("Clear").font(.system(size: 12))
            }
        }
    }
    
    func startLoad() {
        let url = URL(string: "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/PostListData_recommend_1.json")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 15
        request.httpMethod = "POST"
        let dic = ["key": "value"]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.updateText(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                    self.updateText("Invalid response")
                    return
            }
            
            guard let data = data else {
                self.updateText("No data")
                return
            }
            
            guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
                self.updateText("Can not parse data")
                return
            }
            
            self.updateText("Post count \(list.list.count)")
        }
        task.resume()
    }
    
    func updateText(_ text: String) {
        DispatchQueue.main.async {
            self.text = text
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
