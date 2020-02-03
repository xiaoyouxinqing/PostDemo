//
//  ContentView.swift
//  PostDemo
//
//  Created by xiaoyouxinqing on 1/6/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    let category: PostListCategory
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.postList(for: category).list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
        
        /*
        // Left margin is not removed
        List(postList.list, id: \.name) { post in
            PostCell(post: post)
        }
         */
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommend)
                .environmentObject(UserData())
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
    }
}
