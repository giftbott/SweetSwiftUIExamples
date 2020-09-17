//
//  Ch07_2_TabView.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch07_2_TabView: View {
  var body: some View {
    Example01()
  }
}

private extension Ch07_2_TabView {
  // MARK: Example 01
  
  /// 기본적인 탭 뷰에 대한 구현 예시
  struct Example01: View {
    var body: some View {
      TabView {
        VStack {
          Text("첫 번째 탭").font(.largeTitle)
          Image("SwiftUI")
        }.tabItem {
          Image(systemName: "house")
          Text("아이템1")
        }
        
        Text("두 번째 탭의 화면")
          .font(.title)
          .padding()
          .background(Color.yellow)
          .tabItem {
            Image(systemName: "cube")
            Text("아이템2")
          }
        
        SomeView()
          .tabItem {
            Image(systemName: "person")
            Text("아이템3")
          }
      }
    }
    
    struct SomeView: View {
      var body: some View {
        VStack {
          Text("실제로는 이런 식으로")
          Text("별도의 뷰를 만들어서 사용하겠죠.")
        }.font(.title)
      }
    }
  }
    
  // MARK: Example 02
  
  /// 탭 아이템은 어느 뷰에 연결했는 지와 관계없이 뷰를 작성한 순서대로 적용됩니다.
  /// => iOS 14.0부터는 탭 아이템 수식어를 적용한 뷰에 제대로 연결됩니다.
  struct Example02: View {
    var body: some View {
      TabView {
        Text("View1")
        
        Text("View2")
          .tabItem {
            Image(systemName: "cube")
            Text("아이템2")
          }
        
        Text("View3")
          .tabItem {
            Image(systemName: "person")
            Text("아이템3")
          }
      }
    }
  }
  
    
  // MARK: Example 03
  
  /// 태그를 이용해 어떤 탭을 선택했는지 값을 전달해 줄 수 있습니다.
  struct Example03: View {
    @State private var selectedTab = 0
    
    var body: some View {
      TabView(selection: $selectedTab) {
        ForEach(0..<3) { index in
          Text("태그 \(index)")
            .font(.largeTitle).fontWeight(.bold)
            .tag(index)
            .tabItem {
              Image(systemName: self.selectedTab != index
                ? "\(index).square"
                : "\(index).square.fill"
              ).imageScale(.large)
          }
        }
      }
      .accentColor(.red)
    }
  }
      
  
  // MARK: Example 04
  
  /// 탭 뷰의 selection 매개 변수에는 Hashable 프로토콜을 준수하는 타입을 사용할 수 있습니다.
  struct Example04: View {
    enum TabItems {
      case A, B, C
    }
    @State private var selected = TabItems.A

    var body: some View {
      TabView(selection: $selected) {
        Text("A 뷰")
          .tag(TabItems.A)
          .tabItem { Image(systemName: "a.circle").imageScale(.large) }
        
        Text("B 뷰")
          .tag(TabItems.B)
          .tabItem { Image(systemName: "b.circle").imageScale(.large) }
        
        Text("C 뷰")
          .tag(TabItems.C)
          .tabItem { Image(systemName: "c.circle").imageScale(.large) }
      }
    }
  }
}


// MARK: - Previews

struct Ch07_2_TabView_Previews: PreviewProvider {
  static var previews: some View {
    Ch07_2_TabView()
      .previewDisplayName("Sweet SwiftUI")
  }
}
