//
//  Ch11_2_UIViewRepresentable.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import MapKit
import SwiftUI

struct Ch11_2_UIViewRepresentable: View {
  var body: some View {
    Example01()
  }
}

private extension Ch11_2_UIViewRepresentable {
  // MARK: Example 01
  
  /// UIViewRepresentable 프로토콜을 이용한 MKMapView 활용
  struct Example01: View {
    @State private var coordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
    let locations: [String: CLLocationCoordinate2D] = [
      "남산": CLLocationCoordinate2DMake(37.551416, 126.988194),
      "시청": CLLocationCoordinate2DMake(37.566308, 126.977948),
      "국회": CLLocationCoordinate2DMake(37.531830, 126.914187)
    ]
    
    var body: some View {
      ZStack(alignment: .bottom) {
        MapView(coordinate: coordinate)
        HStack(spacing: 30) {
          ForEach(["남산", "시청", "국회"], id: \.self) { location in
            Button(action: { self.coordinate = self.locations[location]! }) {
              Text(location)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            }
          }
        }.padding(.bottom, 40)
      }.edgesIgnoringSafeArea(.all)
    }
  }
}


fileprivate struct MapView: UIViewRepresentable {
  let coordinate: CLLocationCoordinate2D
  
  func makeUIView(context: Context) -> MKMapView {
    MKMapView()
  }
  func updateUIView(_ uiView: MKMapView, context: Context) {
    let camera = MKMapCamera(
      lookingAtCenter: coordinate,
      fromDistance: 2500,
      pitch: 45,
      heading: 0
    )
    uiView.setCamera(camera, animated: true)
  }
}



// MARK: - Previews

struct Ch11_2_UIViewRepresentable_Previews: PreviewProvider {
  static var previews: some View {
    Ch11_2_UIViewRepresentable()
      .previewDisplayName("Sweet SwiftUI")
  }
}
