//
//  Ch10_1_Form.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch10_1_Form: View {
  var body: some View {
    Example01()
  }
}

private extension Ch10_1_Form {
  // MARK: Example 01
  
  /// 폼은 데이터 입력에 사용되는 다양한 컨트롤을 섹션을 이용해 그룹화하여 표현하기 위한 컨테이너 뷰입니다.
  /// 내부적으로는 리스트가 사용됩니다.
  /// => 14.0부터는 InsetGroupedListStyle이 기본값으로 적용됩니다.
  struct Example01: View {
    @State private var brightness: CGFloat = 0.5
    @State private var isTrueTone = true
    @State private var canRaiseToWake = true
    @State private var autoLock = "30 Seconds"
    private let autoLockOptions = ["30 Seconds", "2 Minute", "Never"]
    
    var body: some View {
      NavigationView {
        Form {
          Section(
            header: Text("밝기"),
            footer: Text("iPhone 디스플레이를 주변광에 맞춰 색상이 다른 환경에서도 일관적으로 보이도록 자동으로 조정합니다.")
          ) {
            Slider(
              value: $brightness,
              minimumValueLabel: Image(systemName: "sun.min.fill"),
              maximumValueLabel: Image(systemName: "sun.max.fill")
            ) { Text("밝기 조절") }
            Toggle("True Tone", isOn: $isTrueTone)
          }
          Section {
            Picker("자동 잠금", selection: $autoLock) {
              ForEach(autoLockOptions, id: \.self) {
                Text($0)
              }
            }
            Toggle("들어서 깨우기", isOn: $canRaiseToWake)
          }
        }
        .navigationBarTitle("디스플레이 및 밝기", displayMode: .inline)
      }
    }
  }
   
  // MARK: Example 02
  
  /// 폼에서 여러 가지 뷰와 컨트롤이 어떤 식으로 표현되는지 확인해 보세요.
  struct Example02: View {
    var body: some View {
      NavigationView {
        Form {
          Section(header: Text("뷰").font(.headline)) {
            Text("텍스트")
            Image(systemName: "gear").font(.title)
            Rectangle()
            Color.gray
          }
          Section(header: Text("컨트롤").font(.headline)) {
            Button("버튼") {}
            TextField("플레이스 홀더", text: .constant("텍스트필드"))
              .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("플레이스 홀더", text: .constant("시큐어필드"))
            Slider(value: .constant(0.5))
            Toggle("토글", isOn: .constant(true))
            Stepper("스텝퍼", onIncrement: {}, onDecrement: {})
            Picker("피커", selection: .constant("옵션")) { Text("옵션").tag("옵션") }
            DatePicker(selection: .constant(Date())) { Text("DatePicker") }
          }
        }
        .navigationBarTitle("폼 - 뷰 & 컨트롤")
      }
    }
  }
}


// MARK: - Previews

struct Ch10_1_Form_Previews: PreviewProvider {
  static var previews: some View {
    Ch10_1_Form()
      .previewDisplayName("Sweet SwiftUI")
  }
}
