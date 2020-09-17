//
//  Ch10_3_TextField.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch10_3_TextField: View {
  var body: some View {
    Example01()
  }
}

private extension Ch10_3_TextField {
  // MARK: Example 01
  
  /// 텍스트 필드 사용 예시
  struct Example01: View {
    var body: some View {
      Form {
        TextField("플레이스 홀더", text: .constant(""))
        TextField("플레이스 홀더", text: .constant("텍스트"))
        
        TextField("", text: .constant("PlainTextFieldStyle"))
          .textFieldStyle(PlainTextFieldStyle())
        TextField("", text: .constant("RoundedBorderTextFieldStyle"))
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
    }
  }
  
  // MARK: Example 02
  
  /// bezel 또는 line 스타일 적용 예시
  /// => iOS 14.0에서는 적용되지 않습니다.
  struct Example02: View {
    var body: some View {
      Form {
        TextField("", text: .constant(".line borderStyle"))
          .onAppear { UITextField.appearance().borderStyle = .line }
      }
    }
  }
  
  // MARK: Example 03
  
  /// HStack을 이용한 이미지와 텍스트필드의 조합
  struct Example03: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
      Form {
        HStack {
          Image(systemName: "envelope").frame(width: 30)
          TextField("이메일", text: $email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
        HStack {
          Image(systemName: "lock").frame(width: 30)
          TextField("비밀번호", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
        HStack {
          Image(systemName: "envelope")
          TextField("이메일", text: $email)
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.gray.opacity(0.6), lineWidth: 1))
      }
    }
  }
  
  // MARK: Example 04
  
  /// formatter 매개 변수를 이용해 쉽게 형식을 지정해 줄 수 있습니다.
  struct Example04: View {
    @State private var name: PersonNameComponents = {
      var comp = PersonNameComponents()
      comp.givenName = "Steve"
      comp.familyName = "Jobs"
      return comp
    }()
    @State private var date: Date = Date()
    @State private var number: Double = 0.5
    
    var body: some View {
      let nameFormatter = PersonNameComponentsFormatter()
      nameFormatter.style = .short
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy.MM.dd"
      
      let numberFormatter = NumberFormatter()
      numberFormatter.numberStyle = .percent
      
      return Form {
        TextField("Name", value: $name, formatter: nameFormatter)
        TextField("Date", value: $date, formatter: dateFormatter)
        TextField("Number", value: $number, formatter: numberFormatter)
      }
      .textFieldStyle(RoundedBorderTextFieldStyle())
    }
  }
  
  // MARK: Example 05
  
  /// onEditingChanged는 편집 시작과 종료 시점에 호출되며,
  /// onCommit은 키보드의 리턴키를 눌렀을 때 호출됩니다.
  struct Example05: View {
    @State private var breed = ""
    @State private var name = ""
    @State private var isValidBreed = false
    @State private var isValidName = false
    
    var body: some View {
      Form {
        Section(header: Text("반려견 등록")) {
          TextField("견종", text: $breed, onEditingChanged: { editing in
            self.isValidBreed = editing ? false : !self.breed.isEmpty
          }) {
            self.breed = self.breed.trimmingCharacters(in: .whitespaces)
          }
          .overlay(validationImage(isValidBreed), alignment: .trailing)
          
          TextField("이름", text: $name, onEditingChanged: { editing in
            self.isValidName = editing ? false : !self.name.isEmpty
          }) {
            self.name = self.name.trimmingCharacters(in: .whitespaces)
          }
          .overlay(validationImage(isValidName), alignment: .trailing)
          
          
          if isValidBreed && isValidName {
            Button("등록!") { print("등록하기") }
              .frame(maxWidth: .infinity)
          }
        }
      }
    }
    
    private func validationImage(_ isValid: Bool) -> some View {
      Image(systemName: isValid ? "checkmark" : "pencil")
        .foregroundColor(isValid ? Color.green : Color.primary)
        .font(Font.system(.headline))
    }
  }
  
  // MARK: Example 06
  
  /// 텍스트 필드에 적용할 수 있는 여러 가지 수식어를 확인해 보세요.
  struct Example06: View {
    @State private var text1 = "ABCDEFGHIJKLMN OPQRSTU VWXYZ"
    
    var body: some View {
      Form {
        TextField("", text: $text1)
//          .font(.title)
//          .textContentType(.nickname)
//          .keyboardType(.default)
//          .autocapitalization(.sentences)
//          .disableAutocorrection(nil)
//          .truncationMode(.tail)
//          .minimumScaleFactor(0.9)
//          .allowsTightening(true)
//          .flipsForRightToLeftLayoutDirection(true)
      }
    }
  }
  
  // MARK: Example 07
  
  /// 시큐어 필드를 이용해 텍스트 필드의 입력 값을 숨길 수 있습니다.
  struct Example07: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
      Form {
        HStack {
          Image(systemName: "envelope").frame(width: 30)
          TextField("이메일", text: $email)
        }
        HStack {
          Image(systemName: "lock").frame(width: 30)
          SecureField("비밀번호", text: $password)
        }
      }
      .textFieldStyle(RoundedBorderTextFieldStyle())
    }
  }
}


// MARK: - Previews

struct Ch10_3_TextField_Previews: PreviewProvider {
  static var previews: some View {
    Ch10_3_TextField()
      .previewDisplayName("Sweet SwiftUI")
  }
}
