//
//  Ch03_4_GeometryReader.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch03_4_GeometryReader: View {
  var body: some View {
    Example01()
  }
}

private extension Ch03_4_GeometryReader {
  // MARK: Example 01
  
  /// 지오메트리 리더는 주어진 공간 내에서 가능한 최대 크기를 가집니다.
  /// 자식 뷰가 하나만 사용되었을 때는 중앙에 위치하게 됩니다.
  /// => iOS 14.0부터 뷰 하나일 때도 좌상단에 위치합니다.
  struct Example01: View {
    var body: some View {
      GeometryReader { _ in
        Circle().fill(Color.purple)
          .frame(width: 200, height: 200)
          .overlay(Text("Center").font(.title))
      }.background(Color.gray)
    }
  }
  
  // MARK: Example 02
  
  /// 지오메트리 리더는 자식 뷰들이 ZStack과 같이 계층 구조를 이루며,
  /// 둘 이상 사용되었을 때는 좌상단(TopLeading)을 기준으로 정렬됩니다.
  struct Example02: View {
    var body: some View {
      GeometryReader { _ in
        Circle().fill(Color.blue)
          .frame(width: 350, height: 350)
        Circle().fill(Color.orange)
          .frame(width: 280, height: 280)
        Circle().fill(Color.purple)
          .frame(width: 200, height: 200)
      }
      .background(Color.gray)
    }
  }
  
  // MARK: Example 03
  
  /// 지오메트리 프락시를 통해 부모 뷰의 크기와 안전 영역에 대한 정보를 얻을 수 있습니다.
  /// => iOS 14부터는 GeometryReader가 직접 안전 영역에 맞닿은 면에 한해 그 크기를 가져옵니다.
  /// 즉, top은 다른 뷰에 접해있고 bottom만 안전 영역에 닿아 있다면 top은 0이고 bottom만 알맞은 값을 가집니다.
  struct Example03: View {
    var body: some View {
      GeometryReader { geometry in
        Text("Geometry Reader")
          .font(.largeTitle).bold()
          .position(x: geometry.size.width / 2,
                    y: geometry.safeAreaInsets.top)
        
        VStack {
          Text("Size").bold()
          Text("width : \(Int(geometry.size.width))")
          Text("height : \(Int(geometry.size.height))")
        }
        .position(x: geometry.size.width / 2, y: geometry.size.height / 2.5)
        
        VStack {
          Text("SafeAreaInsets").bold()
          Text("top : \(Int(geometry.safeAreaInsets.top))")
          Text("bottom : \(Int(geometry.safeAreaInsets.bottom))")
        }
        .position(x: geometry.size.width / 2, y: geometry.size.height / 1.4)
      }
      .font(.title)
//      .frame(height: 500)
      .border(Color.green, width: 5)
    }
  }
  
  // MARK: Example 04
  
  /// 지오메트리 프락시를 이용해 원하는 좌표 정보를 얻을 수 있습니다.
  struct Example04: View {
    var body: some View {
      HStack {
        Rectangle().fill(Color.yellow)
          .frame(width: 30)
        
        VStack {
          Rectangle().fill(Color.blue)
            .frame(height: 200)
          
          GeometryReader {
            self.contents(geometry: $0)
              .position(x: $0.size.width / 2, y: $0.size.height / 2)
          }
          .background(Color.green)
          .border(Color.red, width: 4)
        }
        .coordinateSpace(name: "VStackCS")
      }
      .coordinateSpace(name: "HStackCS")
    }
    
    func contents(geometry g: GeometryProxy) -> some View {
      VStack {
        Text("Local").bold()
        Text(stringFormat(for: g.frame(in: .local).origin)).padding(.bottom)
        
        Text("Global").bold()
        Text(stringFormat(for: g.frame(in: .global).origin)).padding(.bottom)
        
        Text("Named VStackCS").bold()
        Text(stringFormat(for: g.frame(in: .named("VStackCS")).origin))
          .padding(.bottom)
        
        Text("Named HStackCS").bold()
        Text(stringFormat(for: g.frame(in: .named("HStackCS")).origin))
      }
    }
    
    func stringFormat(for point: CGPoint) -> String {
      String(format: "(x: %.f, y: %.f)", arguments: [point.x, point.y])
    }
  }
}


// MARK: - Previews

struct Ch03_4_GeometryReader_Previews: PreviewProvider {
  static var previews: some View {
    Ch03_4_GeometryReader()
      .previewDisplayName("Sweet SwiftUI")
  }
}
