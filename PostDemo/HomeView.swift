//
//  HomeView.swift
//  PostDemo
//
//  Created by xiaoyouxinqing on 1/8/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var leftPercent: CGFloat = 0 // 0 for left, 1 for right
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HScrollViewController(pageWidth: geometry.size.width,
                                      contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height),
                                      leftPercent: self.$leftPercent)
                {
                    HStack(spacing: 0) {
                        PostListView(category: .recommend)
                            .frame(width: geometry.size.width)
                        
                        PostListView(category: .hot)
                            .frame(width: geometry.size.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("首页", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
