//
//  Ch05_2_Alert_ActionSheet.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch05_2_Alert_ActionSheet: View {
  var body: some View {
    Example01()
  }
}

private extension Ch05_2_Alert_ActionSheet {
  // MARK: Example 01
  
  /// Alert 출력 예시
  struct Example01: View {
    @State private var showingAlert = false
    
    var body: some View {
      Button(action: { self.showingAlert.toggle() }) {
        Text("Alert")
      }
      .alert(isPresented: $showingAlert) {
        Alert(
          title: Text("제목"),
          message: Text("내용"),
          primaryButton: .default(Text("확인"), action: { print("확인") }),
          secondaryButton: .cancel(Text("취소"))
        )
      }
    }
  }
  
  
  // MARK: Example 02
  
  /// ActionSheet 출력 예시
  struct Example02: View {
    @State private var showingActionSheet = false
    
    var body: some View {
      Button(action: { self.showingActionSheet.toggle() }) {
        Text("ActionSheet")
      }
      .actionSheet(isPresented: $showingActionSheet) {
        ActionSheet(
          title: Text("제목"),
          message: Text("내용"),
          buttons: [
            .default(Text("버튼1")),
            .default(Text("버튼2")),
            .destructive(Text("버튼3")),
            .cancel(Text("취소")),
          ]
        )
      }
    }
  }
}


// MARK: - Previews

struct Ch05_2_Alert_ActionSheet_Previews: PreviewProvider {
  static var previews: some View {
    Ch05_2_Alert_ActionSheet()
      .previewDisplayName("Sweet SwiftUI")
  }
}
