//
//  Ch04_2_EnvironmentValues.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch04_2_EnvironmentValues: View {
  var body: some View {
    Example01()
  }
}

private extension Ch04_2_EnvironmentValues {
  // MARK: Example 01
  
  /// environment 수식어를 이용해 뷰의 특정 환경 요소에 대한 값을 덮어쓸 수 있습니다.
  /// 수식어가 적용된 뷰와 그 서브 트리에 일괄 반영됩니다.
  struct Example01: View {
    var body: some View {
      Text("Hello, SwiftUI")
        .frame(width: 100)
        .environment(\.font, .title)
        .environment(\.lineLimit, 1)
        .environment(\.minimumScaleFactor, 0.5)
    }
  }
  
  // MARK: Example 02
  
  /// Environment 프로퍼티 래퍼를 이용해 뷰의 특정 환경 요소에 대한 현재 값을 읽어올 수 있습니다.
  struct Example02: View {
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
      if layoutDirection == .leftToRight {
        return Text("Left to Right")
      } else {
        return Text("Right to Left")
      }
    }
  }
  
  // MARK: Example 03
  
  /// EnvironmentKey를 이용해 커스텀 환경 변수를 정의할 수도 있습니다.
  struct Example03: View {
    var body: some View {
      Ch04_2_EnvironmentValues.MySubview()
        .environment(\.myEnvironment, 10)
    }
  }
  
  struct MySubview: View {
    @Environment(\.myEnvironment) var myValue
    
    var body: some View {
      Text("\(myValue)")
    }
  }
}

fileprivate struct MyEnvironmentKey: EnvironmentKey {
  static let defaultValue: Int = 0
}
fileprivate extension EnvironmentValues {
  var myEnvironment: Int {
    get { self[MyEnvironmentKey.self] }
    set { self[MyEnvironmentKey.self] = newValue }
  }
}


// MARK: - Previews

struct Ch04_2_EnvironmentValues_Previews: PreviewProvider {
  static var previews: some View {
    Ch04_2_EnvironmentValues()
      .previewDisplayName("Sweet SwiftUI")
  }
}
