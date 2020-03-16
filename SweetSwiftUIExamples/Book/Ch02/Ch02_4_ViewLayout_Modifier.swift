//
//  Ch02_4_ViewLayout_Modifier.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02_4_ViewLayout_Modifier: View {
  var body: some View {
    Example01()
  }
}

private extension Ch02_4_ViewLayout_Modifier {
  // MARK: Example 01
  
  /// overlay는 뷰의 상위 계층에 중첩하여 쌓는 수식어입니다.
  struct Example01: View {
    var body: some View {
      Rectangle()
        .fill(Color.green)
        .frame(width: 150, height: 150)
        .overlay(Rectangle().fill(Color.yellow))
    }
  }
  
  /// background는 뷰의 하위 계층에 중첩하여 쌓는 수식어입니다.
  struct Example02: View {
    var body: some View {
      Rectangle()
        .fill(Color.yellow)
        .frame(width: 150, height: 150)
        .overlay(Rectangle().fill(Color.green))
    }
  }
  
  // MARK: Example 03
  
  /// alignment를 이용해 뷰의 위치를 결정할 수 있습니다.
  struct Example03: View {
    var body: some View {
      Circle()
        .fill(Color.yellow.opacity(0.8))
        .frame(width: 250, height: 250)
        .overlay(Text("Joystick").font(.largeTitle))
        .overlay(Image(systemName: "arrow.up").font(.title).padding(),
                 alignment: .top)
        .overlay(Image(systemName: "arrow.left").font(.title).padding(),
                 alignment: .leading)
        .overlay(Image(systemName: "arrow.up.right.circle.fill").font(.title), alignment: .topTrailing)
        .background(Image(systemName: "arrow.down").font(.title).padding(),
                    alignment: .bottom)
        .background(Image(systemName: "arrow.right").font(.title).padding(),
                    alignment: .trailing)
    }
  }
  
  // MARK: Example 04
  
  /// Example 03과 동일한 결과를 스택을 이용해 구현한 내용입니다.
  struct Example04: View {
    var body: some View {
      ZStack {
        VStack {
          Spacer()
          Image(systemName: "arrow.down").font(.title).padding()
        }
        HStack {
          Spacer()
          Image(systemName: "arrow.right").font(.title).padding()
        }
        Circle()
          .fill(Color.yellow.opacity(0.8))
          .frame(width: 250, height: 250)
        
        Text("Joystick").font(.largeTitle)
        
        ZStack(alignment: .topTrailing) {
          Color.clear
          Image(systemName: "arrow.up.right.circle.fill").font(.title)
        }
        VStack {
          Image(systemName: "arrow.up").font(.title).padding()
          Spacer()
        }
        HStack {
          Image(systemName: "arrow.left").font(.title).padding()
          Spacer()
        }
      }
      .frame(width: 250, height: 250)
    }
  }
}


// MARK: - Previews

struct Ch02_4_ViewLayout_Modifier_Previews: PreviewProvider {
  static var previews: some View {
    Ch02_4_ViewLayout_Modifier()
      .previewDisplayName("Sweet SwiftUI")
  }
}
