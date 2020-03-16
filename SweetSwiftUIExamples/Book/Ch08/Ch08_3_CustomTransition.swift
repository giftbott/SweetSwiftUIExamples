//
//  Ch08_3_CustomTransition.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch08_3_CustomTransition: View {
  var body: some View {
    Example01()
  }
}

private extension Ch08_3_CustomTransition {
  // MARK: Example 01
  
  /// 커스텀 애니메이션을 연산하는데 필요한 속성이 무엇인지 animatableData로 지정해 줍니다.
  struct Example01: View {
    @State private var trimmedTo: CGFloat = 1.0
    @State private var lineWidth: CGFloat = 7.0
    @State private var isHidden = false
    
    var body: some View {
      VStack {
        MyCircle(trimmedTo: trimmedTo, lineWidth: lineWidth)
          .padding()
          .animation(.easeInOut(duration: 1.5))
        
        Button(action: {
          self.trimmedTo = self.isHidden ? 1.0 : 0
          self.lineWidth = self.isHidden ? 7 : 1
          self.isHidden.toggle()
        }) {
          Text("Animate!").font(.title)
        }.padding()
      }
    }
    
    struct MyCircle: Shape {
      var trimmedTo: CGFloat
      var lineWidth: CGFloat

      var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(trimmedTo, lineWidth) }
        set {
          trimmedTo = newValue.first
          lineWidth = newValue.second
        }
      }

      func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2
        let start = Angle(radians: .pi / -2)
        let end = Angle(radians: .pi / 2 * 3)
        
        path.addArc(center: center, radius: radius / 4, startAngle: start, endAngle: end, clockwise: false)
        path.addArc(center: center, radius: radius / 2, startAngle: start, endAngle: end, clockwise: false)
        path.addArc(center: center, radius: radius, startAngle: start, endAngle: end, clockwise: false)
      
        return path
          .trimmedPath(from: 0.0, to: trimmedTo)
          .strokedPath(.init(lineWidth: lineWidth))
      }
    }
  }
}


// MARK: - Previews

struct Ch08_3_CustomTransition_Previews: PreviewProvider {
  static var previews: some View {
    Ch08_3_CustomTransition()
      .previewDisplayName("Sweet SwiftUI")
  }
}
