//
//  Ch02_4_ViewLayout_Spacer.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02_4_ViewLayout_Spacer: View {
  var body: some View {
    Example01()
  }
}

private extension Ch02_4_ViewLayout_Spacer {
  // MARK: Example 01
  
  /// Spacer는 HStack과 VStack에서 사용될 때와 그렇지 않을 때 동작이 달라집니다.
  struct Example01: View {
    var body: some View {
      // 1) 시각적 요소 적용 불가
      HStack {
        Spacer()
          .background(Color.blue)
      }
      
      // 2) 시각적 요소 적용 가능
//      Spacer()
//        .background(Color.blue)
    }
  }
  
  // MARK: Example 02
  
  /// Spacer는 가능한 최대 크기만큼 공간을 확보하지만, frame 수식어로 제한할 수 있습니다.
  struct Example02: View {
    var body: some View {
      HStack {
        Spacer()
//          .frame(width: 100)
        Text("Spacer")
          .font(.title)
          .background(Color.yellow)
      }
      .background(Color.blue)
    }
  }
  
  // MARK: Example 03
  
  /// minLength 매개 변수로 Spacer의 최소 길이를 지정할 수 있습니다.
  struct Example03: View {
    var body: some View {
      HStack {
        Text("Spacer MinLength").font(.title).foregroundColor(.white)
        Spacer(minLength: 100)
        Text("Spacer").font(.title).background(Color.yellow)
      }
      .background(Color.blue)
    }
  }
  
  // MARK: Example 04
  
  /// ZStack에서 사용된 Spacer는 스택 외부에서 단독으로 사용되었을 때와 동일하게 동작합니다.
  /// ZStack에서 공간을 확장하기 위해서는 Spacer 대신 Color.clear, Rectangle() 등을 사용할 수 있습니다.
  struct Example04: View {
    var body: some View {
      ZStack {
        Color.clear  // Color.clear와 Spacer를 비교해 보세요.
        Text("Spacer")
          .font(.title)
          .background(Color.yellow)
      }
      .background(Color.blue)
    }
  }
  
  // MARK: Example 05
  
  /// Spacer를 여러 개 사용하여 뷰를 원하는 위치에 배치할 수 있습니다.
  struct Example05: View {
    var body: some View {
      VStack {
        Text("제목").font(.largeTitle)
        Text("부제목").foregroundColor(Color.gray)
        Spacer()
        Text("본문 내용")
        Spacer()
        Spacer()
        Text("각주").font(.body)
      }
      .font(.title)
      .frame(width: 200, height: 350)
      .padding()
      .border(Color.blue, width: 2)
    }
  }
}


// MARK: - Previews

struct Ch02_4_ViewLayout_Spacer_Previews: PreviewProvider {
  static var previews: some View {
    Ch02_4_ViewLayout_Spacer()
      .previewDisplayName("Sweet SwiftUI")
  }
}
