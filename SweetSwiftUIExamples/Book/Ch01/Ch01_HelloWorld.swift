//
//  Ch01_HelloWorld.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch01_HelloWorld: View {
  var body: some View {
    example01
  }
}

extension Ch01_HelloWorld {
  // MARK: Example 01
  
  var example01: some View {
    Text("Hello SwiftUI")
      .font(.largeTitle)
      .foregroundColor(.red)
      .fontWeight(.bold)
      .colorInvert()
  }
  
  // MARK: Example02
  
  var example02: some View {
    Text("Hello ").foregroundColor(.green).italic()
      + Text("SwiftUI").foregroundColor(.blue).bold()
  }
  
  // MARK: Example03
  
  var example03: some View {
    HStack(spacing: 50) {
      Text("Hello ✋\nSwiftUI 😀").font(.title)
      Text("Hello ✋\nSwiftUI 😀").font(.title).lineLimit(1)
    }
  }
}


// MARK: - Previews

struct Ch01_HelloWorld_Previews1: PreviewProvider {
  static var previews: some View {
    Ch01_HelloWorld()
      .previewDisplayName("Sweet SwiftUI")
  }
}
