//
//  UserData.swift
//  PostDemo
//
//  Created by xiaoyouxinqing on 1/13/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import Combine

class UserData: ObservableObject {
    @Published var recommedPostList: PostList = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData("PostListData_hot_1.json")
    
    private var recommendPostDic: [Int: Int] = [:] // id: index
    private var hotPostDic: [Int: Int] = [:] // id: index
    
    init() {
        for i in 0..<recommedPostList.list.count {
            let post = recommedPostList.list[i]
            recommendPostDic[post.id] = i
        }
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDic[post.id] = i
        }
    }
}

enum PostListCategory {
    case recommend, hot
}

extension UserData {
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommend: return recommedPostList
        case .hot: return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        if let index = recommendPostDic[id] {
            return recommedPostList.list[index]
        }
        if let index = hotPostDic[id] {
            return hotPostList.list[index]
        }
        return nil
    }
    
    func update(_ post: Post) {
        if let index = recommendPostDic[post.id] {
            recommedPostList.list[index] = post
        }
        if let index = hotPostDic[post.id] {
            hotPostList.list[index] = post
        }
    }
}
