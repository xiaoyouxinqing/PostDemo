//
//  Post.swift
//  NetworkRequestDemo
//
//  Created by xiaoyouxinqing on 4/20/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import Foundation

struct PostList: Codable {
    var list: [Post]
}

struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // image names
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}
