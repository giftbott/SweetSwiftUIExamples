//
//  Ch07_1_ScrollView.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch07_1_ScrollView: View {
  var body: some View {
    Example01()
  }
}

private extension Ch07_1_ScrollView {
  // MARK: Example 01
  
  /// 스크롤뷰는 스크롤 방향으로 가능한 최대 크기만큼 확장하려는 성질을 가지고 있으며,
  /// 직교 방향으로는 자식 뷰의 크기만큼만 차지합니다.
  struct Example01: View {
    var body: some View {
      ScrollView(.vertical) {
        Text("스크롤뷰")
          .font(.largeTitle)
          .bold()
      }
      .background(Color.green)
    }
  }
  
  
  // MARK: Example 02
  
  /// 세로축과 가로축 스크롤뷰 구현 예시
  struct Example02: View {
    var body: some View {
      GeometryReader { geometry in
        VStack {
          Text("Vertical ScrollView").font(.largeTitle)
          ScrollView {
            ForEach(0..<10) { i in
              Circle()
                .fill(Color(white: 0.2 + (0.8 * Double(i) / 10)))
                .frame(width: 80, height: 80)
            }
            .frame(width: geometry.size.width / 2)
          }
          .frame(height: geometry.size.height / 2)
          .padding(.bottom)
          
          Text("Horizontal ScrollView").font(.largeTitle)
          ScrollView(.horizontal) {
            HStack {
              ForEach(0..<10) { i in
                RoundedRectangle(cornerRadius: 10)
                  .fill(Color.yellow)
                  .frame(width: 100, height: 100)
                  .scaleEffect(1 - (0.7 * CGFloat(i) / 10))
              }
            }
            .frame(height: geometry.size.height / 5)
            .padding(.horizontal)
          }
        }
      }
    }
  }
  
  
  // MARK: Example 03
  
  /// VStack과 세로축 스크롤뷰의 결과 비교
  /// 세로축 스크롤뷰에서는 Color의 세로축 크기가 제한됩니다.
  struct Example03: View {
    var body: some View {
      HStack {
        VStack {
          Color.red
          Color.green
          Color.blue
        }
        
        ScrollView {
          Color.red
          Color.green
          Color.blue
        }
      }
    }
  }
  
  // MARK: Example 04
  
  /// HStack과 가로축 스크롤뷰의 결과 비교
  /// 가로축 스크롤뷰에서는 Color의 가로축 크기가 제한됩니다.
  struct Example04: View {
    var body: some View {
      VStack {
        HStack {
          Color.red
          Color.green
          Color.blue
        }
        
        ScrollView(.horizontal) {
          HStack {
            Color.red
            Color.green
            Color.blue
          }
        }
      }
    }
  }
  
  // MARK: Example 05
  
  /// 스크롤뷰는 내부에서 스크롤 방향으로 fixedSize 수식어가 적용된 것처럼 동작합니다.
  /// VStack과 HStack에 fixedSize를 적용한 것과 비교해 보세요.
  struct Example05: View {
    var body: some View {
      HStack {
        ScrollView {
          Color.red
          Color.green
          Color.blue
        }
        
        VStack {
          Color.red
          Color.green
          Color.blue
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxHeight: .infinity, alignment: .top)
        
        ScrollView(.horizontal) {
          HStack {
            Color.red
            Color.green
            Color.blue
          }
        }
        
        HStack {
          Color.red
          Color.green
          Color.blue
        }
        .fixedSize(horizontal: true, vertical: false)
        .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
  }
  
  // MARK: Example 06
  
  /// 지오메트리 리더를 이용해 스크롤뷰의 ContentOffset 정보를 계산할 수 있습니다.
  struct Example06: View {
    var body: some View {
      ScrollView {
        ForEach(0..<10) { _ in
          GeometryReader {
            Rectangle()
              .fill(self.color(from: $0))
          }
          .frame(width: 150, height: 150)
        }
      }
    }
    
    private func color(from proxy: GeometryProxy) -> Color {
      let yOffset = proxy.frame(in: .global).minY - 44
      let color = min(1, 0.2 + Double(yOffset / 1000))
      return Color(hue: color, saturation: color, brightness: color)
    }
  }
  
  
  
  // MARK: Example 07
  
  /// 스크롤뷰의 페이징은 직접 구현하거나 UIScrollView의 외형 프록시를 이용해 구현 가능합니다.
  struct Example07: View {
    var body: some View {
      let colors: [Color] = [.red, .green, .blue]
      return GeometryReader { proxy in
        ScrollView(.horizontal) {
          HStack(spacing: 0) {
            ForEach(colors.indices) { index in
              Circle()
                .fill(colors[index])
                .overlay(Text("\(index) 페이지")
                  .font(.largeTitle)
                  .foregroundColor(.white))
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
          }
        }
      }.onAppear {
        UIScrollView.appearance().isPagingEnabled = true
      }
    }
  }
}


// MARK: - Previews

struct Ch07_1_ScrollView_Previews: PreviewProvider {
  static var previews: some View {
    Ch07_1_ScrollView()
      .previewDisplayName("Sweet SwiftUI")
  }
}
