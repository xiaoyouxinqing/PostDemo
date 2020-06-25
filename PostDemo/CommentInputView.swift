//
//  CommentInputView.swift
//  PostDemo
//
//  Created by xiaoyouxinqing on 1/14/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

struct CommentInputView: View {
    let post: Post
    
    @State private var text: String = ""
    @State private var showEmptyTextHUD: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData: UserData
    
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        VStack(spacing: 0) {
            CommentTextView(text: $text, beginEditingOnAppear: true)
            
            HStack(spacing: 0) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("取消")
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    if self.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        self.showEmptyTextHUD = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.showEmptyTextHUD = false
                        }
                        return
                    }
                    print(self.text)
                    var post = self.post
                    post.commentCount += 1
                    self.userData.update(post)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("发送")
                        .padding()
                }
            }
            .font(.system(size: 18))
            .foregroundColor(.black)
        }
        .overlay(
            Text("评论不能为空")
                .scaleEffect(showEmptyTextHUD ? 1 : 0.5)
                .animation(.spring(dampingFraction: 0.5))
                .opacity(showEmptyTextHUD ? 1 : 0)
                .animation(.easeInOut)
        )
        .padding(.bottom, keyboardResponder.keyboardHeight)
        .edgesIgnoringSafeArea(keyboardResponder.keyboardShow ? .bottom : [])
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        CommentInputView(post: UserData().recommendPostList.list[0])
    }
}
