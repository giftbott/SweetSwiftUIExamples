//
//  Ch10_2_Picker.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch10_2_Picker: View {
  var body: some View {
    Example01()
  }
}

private extension Ch10_2_Picker {
  // MARK: Example 01
  
  /// 피커는 다양한 선택지 중에서 하나의 값을 선택해야 할 때 사용하는 컨트롤이며,
  /// iOS에서 단독으로 피커를 사용했을 때는 기본 스타일로 WheelPickerStyle이 사용됩니다.
  /// => iOS 14.0부터는 iOS에서 피커 제목이 나타나지 않습니다.
  struct Example01: View {
    @State private var selection = 2
    
    var body: some View {
      Picker("예약 인원", selection: $selection) {
        HStack {
          Image(systemName: "person.fill")
          Text("1인")
        }.tag(1)
        
        HStack {
          Image(systemName: "person.2.fill")
          Text("2인")
        }.tag(2)
        
        HStack {
          Image(systemName: "person.3.fill")
          Text("3인")
        }.tag(3)
      }
      .padding(.horizontal)
    }
  }
  
  // MARK: Example 02
  
  /// ForEach를 이용하면 피커 선택지를 동적으로 정의할 수 있습니다.
  struct Example02: View {
    @State private var city: City = .서울

    enum City: String, CaseIterable {
      case 서울, 대전, 대구, 부산, 제주
    }
    
    var body: some View {
      Picker("도시", selection: $city) {
        ForEach(City.allCases, id: \.self) {
          Text($0.rawValue).tag($0)
        }
      }
      .padding(.horizontal)
    }
  }
  
  // MARK: Example 03
  
  /// labelsHidden 수식어를 이용해 피커의 레이블을 숨길 수 있습니다.
  /// => iOS 14.0에서는 이 수식어를 사용하지 않아도 무방합니다.
  struct Example03: View {
    var body: some View {
      Ch10_2_Picker.Example02()
        .background(RoundedRectangle(cornerRadius: 12)
          .stroke(Color.blue, lineWidth: 1))
        .labelsHidden()
    }
  }
  
  // MARK: Example 04
  
  /// SegmentedPickerStyle을 지정하면 UISegmentedControl 클래스가 사용됩니다.
  struct Example04: View {
    var body: some View {
      Ch10_2_Picker.Example02()
        .pickerStyle(SegmentedPickerStyle())
//        .onAppear {
//          UISegmentedControl.appearance().selectedSegmentTintColor = .systemRed
//        }
    }
  }
  
  
  struct PickerInForm: View {
    @State private var autoLock = "1 Minute"
    private let autoLockOptions = ["30 Seconds", "1 Minute", "2 Minute", "5 Minute", "Never"]
    
    var body: some View {
      Picker("자동 잠금", selection: $autoLock) {
        ForEach(autoLockOptions, id: \.self) {
          Text($0).tag($0)
        }
      }
    }
  }
  
  // MARK: Example 05
  
  /// 폼에서는 피커가 다른 스타일로 동작하게 됩니다.
  struct Example05: View {
    var body: some View {
      NavigationView {
        Form {
          Ch10_2_Picker.PickerInForm()
        }
      }
    }
  }
  
  // MARK: Example 06
  
  /// 각 스타일에 따라 피커가 폼에서 어떻게 보이는지 확인해 보세요.
  struct Example06: View {
    var body: some View {
      NavigationView {
        Form {
          Ch10_2_Picker.PickerInForm()
          Ch10_2_Picker.PickerInForm()
            .pickerStyle(WheelPickerStyle())
          Ch10_2_Picker.PickerInForm()
            .pickerStyle(SegmentedPickerStyle())
        }
        .navigationBarTitle("폼 - 피커 스타일")
      }
    }
  }
}


// MARK: - Previews

struct Ch10_2_Picker_Previews: PreviewProvider {
  static var previews: some View {
    Ch10_2_Picker()
      .previewDisplayName("Sweet SwiftUI")
  }
}
