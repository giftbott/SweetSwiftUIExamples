//
//  Ch11_3_PreviewInUIKit.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch11_3_PreviewInUIKit: View {
  var body: some View {
//    ViewController_Previews()
    MyView_Previews()
  }
}

  // MARK: Example 01

/// UIViewControllerRepresentable 프로토콜을 이용하면
/// UIViewController에 대해서도 프리뷰를 활용할 수 있습니다.
final class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let backgroundView = UIView()
    backgroundView.frame.size = view.frame.size.applying(.init(scaleX: 0.6, y: 0.3))
    backgroundView.center = view.center
    backgroundView.backgroundColor = .darkGray
    view.addSubview(backgroundView)
    
    let label = UILabel()
    label.text = "Hello, SwiftUI!"
    label.font = .preferredFont(forTextStyle: .title1)
    label.textColor = .white
    label.sizeToFit()
    label.center = view.center
    view.addSubview(label)
  }
}

struct ViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewController_Previews()
  }
}
extension ViewController_Previews: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> ViewController {
    ViewController()
  }
  func updateUIViewController(_ uiViewController: ViewController, context: Context) {
  }
}


// MARK: Example 02

/// UIViewRepresentable 프로토콜을 이용하면
/// UIView에 대해서도 프리뷰를 활용할 수 있습니다.
final class MyView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)

    let qrcodeSymbol = UIImage(systemName: "qrcode")?.applyingSymbolConfiguration(
      .init(pointSize: 80, weight: .bold)
    )
    let qrcodeImageView = UIImageView(image: qrcodeSymbol)
    qrcodeImageView.center = center.applying(.init(translationX: 0, y: -50))
    addSubview(qrcodeImageView)
    
    let barcodeSymbol = UIImage(systemName: "barcode")?.applyingSymbolConfiguration(
      .init(pointSize: 80, weight: .bold)
    )
    let barcodeImageView = UIImageView(image: barcodeSymbol)
    barcodeImageView.center = center.applying(.init(translationX: 0, y: 50))
    addSubview(barcodeImageView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    MyView_Previews()
      .previewLayout(.fixed(width: 200, height: 250))
  }
}
extension MyView_Previews: UIViewRepresentable {
  func makeUIView(context: Context) -> MyView {
    MyView(frame: CGRect(x: 0, y: 0, width: 200, height: 250))
  }
  func updateUIView(_ uiViewController: MyView, context: Context) { }
}

