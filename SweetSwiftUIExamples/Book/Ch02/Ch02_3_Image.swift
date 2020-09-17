//
//  Ch02_3_Image.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02_3_Image: View {
  var body: some View {
    Example01()
  }
}

private extension Ch02_3_Image {
  // MARK: Example 01
  
  /// 프레임 수식어만으로는 이미지의 크기가 변화하지 않습니다.
  struct Example01: View {
    var body: some View {
      HStack {
        Image("SwiftUI")
        Image("SwiftUI")
          .frame(width: 50, height: 50)
        Image("SwiftUI")
          .frame(width: 200, height: 200)
      }
    }
  }

  // MARK: Example 02
  
  /// resizable 수식어는 부모 뷰가 제공하는 공간에 맞게 이미지 크기를 조정합니다.
  /// 비율과 크기는 콘텐츠 모드에 따라 달라질 수 있습니다.
  struct Example02: View {
    var body: some View {
      VStack(spacing: 80) {
        HStack {
          Image("SwiftUI")
          Image("SwiftUI").resizable()
            .frame(width: 50, height: 50)
          Image("SwiftUI").resizable()
            .frame(width: 200, height: 200)
        }
        
        HStack {
          Image("SwiftUI")
            .resizable(capInsets: .init(top: 0, leading: 50, bottom: 0, trailing: 0))
            .frame(width: 150, height: 150)
          
          Image("SwiftUI")
            .resizable(resizingMode: .tile)
            .frame(width: 150, height: 150)
        }
      }
    }
  }
  
  // MARK: Example 03
  
  /// scaledToFit, scaledToFill 수식어를 이용해 콘텐츠 모드를 변경할 수 있습니다.
  struct Example03: View {
    var body: some View {
      HStack(spacing: 30) {
        Image("SwiftUI").resizable()
          .frame(width: 100, height: 150)
        
        Image("SwiftUI").resizable()
          .scaledToFit()
          .frame(width: 100, height: 150)
        
        Image("SwiftUI").resizable()
          .scaledToFill()
          .frame(width: 100, height: 150)
          .clipped()
      }
    }
  }
  
  // MARK: Example 04
  
  /// aspectRatio를 통해 세부적인 비율 조정이 가능합니다.
  struct Example04: View {
    var body: some View {
      HStack(spacing: 30) {
        Image("SwiftUI").resizable()
          .aspectRatio(CGSize(width: 1.6, height: 1), contentMode: .fit)
          .frame(width: 150, height: 150)
        
        Image("SwiftUI").resizable()
          .aspectRatio(0.7, contentMode: .fill)
          .frame(width: 150, height: 150)
          .clipped()
      }
    }
  }
  
  // MARK: Example 05
  
  /// clipShape - 지정한 Shape의 모습으로 이미지 잘라내기
  struct Example05: View {
    var body: some View {
      HStack(spacing: 20) {
        Image("SwiftUI").clipShape(Circle())
        Image("SwiftUI").clipShape(
          Rectangle().inset(by: 10)
        )
        Image("SwiftUI").clipShape(
          Ellipse().path(in: CGRect(x: 10, y: 10, width: 80, height: 110))
        )
      }
    }
  }
  
  // MARK: Example 06
  
  /// original / template 렌더링 모드를 지정해 줄 수 있습니다.
  struct Example06: View {
    var body: some View {
      HStack {
        Image("SwiftUI")
        Image("SwiftUI").renderingMode(.original)
        Image("SwiftUI").renderingMode(.template)
      }
      .foregroundColor(.red)
    }
  }
  
  // MARK: Example 07
  
  /// SF Symbol은 Image(systemName:) 생성자를 사용합니다.
  struct Example07: View {
    var body: some View {
      HStack(spacing: 20) {
        Image(systemName: "star.circle")
        Image(systemName: "star.circle.fill")
      }
    }
  }
  
  // MARK: Example 08
  
  /// imageScale을 이용하면 크기를 변경할 수 있습니다.
  struct Example08: View {
    var body: some View {
      HStack(spacing: 30) {
        Image(systemName: "book.fill").imageScale(.small)
          .foregroundColor(.red)
        Image(systemName: "book.fill").imageScale(.medium)
          .foregroundColor(.green)
        Image(systemName: "book.fill").imageScale(.large)
          .foregroundColor(.blue)
      }
    }
  }
  
  // MARK: Example 09
  
  /// font를 이용해 심벌의 크기를 조절 가능합니다.
  struct Example09: View {
    var body: some View {
      HStack(spacing: 30) {
        Image(systemName: "speaker.3").font(.body)
        Image(systemName: "speaker.3").font(.title)
        Image(systemName: "speaker.3").font(.system(size: 40))
        Image(systemName: "speaker.3").imageScale(.large).font(.system(size: 40))
      }
    }
  }
  
  // MARK: Example 10
  
  /// fontWeight를 이용해 심벌의 굵기를 조절 가능합니다.
  struct Example10: View {
    var body: some View {
      HStack(spacing: 30) {
        Image(systemName: "arrow.up").font(Font.title.weight(.black))
        Image(systemName: "arrow.left").font(Font.title.weight(.semibold))
        Image(systemName: "arrow.down").font(Font.title.weight(.light))
        Image(systemName: "arrow.right").font(Font.title.weight(.ultraLight))
      }
    }
  }
}


// MARK: - Previews

struct Ch02_3_Image_Previews: PreviewProvider {
  static var previews: some View {
    Ch02_3_Image()
      .previewDisplayName("Sweet SwiftUI")
  }
}
