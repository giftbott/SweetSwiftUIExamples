//
//  Ch06_2_CustomStyle.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch06_2_CustomStyle: View {
  var body: some View {
    Example01()
  }
}

private extension Ch06_2_CustomStyle {  
  // MARK: Example 01
  
  /// ButtonStyle은 버튼의 눌림 상태에 따라 버튼 외형을 정의하기 위한 프로토콜입니다.
  struct Example01: View {
    var body: some View {
      VStack(spacing: 20) {
        Button("기본 버튼 스타일") { print("기본 버튼") }
        
        Button("커스텀 버튼 스타일1") { print("커스텀 버튼1") }
          .buttonStyle(Ch06_2_CustomStyle.CustomButtonStyle(backgroundColor: .green))
        
        Button("커스텀 버튼 스타일2") { print("커스텀 버튼2") }
          .buttonStyle(Ch06_2_CustomStyle.CustomButtonStyle(cornerRadius: 20))
      }
    }
  }

  // MARK: 01 - ButtonStyle Protocol
  
  struct CustomButtonStyle: ButtonStyle {
    var backgroundColor: Color = .blue
    var cornerRadius: CGFloat = 6
    
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: cornerRadius)
          .fill(backgroundColor))
        .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
  }
  
  
  
  
  // MARK: Example02
  
  /// PrimitiveButtonStyle은 버튼 이벤트의 발생 조건과 시점을 제어할 때 사용하는 프로토콜입니다.
  struct Example02: View {
    var body: some View {
      VStack(spacing: 20) {
        Button("기본 버튼 스타일") { print("기본 버튼") }
        
        Button("커스텀 버튼 스타일1") { print("커스텀 버튼1") }
          .buttonStyle(Ch06_2_CustomStyle.CustomPrimitiveButtonStyle())
        
        Button("커스텀 버튼 스타일2") { print("커스텀 버튼2") }
          .buttonStyle(Ch06_2_CustomStyle.CustomPrimitiveButtonStyle(minimumDuration: 1))
      }
    }
  }
  
  // MARK: 02 - PrimitiveButtonStyle Protocol

  struct CustomPrimitiveButtonStyle: PrimitiveButtonStyle {
    var minimumDuration = 0.5
    @GestureState private var isPressed = false
    
    func makeBody(configuration: Configuration) -> some View {
      let longPress = LongPressGesture(minimumDuration: minimumDuration)
        .updating($isPressed) { value, state, _ in
          state = value
        }.onEnded { _ in
          configuration.trigger()
        }
      return configuration.label
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
        .scaleEffect(isPressed ? 0.8 : 1.0)
        .opacity(isPressed ? 0.6 : 1.0)
        .gesture(longPress)
    }
  }
  
  
  // MARK: Example03
  
  /// ToggleStyle은 on, off 상태를 언제 변경할 것인지, 또 이에 따라 어떻게 보여질지 정의하기 위한 프로토콜입니다.
  struct Example03: View {
    @State private var isOn = true
    
    var body: some View {
      VStack(spacing: 20) {
        Toggle("기본 토글", isOn: $isOn)
        
        Toggle("커스텀 토글", isOn: $isOn)
          .toggleStyle(Ch06_2_CustomStyle.CustomToggleStyle())
        Image(systemName: "ADFS")
      }
      .font(.headline)
    }
  }
  
  // MARK: 03 - ToggleStyle Protocol
  
  struct CustomToggleStyle: ToggleStyle {
    let size: CGFloat = 30
    
    func makeBody(configuration: Configuration) -> some View {
      let isOn = configuration.isOn
      return HStack {
        configuration.label
        
        Spacer()
        
        ZStack(alignment: isOn ? .top : .bottom) {
          Capsule()
            .fill(isOn ? Color.green : Color.red)
            .frame(width: size, height: size * 2)
          
          Circle()
            .frame(width: size - 2, height: size - 2)
            .onTapGesture {
              withAnimation {
                configuration.isOn.toggle()
              }
          }
        }
      }
    }
  }
}


// MARK: - Previews

struct Ch06_2_CustomStyle_Previews: PreviewProvider {
  static var previews: some View {
    Ch06_2_CustomStyle()
      .previewDisplayName("Sweet SwiftUI")
  }
}
