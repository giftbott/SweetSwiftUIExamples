//
//  Ch08_1_Animation.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch08_1_Animation: View {
  var body: some View {
    Example01()
  }
}

private extension Ch08_1_Animation {
  // MARK: Example 01
  
  /// .animation 수식어를 이용해 애니메이션 효과를 줄 수 있습니다.
  /// 적용 위치에 따라 어떻게 달라지는지 확인해 보세요.
  struct Example01: View {
    @State private var blur: Bool = false
    @State private var reduction: Bool = false
    
    var body: some View {
      Image("cat2")
        .blur(radius: blur ? 5 : 0)
//        .animation(.default)
        .scaleEffect(reduction ? 0.7 : 1)
        .animation(.default)
        .onTapGesture {
          self.blur.toggle()
          self.reduction.toggle()
        }
    }
  }

  
  
  // MARK: Example 02
  
  /// 특정 수식어 이후의 변화에 대해서만 애니메이션을 주고 싶다면
  /// animation(nil)을 이용할 수 있습니다.
  struct Example02: View {
    @State private var blur: Bool = false
    @State private var reduction: Bool = false
    
    var body: some View {
      Image("cat2")
        .blur(radius: blur ? 5 : 0)
        .animation(nil)
        .scaleEffect(reduction ? 0.7 : 1)
        .animation(.default)
        .onTapGesture {
          self.blur.toggle()
          self.reduction.toggle()
        }
    }
  }

  // MARK: Example 03
  
  /// withAnimation 함수를 이용해 특정 뷰가 아닌 어떤 상태의 변화를 기준으로
  /// 애니메이션을 적용해 줄 수 있습니다.
  struct Example03: View {
    @State private var blur: Bool = false
    @State private var reduction: Bool = false
    
    var body: some View {
      Image("cat2")
        .blur(radius: blur ? 5 : 0)
        .scaleEffect(reduction ? 0.7 : 1)
        .onTapGesture {
          withAnimation {
            self.blur.toggle()
          }
          self.reduction.toggle()
        }
    }
  }
  

  // MARK: Example 04
  
  /// 애니메이션 메서드 활용 예시
  struct Example04: View {
    @State private var blur: Bool = false
    @State private var reduction: Bool = false
    
    var body: some View {
      Image("cat2")
        .blur(radius: blur ? 5 : 0)
        .animation(Animation.default.speed(2).repeatCount(5, autoreverses: true))
        .scaleEffect(reduction ? 0.7 : 1)
        .animation(Animation.default.delay(1))
        .onTapGesture {
          self.blur.toggle()
          self.reduction.toggle()
        }
    }
  }
}


// MARK: - Previews

struct Ch08_1_Animation_Previews: PreviewProvider {
  static var previews: some View {
    Ch08_1_Animation()
      .previewDisplayName("Sweet SwiftUI")
  }
}
