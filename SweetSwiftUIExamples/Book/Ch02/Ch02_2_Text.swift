//
//  Ch02_2_Text.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02_2_Text: View {
  var body: some View {
    Example01()
  }
}

private extension Ch02_2_Text {
  // MARK: Example 01
  
  /// 텍스트에 제공되는 여러 가지 수식어를 이용해 쉽게 문자열을 조작할 수 있습니다.
  struct Example01: View {
    var body: some View {
      VStack(spacing: 30) {
        Text("폰트와 굵기 설정")
          .font(.title)
          .fontWeight(.black)
        
        Text("글자색은 foreground, 배경은 background")
          .foregroundColor(.white)
          .padding()
          .background(Color.blue)
        
        Text("커스텀 폰트, 볼드체, 이탤릭체, 밑줄, 취소선")
          .font(.custom("Menlo", size: 16))
          .bold()
          .italic()
          .underline()
          .strikethrough()
        
        Text("라인 수 제한과\n텍스트 정렬 기능입니다.\n이건 안 보이죠?")
          .lineLimit(2)
          .multilineTextAlignment(.trailing)
          .fixedSize()
        
        (Text("자간과 기준선").kerning(8)
          + Text(" 조정도 쉽게 가능합니다.").baselineOffset(8))
          .font(.system(size: 16))
      }
    }
  }
  
  // MARK: Example 02
  
  /// 수식어 적용 순서에 따라 사용 가능한 수식어가 달라집니다.
  struct Example02: View {
    var body: some View {
    // O.K.
    Text("SwiftUI")
      .font(.title)  // Text
      .bold()        // Text
      .padding()     // View
    
    // 오류.
//    Text("SwiftUI")
//      .padding()  // View
//      .bold()     // X
//      .font(.title)
    }
  }
  
  // MARK: Example 03
  
  /// 수식어 적용 순서에 따라 실행 결과가 크게 달라질 수 있습니다.
  struct Example03: View {
    var body: some View {
      VStack {
        Text("🐶🐱🐰🦊").font(.largeTitle)
          .padding()
          .background(Color.yellow)
        
        Text("🐶🐱🐰🦊").font(.largeTitle)
          .background(Color.yellow)
          .padding()
      }
    }
  }
}


// MARK: - Previews

struct Ch02_2_Text_Previews: PreviewProvider {
  static var previews: some View {
    Ch02_2_Text()
      .previewDisplayName("Sweet SwiftUI")
  }
}
