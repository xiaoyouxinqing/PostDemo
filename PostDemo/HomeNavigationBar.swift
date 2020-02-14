//
//  HomeNavigationBar.swift
//  PostDemo
//
//  Created by xiaoyouxinqing on 1/8/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24

struct HomeNavigationBar: View {
    @Binding var leftPercent: CGFloat // 0 for left, 1 for right
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                print("Click camera button")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            VStack(spacing: 3) {
                HStack(spacing: 0) {
                    Text("推荐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0
                            }
                    }
                    
                    Spacer()
                    
                    Text("热门")
                        .bold()
                        .frame(width: kLabelWidth)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 1
                            }
                    }
                }
                .font(.system(size: 20))
                
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 4)
                        .offset(x: geometry.size.width * (self.leftPercent - 0.5) + kLabelWidth * (0.5 - self.leftPercent))
                }
                .frame(height: 6)
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            
            Spacer()
            
            Button(action: {
                print("Click add button")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: .constant(0))
    }
}
