//
//  Ch06_1_ViewModifier.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch06_1_ViewModifier: View {
  var body: some View {
    Example01()
  }
}

private extension Ch06_1_ViewModifier {
  // MARK: Example 01
  
  /// modifier 수식어 또는 ModifiedContent 뷰를 이용해 ViewModifier를 적용할 수 있습니다.
  struct Example01: View {
    var body: some View {
      Text("Custom ViewModifier")
        .modifier(Ch06_1_ViewModifier.CustomViewModifier(borderColor: .blue))
      
//      ModifiedContent(content: Text("Custom ViewModifier"),
//                      modifier: Ch06_1_ViewModifier.CustomViewModifier(borderColor: .blue))
    }
  }
  
  struct CustomViewModifier: ViewModifier {
    var borderColor: Color = .red
    
    func body(content: Content) -> some View {
      content
        .font(.title)
        .foregroundColor(Color.white)
        .padding()
        .background(Rectangle().fill(Color.gray))
        .border(borderColor, width: 2)
    }
  }
  
  // MARK: Example 02
  
  /// concat을 이용해 서로 다른 ViewModifier를 결합하여 사용할 수도 있습니다.
  struct Example02: View {
    var body: some View {
      Text("My ViewModifiers")
        .modifier(MyModifier1().concat(MyModifier2()))
    }
    
    struct MyModifier1: ViewModifier {
      func body(content: Content) -> some View {
        content
          .font(.title)
      }
    }
    struct MyModifier2: ViewModifier {
      func body(content: Content) -> some View {
        content
          .foregroundColor(.blue)
      }
    }
  }
  
  // MARK: Example 03
  
  /// View 프로토콜을 확장하여 수식어를 추가해주면
  /// ViewModifier를 좀 더 쉽게 사용할 수 있습니다.
  struct Example03: View {
    var body: some View {
      Text("Custom ViewModifier")
        .customModifier(borderColor: .orange)
    }
  }
}

// MARK: View Extension

fileprivate extension View {
  func customModifier(borderColor: Color = .red) -> some View {
    self
      .modifier(Ch06_1_ViewModifier.CustomViewModifier(borderColor: borderColor))
  }
}


// MARK: - Previews

struct Ch06_1_ViewModifier_Previews: PreviewProvider {
  static var previews: some View {
    Ch06_1_ViewModifier()
      .previewDisplayName("Sweet SwiftUI")
  }
}
