//
//  Ch11_1_UIViewControllerRepresentable.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch11_1_UIViewControllerRepresentable: View {
  var body: some View {
    Example01()
  }
}

private extension Ch11_1_UIViewControllerRepresentable {
  // MARK: Example 01
  
  /// UIViewControllerRepresentable 프로토콜을 이용한
  /// UIImagePickerController 활용
  struct Example01: View {
    @State private var pickedImage: Image = Image(systemName: "photo")
    @State private var isPickerPresented: Bool = false
    
    var body: some View {
      VStack {
        pickedImage
          .resizable()
          .scaledToFit()
          .frame(width: 300, height: 300)
          .padding(.bottom)
          
        Button(action: { self.isPickerPresented.toggle() }) {
          Text("Show ImagePicker").bold()
        }
      }
      .sheet(isPresented: $isPickerPresented) {
        ImagePickerView(pickedImage: self.$pickedImage)
      }
    }
  }
}


fileprivate struct ImagePickerView: UIViewControllerRepresentable {
  @Binding var pickedImage: Image

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = context.coordinator
    imagePickerController.allowsEditing = true
    return imagePickerController
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
  }

  // MARK: Coordinator

  final class Coordinator: NSObject {
    let parent: ImagePickerView
    init(_ imagePickerView: ImagePickerView) {
      self.parent = imagePickerView
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}


// MARK: - Delegate

extension ImagePickerView.Coordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
  ) {
    let originalImage = info[.originalImage] as! UIImage
    let editedImage = info[.editedImage] as? UIImage
    let selectedImage = editedImage ?? originalImage
    parent.pickedImage = Image(uiImage: selectedImage)
    picker.dismiss(animated: true)
  }
}


// MARK: - Previews

struct Ch11_1_UIViewControllerRepresentable_Previews: PreviewProvider {
  static var previews: some View {
    Ch11_1_UIViewControllerRepresentable()
      .previewDisplayName("Sweet SwiftUI")
  }
}
