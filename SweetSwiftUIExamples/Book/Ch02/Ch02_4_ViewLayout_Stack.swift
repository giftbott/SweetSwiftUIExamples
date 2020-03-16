//
//  Ch02_4_ViewLayout_Stack.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02_4_ViewLayout_Stack: View {
  var body: some View {
    Example01()
  }
}

private extension Ch02_4_ViewLayout_Stack {
  // MARK: Example 01
  
  /// HStack, VStack, ZStack 세 가지 종류의 스택이 있습니다.
  /// H, V, Z 스택을 각각 변경해서 비교해 보세요.
  struct Example01: View {
    var body: some View {
      HStack {
        Rectangle()
          .fill(Color.green)
          .frame(width: 150, height: 150)
        Rectangle()
          .fill(Color.yellow)
          .frame(width: 150, height: 150)
      }
    }
  }

  // MARK: Example 02
  
  /// ZStack은 계층 구조를 이루는 스택입니다.
  struct Example02: View {
    var body: some View {
      ZStack {
        Rectangle()
          .fill(Color.green)
          .frame(width: 150, height: 150)
        Rectangle()
          .fill(Color.yellow)
          .frame(width: 150, height: 150)
          .offset(x: 40, y: 40)
      }
    }
  }
  
  // MARK: Example 03
  
  /// spacing 매개 변수의 값을 조정하여 뷰의 간격을 지정해 줄 수 있습니다.
  struct Example03: View {
    var body: some View {
      VStack(spacing: 50) {
        HStack(spacing: 0) {
          Rectangle()
            .fill(Color.green)
            .frame(width: 150, height: 150)
          Rectangle()
            .fill(Color.yellow)
            .frame(width: 150, height: 150)
        }
        
        HStack(spacing: 50) {
          Rectangle()
            .fill(Color.green)
            .frame(width: 150, height: 150)
          Rectangle()
            .fill(Color.yellow)
            .frame(width: 150, height: 150)
        }
      }
    }
  }
  
  // MARK: Example 04
  
  /// alignment 매개 변수를 통해 자식 뷰의 정렬 위치를 지정할 수 있습니다.
  struct Example04: View {
    var body: some View {
      HStack(alignment: .top) {
        Rectangle()
          .fill(Color.green)
          .frame(width: 150, height: 150)
        Rectangle()
          .fill(Color.yellow)
          .frame(width: 150, height: 550)
      }
    }
  }
  
  // MARK: Example 05
  
  /// 컨테이너 뷰 자체에 영향을 미치는 수식어가 있고 자식 뷰에게 반영되는 수식어가 있습니다.
  struct Example05: View {
    var body: some View {
      HStack {
        Text("HStack").font(.title).foregroundColor(Color.blue)
        Text("은 뷰를 가로로 배열합니다")
        Text("!")
      }
      .padding()
      .border(Color.black)
      .font(.largeTitle)
    }
  }
  
  // MARK: Example 06
  
  /// 여러 가지 스택을 조합하여 원하는 레이아웃을 구성할 수 있습니다.
  struct Example06: View {
    var body: some View {
      VStack {
        Text("도형 만들기")
          .font(.largeTitle)
          .fontWeight(.heavy)
        
        HStack {
          Text("둥근 모양").font(.title)
          Spacer()
        }
        
        ZStack {
          Rectangle()
            .frame(height: 10)
          
          HStack {
            Circle().fill(Color.yellow)
            Ellipse().fill(Color.green)
            Capsule().fill(Color.orange)
            RoundedRectangle(cornerRadius: 30).fill(Color.gray)
          }
        }
        
        HStack {
          Text("각진 모양").font(.title)
          Spacer()
        }
        
        ZStack {
          Rectangle().frame(height: 10)
          
          HStack {
            Color.red
            Rectangle().fill(Color.blue)
            RoundedRectangle(cornerRadius: 0).fill(Color.purple)
          }
        }
      }.padding()
    }
  }
}


// MARK: - Previews

struct Ch02_4_ViewLayout_Stack_Previews: PreviewProvider {
  static var previews: some View {
    Ch02_4_ViewLayout_Stack()
      .previewDisplayName("Sweet SwiftUI")
  }
}
