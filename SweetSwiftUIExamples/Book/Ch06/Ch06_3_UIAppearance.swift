//
//  Ch06_3_UIAppearance.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch06_3_UIAppearance: View {
  var body: some View {
    Example01()
  }
}

private extension Ch06_3_UIAppearance {
  // MARK: Example 01
  
  struct Example01: View {
    init() {
      UINavigationBar.appearance().largeTitleTextAttributes = [
        .foregroundColor: UIColor.systemTeal,
        .kern: 5
      ]
      UINavigationBar.appearance().titleTextAttributes = [
        .foregroundColor: UIColor.systemTeal,
        .font: UIFont.italicSystemFont(ofSize: 25)
      ]
    }
    
    var body: some View {
      NavigationView {
        Text("Hello, World!!!!!")
          .navigationBarTitle("UIAppearance")
//          .navigationBarTitle("UIAppearance", displayMode: .inline)
      }
    }
  }
  
  
  // MARK: Example 02
  
  struct Example02: View {
    @State private var isOn = true
    
    init() {
      UISwitch.appearance().onTintColor = .gray
      UISwitch.appearance().thumbTintColor = .orange
    }
    
    var body: some View {
      Toggle(isOn: $isOn) {
        Text("UISwitch에 대한 색상 변경")
      }
      .padding()
    }
  }
}


// MARK: - Previews

struct Ch06_3_UIAppearance_Previews: PreviewProvider {
  static var previews: some View {
    Ch06_3_UIAppearance()
      .previewDisplayName("Sweet SwiftUI")
  }
}
