//
//  Ch05_1_DataFlow.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch05_1_DataFlow: View {
  var body: some View {
    Example01()
  }
}

private extension Ch05_1_DataFlow {
  // MARK: Example 01
  
  /// Toggle과 Stepper 구현 예시.
  /// 뷰에서 읽고 변경할 값을 저장하기 위해 State가 사용되며
  /// 자식 뷰에서 상위 뷰의 값을 변경하기 위해 Binding이 사용됩니다.
  struct Example01: View {
    @State private var isFavorite = true
    @State private var count = 0
    
    var body: some View {
      VStack(spacing: 30) {
        Toggle(isOn: $isFavorite) {
          Text("isFavorite : \(isFavorite.description)")
        }
        
        Stepper("Count : \(count)", value: $count)
      }
    }
  }
  
  
  
  final class User: ObservableObject {
    let objectWillChange = ObjectWillChangePublisher()
    
    let name = "User Name"
//    @Published var score = 0
    var score = 0 {
      willSet {
        objectWillChange.send()
      }
    }
  }
  
  // MARK: Example 02
  
  /// ObservableObject 프로토콜을 채택한 모델을 다룰 때
  /// ObservedObject를 사용할 수 있습니다.
  /// => iOS 14.0부터 @StateObject가 추가되었습니다.
  struct Example02: View {
    @ObservedObject var user = Ch05_1_DataFlow.User()
    
    var body: some View {
      VStack(spacing: 30) {
        Text(user.name)
        
        Button(action: { self.user.score += 1 }) {
          Text(user.score.description)
        }
      }
      .padding()
      .border(Color.black)
    }
  }
  
  // MARK: Example 03
  
  /// EnvironmentObject를 이용하면 뷰의 서브 트리 전체가 동일한 데이터를 공유할 수 있습니다.
  struct Example03: View {
    var body: some View {
      Ch05_1_DataFlow.Superview()
        .environmentObject(Ch05_1_DataFlow.User())
    }
  }
  struct Superview: View {
    var body: some View { Ch05_1_DataFlow.Subview() }
  }
  struct Subview: View {
    @EnvironmentObject var user: User
    var body: some View { Text(user.name.description) }
  }
}


// MARK: - Previews

struct Ch05_1_DataFlow_Previews: PreviewProvider {
  static var previews: some View {
    Ch05_1_DataFlow()
      .previewDisplayName("Sweet SwiftUI")
  }
}
