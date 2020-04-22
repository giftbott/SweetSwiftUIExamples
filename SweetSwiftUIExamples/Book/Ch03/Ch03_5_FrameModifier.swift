//
//  Ch03_5_FrameModifier.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch03_5_FrameModifier: View {
  var body: some View {
    Example01()
  }
}

private extension Ch03_5_FrameModifier {
  // MARK: Example 01
  
  /// frame 수식어는 부모 뷰가 사용할 수 있는 크기를 제안하는 기능이며,
  /// 실제 뷰의 크기는 자식 뷰가 스스로 결정합니다.
  struct Example01: View {
    var body: some View {
      VStack {
        Text("Frame")
          .background(Color.yellow)
          .frame(width: 200, height: 100)
        
        Rectangle()
          .fill(Color.yellow)
          .frame(width: 200, height: 100)
      }
    }
  }
  
  // MARK: Example 02
  
  /// alignment 매개 변수로 정렬 위치를 결정합니다.
  struct Example02: View {
    var body: some View {
      HStack {
        Text("Frame").background(Color.yellow)
          .frame(width: 100, height: 100, alignment: .leading)
          .border(Color.red)
        
        Text("Frame").background(Color.yellow)
          .frame(width: 100, height: 100)
          .border(Color.red)
        
        Text("Frame").background(Color.yellow)
          .frame(width: 100, height: 100, alignment: .trailing)
          .border(Color.red)
      }
    }
  }
  
  // MARK: Example 03
  
  /// 고정된 크기가 아닌 크기에 대한 제약조건을 설정할 수 있습니다.
  struct Example03: View {
    var body: some View {
      HStack {
        Rectangle().fill(Color.red).frame(minWidth: 100)
        Rectangle().fill(Color.orange).frame(maxWidth: 15)
        
        Rectangle().fill(Color.yellow).frame(height: 150)
        Rectangle().fill(Color.green).frame(maxHeight: .infinity)
        
        Rectangle().fill(Color.blue)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        Rectangle().fill(Color.purple)
      }
      .frame(width: 300, height: 150)
    }
  }
  
  // MARK: Example 04
  
  /// fixedSize 미적용
  struct Example04: View {
    var body: some View {
      VStack {
        Text("Frame Modifier").font(.title).bold()
          .frame(width: 80, height: 30)
        Rectangle()
        Color.red
        Image("SwiftUI").resizable()
      }
    }
  }
  
  // MARK: Example 05
  
  /// fixedSize 적용 예시
  /// 이 수식어는 뷰가 이상적인 크기(idealSize)로 고정되게 합니다.
  /// idealWidth와 idealHeight를 직접 지정할 수도 있습니다.
  struct Example05: View {
    var body: some View {
      VStack {
        Text("Frame Modifier").font(.title).bold()
          .fixedSize()
          .frame(width: 80, height: 30)
        Rectangle()
//          .frame(idealWidth: 100)
          .fixedSize()
        Color.red
          .fixedSize()
        Image("SwiftUI").resizable()
          .fixedSize()
      }
    }
  }
  
  // MARK: Example 06
  
  /// 가로와 세로축에 대해 각각 따로 fixedSize를 적용할 수 있습니다.
  struct Example06: View {
    var body: some View {
      VStack(spacing: 100) {
        Group {
          Text("FixedSize를 적용하면 글자가 생략되지 않습니다.")
          
          Text("FixedSize를 적용하면 글자가 생략되지 않습니다.").font(.title)
            .fixedSize(horizontal: true, vertical: false)
          
          Text("FixedSize를 적용하면 글자가 생략되지 않습니다.").font(.title)
            .fixedSize(horizontal: false, vertical: true)
        }
        .font(.title)
        .frame(width: 150, height: 40)
      }
    }
  }
  
  // MARK: Example 07
  
  /// layoutPriority로 레이아웃에 대한 우선순위를 정할 수 있습니다.
  struct Example07: View {
    var body: some View {
      VStack(spacing: 20) {
        HStack {
          Color.red
          Color.green
          Color.blue
        }.frame(height: 40)
        
        HStack {
          Color.red.layoutPriority(1)
          Color.green
          Color.blue.layoutPriority(1)
        }.frame(height: 40)
        
        HStack {
          Color.red.layoutPriority(1)
          Color.green.frame(minWidth: 30)
          Color.blue.frame(maxWidth: 50).layoutPriority(1)
        }.frame(height: 40)
        
        HStack {
          Color.red.frame(width: 50)
          Color.green.layoutPriority(1)
          Color.blue.frame(maxWidth: 50).layoutPriority(1)
        }.frame(height: 40)
      }.padding()
    }
  }
}


// MARK: - Previews

struct Ch03_5_FrameModifier_Previews: PreviewProvider {
  static var previews: some View {
    Ch03_5_FrameModifier()
      .previewDisplayName("Sweet SwiftUI")
  }
}
