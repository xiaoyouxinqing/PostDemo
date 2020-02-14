//
//  CommentTextView.swift
//  PostDemo
//
//  Created by xiaoyouxinqing on 1/14/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

struct CommentTextView: UIViewRepresentable {
    @Binding var text: String
    let beginEditingOnAppear: Bool
    
    func makeCoordinator() -> CommentTextView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.font = .systemFont(ofSize: 18)
        view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        view.text = text
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if beginEditingOnAppear,
            !context.coordinator.didBecomeFirstResponder,
            uiView.window != nil,
            !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent: CommentTextView
        var didBecomeFirstResponder: Bool = false
        
        init(_ view: CommentTextView) { parent = view }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

struct CommentTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextView(text: .constant("Text"), beginEditingOnAppear: false)
    }
}
