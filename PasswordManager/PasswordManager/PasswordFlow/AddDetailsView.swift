//
//  AddDetailsView.swift
//  PasswordManager
//
//  Created by Hyperlink on 18/07/24.
//

import SwiftUI

struct AddDetailsView: View {
    
    @Binding var isPresented: Bool
    var addAccount: (Account) -> Void
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isPassShow = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Rectangle()
                    .frame(width: 46, height: 4)
                    .foregroundColor(Color(hex: "#E3E3E3"))
                    .padding(.top, 9)
                VStack(spacing: 22) {
                    VStack {
                        TextField("Account Name", text: $name)
                            .modifier(MyTextFieldModifier(placeString: "Account Name", fieldName: name))
                    }
                    .myVStackModifier()
                    VStack {
                        TextField("Username/ Email", text: $email)
                            .modifier(MyTextFieldModifier(placeString: "Username/ Email", fieldName: email))
                    }
                    .myVStackModifier()
                    VStack {
                        HStack {
                            if isPassShow {
                                TextField("Password", text: $password)
                                    .modifier(MyTextFieldModifier(placeString: "Password", fieldName: password))
                            } else {
                                SecureField("Password", text: $password)
                                    .modifier(MyTextFieldModifier(placeString: "Password", fieldName: password))
                            }
                            Button {
                                self.isPassShow.toggle()
                            } label: {
                                Image(systemName: isPassShow ? "eye" : "eye.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 10)
                                    .foregroundColor(Color(hex: "#CCCCCC"))
                            }
                        }
                    }
                    .myVStackModifier()
                    
                    Button {
                        let newAccount = Account(id: UUID(), name: name, email: email, password: password)
                        addAccount(newAccount)
                        withAnimation {
                            isPresented = false
                        }
                    } label: {
                        Text("Add New Account")
                            .foregroundColor(Color(hex: "#FFFFFF"))
                            .fontWeight(.bold)
                        
                    }
                    .frame(width: ScreenSize.width - 40, height: 44)
                    .background(Color(hex: "#000000"))
                    .clipShape(Capsule())
                    .padding(.bottom, 40)
                    
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 25)
            }
            .background(Color(hex: "#F9F9F9"))
            .cornerRadius(17)
        }
        .padding()
        .background(Color.clear)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            // Prevent tap gesture from propagating to the background
        }
    }
}


//#Preview {
//    AddDetailsView()
//}
