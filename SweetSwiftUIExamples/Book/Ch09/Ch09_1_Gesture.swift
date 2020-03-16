//
//  Ch09_1_Gesture.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch09_1_Gesture: View {
  var body: some View {
    Example01()
  }
}

private extension Ch09_1_Gesture {
  // MARK: Example 01
  
  /// TapGesture는 화면을 일정 횟수(기본값 1) 이상 탭 했을 때 반응하는 제스처입니다.
  struct Example01: View {
    var body: some View {
      let tapGesture = TapGesture(count: 2).onEnded {
        print("Circle <3>")
      }
      
      return VStack {
        Circle().fill(Color.red)
          .onTapGesture { print("Circle <1>") }
        
        Circle().fill(Color.green)
          .onTapGesture(count: 2) { print("Circle <2>") }
        
        Circle().fill(Color.blue)
          .gesture(tapGesture)
      }.padding()
    }
  }
  
  // MARK: Example 02
  
  /// LongPressGesture는 일정 시간(기본값 0.5초) 이상 화면을 눌렀을 때 반응하는 제스처입니다.
  struct Example02: View {
    @GestureState private var longPressed = false
    
    var body: some View {
      let longPressGesture = LongPressGesture()
        .onChanged({ pressing in print(pressing) })
        .onEnded({ _ in print("Long Pressed!") })
      
      return VStack {
        Circle().fill(Color.red)
          .onLongPressGesture { print("LongPressed") }
        
        Circle().fill(Color.green)
          .onLongPressGesture(
            minimumDuration: 0.5,
            maximumDistance: 10,
            pressing: { pressing in print(pressing) },
            perform: { print("Recognized") })
        
        Circle().fill(Color.blue)
          .gesture(longPressGesture)
      }.padding()
    }
  }
  
  // MARK: Example 03
  
  /// DragGesture는 터치한 상태에서 드래그한 위치와 시간 등을 반환하는 제스처입니다.
  struct Example03: View {
    @GestureState private var translation: CGSize = .zero
    
    var body: some View {
      let dragGesture = DragGesture()
        .updating($translation) { (value, state, _) in
          state = value.translation
      }

      return Circle()
        .offset(translation)
        .gesture(dragGesture)
    }
  }
  
  // MARK: Example 04
  
  /// MagnificationGesture는 줌 인/아웃에 따른 배율을 반환하는 제스처입니다.
  struct Example04: View {
    @GestureState private var scale: CGFloat = 1
    @State private var latestScale: CGFloat = 1
    
    var body: some View {
      let magnificationGesture = MagnificationGesture()
        .updating($scale) { (value, state, _) in
          state = value
        }.onEnded { scale in
          self.latestScale *= scale
        }
      return Circle()
        .scaleEffect(latestScale * scale)
        .gesture(magnificationGesture)
    }
  }
  
  // MARK: Example 05
  
  /// RotationGesture는 회전 각도를 반환하는 제스처입니다.
  struct Example05: View {
    @GestureState private var angle: Angle = .zero
    
    var body: some View {
      let rotationGesture = RotationGesture()
        .updating($angle) { (value, state, _) in
          state = value
        }
      return Capsule()
        .rotationEffect(angle)
        .gesture(rotationGesture)
    }
  }
  
  // MARK: Example 06
  
  /// highPriorityGesture는 제스처가 겹치는 상황에서 우선 순위를 가집니다.
  struct Example06: View {
    var body: some View {
    let tapGesture = TapGesture().onEnded {
      print("사각형 탭")
    }
    return VStack {
      Rectangle()
      Circle().onTapGesture {
        print("원형 탭")
      }
    }
//    .gesture(tapGesture)
    .highPriorityGesture(tapGesture)
  }
    }
  
  // MARK: Example 07
  
  /// simultaneousGesture는 서로 다른 제스처를 동시에 인식되도록 합니다.
  struct Example07: View {
    var body: some View {
    let longPressGesture = LongPressGesture()
      .onChanged { _ in print("LongPress began!") }
      .onEnded { _ in print("LongPressed!") }
    
    let tapGesture = TapGesture().onEnded {
      print("Tapped!")
    }
    
    return Circle()
      .gesture(longPressGesture)
//      .gesture(tapGesture)
      .simultaneousGesture(tapGesture)
  }
    }
  
  // MARK: Example 08
  
  /// GestureMask는 여러 개의 제스처가 사용되었을 때 어떤 제스처를 인식할 것인지 설정해 줄 수 있습니다.
  struct Example08: View {
    var body: some View {
      let longPressGesture = LongPressGesture()
        .onChanged { _ in print("LongPress began!") }
        .onEnded { _ in print("LongPressed!") }
      
      let tapGesture = TapGesture().onEnded {
        print("Tapped!")
      }
      
      return VStack {
        Circle()
          .gesture(longPressGesture)
      }
      .simultaneousGesture(tapGesture, including: .all)
    }
  }
}


// MARK: - Previews

struct Ch09_1_Gesture_Previews: PreviewProvider {
  static var previews: some View {
    Ch09_1_Gesture()
      .previewDisplayName("Sweet SwiftUI")
  }
}
