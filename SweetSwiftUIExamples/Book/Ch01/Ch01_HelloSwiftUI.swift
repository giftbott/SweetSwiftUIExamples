//
//  Ch01_HelloSwiftUI.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch01_HelloSwiftUI: View {
  var body: some View {
    Example01()
  }
}

private extension Ch01_HelloSwiftUI {
  // MARK: Example 01
  
  struct Example01: View {
    var body: some View {
      Text("Hello SwiftUI")
        .font(.largeTitle)
        .foregroundColor(.red)
        .fontWeight(.bold)
        .colorInvert()
    }
  }

  // MARK: Example02

  struct Example02: View {
    var body: some View {
      Text("Hello ").foregroundColor(.green).italic()
        + Text("SwiftUI").foregroundColor(.blue).bold()
    }
  }

  // MARK: Example03

  struct Example03: View {
    var body: some View {
      HStack(spacing: 50) {
        Text("Hello ✋\nSwiftUI 😀")
          .font(.title)
        
        Text("Hello ✋\nSwiftUI 😀")
          .font(.title)
          .lineLimit(1)
      }
    }
  }
}


// MARK: - Previews

struct Ch01_HelloSwiftUI_Previews: PreviewProvider {
  static var previews: some View {
    Ch01_HelloSwiftUI()
      .previewDisplayName("Sweet SwiftUI")
  }
}
