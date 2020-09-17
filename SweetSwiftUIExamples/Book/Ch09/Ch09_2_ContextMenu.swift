//
//  Ch09_2_ContextMenu.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch09_2_ContextMenu: View {
  var body: some View {
    Example01()
  }
}

private extension Ch09_2_ContextMenu {
  // MARK: Example 01
  
  /// 컨텍스트 메뉴 활용 예시
  struct Example01: View {
    struct ToDo {
      let id: Int
      let title: String = "To Do"
      var isCompleted: Bool = false
      init(id: Int) { self.id = id }
    }
    
    @State private var toDoList = Array(1...10).map(ToDo.init(id:))
    
    var body: some View {
      List(Array(toDoList.enumerated()), id: \.offset) {
        (index, toDo) in
        HStack {
          Text("\(toDo.title) \(toDo.id)")
          Spacer()
          Text(toDo.isCompleted ? "✅" : "")
        }
        .font(.title)
        .frame(height: 50)
        .contextMenu {
          Button("완료") { self.toDoList[index].isCompleted = true }
          Button("삭제") { self.toDoList.remove(at: index) }
        }
      }
    }
  }

  // MARK: Example 02
  
  /// 메뉴 아이템에는 텍스트와 이미지를 함께 활용할 수 있으며,
  /// 메뉴 개수도 상황에 따라 유동적으로 변경할 수 있습니다.
  /// => iOS 14.0에서 애니메이션 버그가 있습니다.
  struct Example02: View {
    @State private var rotation: Double = 0
    @State private var fillColor: Color = .blue
    
    var body: some View {
      RoundedRectangle(cornerRadius: 20)
        .fill(fillColor)
        .hueRotation(Angle(degrees: rotation))
        .frame(width: 180, height: 180)
        .rotationEffect(Angle(degrees: rotation))
        .animation(.default)
        .contextMenu { contextMenu }
    }
    
    var contextMenu: some View {
      VStack {
        if rotation < 180 {
          Button(action: { self.rotation += 90 }) {
            Text("90도 우회전")
            Image(systemName: "rotate.right.fill")
          }
        }
        if rotation > -180 {
          Button(action: { self.rotation -= 90 }) {
            Text("90도 좌회전")
            Image(systemName: "rotate.left.fill")
          }
        }
        Button(action: {
          let color = [Color.red, Color.green, Color.blue].randomElement()!
          self.fillColor = color
        }) {
          Text("색상 변경")
          Image(systemName: "rectangle.fill")
        }
      }
    }
  }
  
  
  // MARK: Example 03
  
  /// ContextMenu 타입을 통한 생성 예시 (Example 02와 동일한 내용)
  ///
  struct Example03: View {
    @State private var rotation: Double = 0
    @State private var fillColor: Color = .blue
    
    var body: some View {
      let contextMenu: ContextMenu? = ContextMenu {
        Button(action: { self.rotation += 90 }) {
          Text("90도 우회전")
          Image(systemName: "rotate.right.fill")
        }
        Button(action: { self.rotation -= 90 }) {
          Text("90도 좌회전")
          Image(systemName: "rotate.left.fill")
        }
        Button(action: {
          let color = [Color.red, Color.green, Color.blue].randomElement()!
          self.fillColor = color
        }) {
          Text("색상 변경")
          Image(systemName: "rectangle.fill")
        }
      }
      
      return RoundedRectangle(cornerRadius: 20)
        .fill(fillColor)
        .frame(width: 150, height: 150)
        .rotationEffect(Angle(degrees: rotation))
        .animation(.default)
        .contextMenu(contextMenu)
    }
  }
}


// MARK: - Previews

struct Ch09_2_ContextMenu_Previews: PreviewProvider {
  static var previews: some View {
    Ch09_2_ContextMenu()
      .previewDisplayName("Sweet SwiftUI")
  }
}
