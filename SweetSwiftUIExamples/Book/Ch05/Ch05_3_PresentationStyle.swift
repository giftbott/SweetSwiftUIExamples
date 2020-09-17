//
//  Ch05_3_PresentationStyle.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch05_3_PresentationStyle: View {
  var body: some View {
    Example01()
  }
}

private extension Ch05_3_PresentationStyle {
  // MARK: Example 01
  
  /// presentationMode를 이용한 dismiss 예시
  struct Example01: View {
    @State private var showingSheet = false
    
    var body: some View {
      Button(action: { self.showingSheet.toggle() }) {
        Text("Present")
          .font(.title).foregroundColor(.blue)
      }
      .sheet(isPresented: $showingSheet,
             onDismiss: { print("Dismissed")},
             content: { Ch05_3_PresentationStyle.PresentedView() })
    }
  }
  
  struct PresentedView: View {
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
      Button(action: {
        if self.presentationMode.wrappedValue.isPresented {
          self.presentationMode.wrappedValue.dismiss()
        }
      }) {
        Text("Tap to Dismiss")
          .font(.title).foregroundColor(.red)
      }
    }
  }
  
  // MARK: Example 02
  
  /// Binding을 이용한 dissmiss 예시
  struct Example02: View {
    @State private var showingSheet = false
    
    var body: some View {
      Button(action: { self.showingSheet.toggle() }) {
        Text("Present")
          .font(.title).foregroundColor(.blue)
      }
      .sheet(isPresented: $showingSheet,
             onDismiss: { print("Dismissed")},
             content: {
              Ch05_3_PresentationStyle.PresentedViewWithBinding(isPresented: self.$showingSheet)
             })
    }
  }
  
  struct PresentedViewWithBinding: View {
    @Binding var isPresented: Bool
    
    var body: some View {
      Button(action: { self.isPresented.toggle() }) {
        Text("Tap to Dismiss")
          .font(.title).foregroundColor(.red)
      }
    }
  }
  
  
  // MARK: Example 03
  
  /// Popover 구현 예시
  struct Example03: View {
    @State var showingPopover = false
    
    var body: some View {
      VStack {
        Button(action: { self.showingPopover.toggle() }) {
          Text("Popover Button")
            .font(.largeTitle)
        }
      }
      .popover(isPresented: $showingPopover,
               attachmentAnchor: .point(.bottomTrailing),
               arrowEdge: .top,
               content: popoverContents)
    }
    
    private func popoverContents() -> some View {
      VStack(alignment: .leading) {
        HStack {
          Button(action: { self.showingPopover = false }) {
            Text("Cancel").foregroundColor(.red)
          }
          Spacer()
          Text("New Event").font(.headline)
          Spacer()
          Button("Add(+)") { }
        }
        Divider().padding(.bottom, 8)
        
        Text("Title")
        TextField("제목", text: .constant(""))
        Text("Contents")
        TextField("내용", text: .constant(""))
        Spacer()
      }
      .padding()
    }
  }
}


// MARK: - Previews

struct Ch05_3_PresentationStyle_Previews: PreviewProvider {
  static var previews: some View {
    Ch05_3_PresentationStyle()
      .previewDisplayName("Sweet SwiftUI")
  }
}
