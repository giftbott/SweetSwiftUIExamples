//
//  Ch03_1_Button.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch03_1_Button: View {
  var body: some View {
    Example01()
  }
}

private extension Ch03_1_Button {  
  // MARK: Example 01
  
  /// 버튼은 생성 시 외형과 이벤트 발생 시 수행할 작업에 대해 정의해야 합니다.
  struct Example01: View {
    var body: some View {
      HStack(spacing: 20) {
        Button("Button") {
          print("Button 1")
        }
        Button(action: { print("Button 2") }) {
          Text("Button")
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
        }
        Button(action: { print("Button 3") }) {
          Circle()
            .stroke(lineWidth: 2)
            .frame(width: 80, height: 80)
            .overlay(Text("Button"))
        }
        .accentColor(.green)
      }
    }
  }
  
  // MARK: Example 02
  
  /// 버튼에서 이미지를 사용하면 기본 렌더링 모드가 template으로 적용됩니다.
  /// => iOS 14.0부터 렌더링 모드 기본값이 template에서 original로 변경
  
  struct Example02: View {
    var body: some View {
      HStack(spacing: 20) {
        Button(action: { print("Button 1") }) {
          Image("SwiftUI")
            .resizable()
            .frame(width: 120, height: 120)
        }
        Button(action: { print("Button 2") }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
            .font(.largeTitle)
        }
      }
      .padding()
    }
  }
  
  // MARK: Example 03
  
  /// 렌더링 모드를 직접 original로 변경하거나,
  /// PlainButtonStyle을 적용하면 이미지 본래의 색상 정보를 유지할 수 있습니다.
  struct Example03: View {
    var body: some View {
      HStack(spacing: 20) {
        Button(action: { print("Button 1") }) {
          Image("SwiftUI")
            .renderingMode(.original)
            .resizable()
            .frame(width: 120, height: 120)
        }
        Button(action: { print("Button 2") }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
            .font(.largeTitle)
        }
        .buttonStyle(PlainButtonStyle())
      }
      .padding()
    }
  }
  
  // MARK: Example 04
  
  /// 버튼에는 iOS를 기준으로 Default, Borderless, Plain 이렇게 세 가지 스타일이 있습니다.
  /// OS별로 사용 가능한 스타일이 다릅니다.
  struct Example04: View {
    var body: some View {
      VStack(spacing: 30) {
        Button("DefaultButtonStyle") {}
          .buttonStyle(DefaultButtonStyle())
        
        Button("BorderlessButtonStyle") {}
          .buttonStyle(BorderlessButtonStyle())
        
        Button("PlainButtonStyle") {}
          .buttonStyle(PlainButtonStyle())
      }
    }
  }
  
  // MARK: Example 05
  
  /// 버튼 대신 onTapGesture 수식어를 이용하는 것도 가능합니다.
  struct Example05: View {
    var body: some View {
      HStack {
        Image(systemName: "person.circle")
          .imageScale(.large)
          .onTapGesture { print("onTapGesture") }
        
        Button(action: { print("버튼") }) {
          Image(systemName: "person.circle")
            .imageScale(.large)
        }
      }
    }
  }
}


// MARK: - Previews

struct Ch03_1_Button_Previews: PreviewProvider {
  static var previews: some View {
    Ch03_1_Button()
      .previewDisplayName("Sweet SwiftUI")
  }
}
