//
//  Ch04_1_Preview.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch04_1_Preview: View {
  var body: some View {
    Example01()
  }
}

private extension Ch04_1_Preview {
  // MARK: Example 01
  
  struct Example01: View {
    var body: some View {
      List {
        Image("cat")
          .resizable()
          .scaledToFit()
        
        Image("dog")
          .resizable()
          .scaledToFit()
      }
    }
  }
  
  // MARK: Example 02
  
  struct Example02: View {
    var body: some View {
      HStack {
        Image("cat")
          .resizable().scaledToFill()
          .frame(width: 80, height: 80)
          .clipped()
        Text("Cat").font(.title)
        
        Image("dog")
          .resizable().scaledToFill()
          .frame(width: 80, height: 80)
          .clipped()
        Text("Dog").font(.title)
      }
    }
  }
}


// MARK: - Previews

struct Ch04_1_Preview_Previews1: PreviewProvider {
  static var previews: some View {
    Group {
      Ch04_1_Preview()
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
      
      Ch04_1_Preview()
        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
    .previewDisplayName("Sweet SwiftUI")
  }
}


struct Ch04_1_Preview_Previews2: PreviewProvider {
  static var previews: some View {
    ForEach(["iPhone 11 Pro", "iPhone 8", "iPhone 11 Pro Max"], id: \.self) {
      Ch04_1_Preview()
        .previewDevice(PreviewDevice(rawValue: $0))
        .previewDisplayName($0)
    }
  }
}

struct Ch04_1_Preview_Previews3: PreviewProvider {
  static var previews: some View {
    Ch04_1_Preview()
      .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
      .previewLayout(.sizeThatFits)
//      .previewLayout(.fixed(width: 350, height: 150))
//      .previewLayout(.fixed(width: 812, height: 375))
//      .previewLayout(.device)
      .previewDisplayName("Sweet SwiftUI")
  }
}
