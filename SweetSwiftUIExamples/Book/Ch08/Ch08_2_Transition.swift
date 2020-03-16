//
//  Ch08_2_Transition.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch08_2_Transition: View {
  var body: some View {
    Example01()
  }
}

private extension Ch08_2_Transition {
  // MARK: Example 01
  
  /// 트랜지션은 뷰 계층 구조에 변화가 발생될 때 일어나는 애니메이션입니다.
  /// 기본 효과로는 .opacity가 사용됩니다.
  struct Example01: View {
    @State private var showText = false
    
    var body: some View {
      VStack {
        if showText {
          Text("Transition")
            .font(.largeTitle)
            .padding()
//            .transition(.opacity)
        }
        
        Button("Display Text On / Off") {
          withAnimation {
            self.showText.toggle()
          }
        }.font(.title)
      }
    }
  }
    

  // MARK: Example 02
  
  /// 5가지 기본 트랜지션 유형이 제공됩니다.
  struct Example02: View {
    @State private var showText = false
    
    var body: some View {
      VStack(spacing: 30){
        Button("Display Text On / Off") {
          withAnimation {
            self.showText.toggle()
          }
        }.padding()
        
        Spacer()
        
        if showText {
          Text("Opacity").padding()
            .transition(.opacity)
          
          Text("Scale").padding()
            .transition(.scale)
          
          Text("Slide").padding()
            .transition(.slide)
          
          Text("Offset").padding()
            .transition(.offset(x: 100, y: 100))
          
          Text("Move").padding()
            .transition(.move(edge: .bottom))
        }
        
        Spacer()
      }
      .font(.title)
    }
  }
  
  
  // MARK: Example 03
  
  /// combined와 asymmetric 메서드를 이용한 트랜지션 합성
  struct Example03: View {
    @State private var showText = false
    
    var body: some View {
      VStack {
        Button("Display Text On / Off") {
          withAnimation {
            self.showText.toggle()
          }
        }.padding()
        
        Spacer()
        
        Text("Combined")
          .frame(maxWidth: .infinity)
          .background(Color.green)
          .padding(.bottom)
        
        if showText {
          Text("Transition")
            .transition(AnyTransition.slide.combined(with: .scale))
        }
        
        Spacer()
        
        Text("Asymmetric")
          .frame(maxWidth: .infinity)
          .background(Color.green)
          .padding(.bottom)
        
        if showText {
          Text("Transition")
            .transition(myTransition)
        }
        
        Spacer()
      }
      .font(.title)
    }
    
    var myTransition: AnyTransition {
      let insertion = AnyTransition.offset(x: 300, y: -300)
        .combined(with: .scale)
      let removal = AnyTransition.move(edge: .leading)
      return .asymmetric(insertion: insertion, removal: removal)
    }
  }
  
  // MARK: Example 04
  
  /// modifier를 이용한 커스텀 트랜지션 예시
  /// 뷰가 삽입될 때 상태 변화 : active -> identity
  /// 뷰가 제거될 때 상태 변화 : identity -> active
  struct Example04: View {
    @State private var showText = false
    
    var body: some View {
      VStack(spacing: 30) {
        if showText {
          Text("Transition")
            .padding()
//            .transition(.modifier(active: CustomScaleModifier(scale: 0),
//                                  identity: CustomScaleModifier(scale: 1)))
            .transition(.customScale)
        }
        
        Button("Display Text On / Off") {
          withAnimation {
            self.showText.toggle()
          }
        }
      }
      .font(.title)
    }
  }
}


fileprivate extension AnyTransition {
  static var customScale: AnyTransition {
    AnyTransition.modifier(
      active: CustomScaleModifier(scale: 0),
      identity: CustomScaleModifier(scale: 1)
    )
  }
}

fileprivate struct CustomScaleModifier: ViewModifier {
  let scale: CGFloat
  func body(content: Content) -> some View {
    content
      .scaleEffect(scale)
  }
}


// MARK: - Previews

struct Ch08_2_Transition_Previews: PreviewProvider {
  static var previews: some View {
    Ch08_2_Transition()
      .previewDisplayName("Sweet SwiftUI")
  }
}
