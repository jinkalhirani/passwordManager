//
//  DetailsView.swift
//  PasswordManager
//
//  Created by Hyperlink on 19/07/24.
//

import SwiftUI

struct DetailsView: View {
    
    @Binding var isPresented: Bool
    var account: Account
    var updateAccount: (Account) -> Void
    var deleteAccount: () -> Void
    
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Rectangle()
                    .frame(width: 46, height: 4)
                    .foregroundColor(Color(hex: "#E3E3E3"))
                    .padding(.top, 9)
            
                VStack(alignment: .leading, spacing: 22) {
                    Text("Account Details")
                        .foregroundColor(Color(hex: "#3F7DE3"))
                        .fontWeight(.bold)
                        .font(.title2)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Account Type")
                            .fontWeight(.regular)
                            .foregroundColor(Color(hex: "#CCCCCC"))
                        Text(account.name)
                            .fontWeight(.medium)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Username/ Email")
                            .fontWeight(.regular)
                            .foregroundColor(Color(hex: "#CCCCCC"))
                        Text(account.email)
                            .fontWeight(.medium)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Password")
                            .fontWeight(.regular)
                            .foregroundColor(Color(hex: "#CCCCCC"))
                        
                        HStack(spacing: 8) {
                            if isPasswordVisible {
                                Text(account.password)
                                    .fontWeight(.medium)
                                    .padding(.trailing, 8)
                            } else {
                                SecureField("Password", text: .constant(account.password))
                                    .disabled(true)
                                    .fontWeight(.medium)
                                    .padding(.trailing, 8)
                            }
                            
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color(hex: "#CCCCCC"))
                                    .frame(width: 20, height: 20)
                            }
                            .padding(.leading, 8)
                        }
                    }
                    
                    HStack {
                        Button {
                            // Edit logic
                        } label: {
                            Text("Edit")
                                .foregroundColor(Color(hex: "#FFFFFF"))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color(hex: "#2C2C2C"))
                        .clipShape(Capsule())

                        Button {
                            deleteAccount()
                            isPresented = false
                        } label: {
                            Text("Delete")
                                .foregroundColor(Color(hex: "#FFFFFF"))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color(hex: "#F04646"))
                        .clipShape(Capsule())
                    }
                    .padding(.bottom, 40)
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 25)
            }
            .background(Color(hex: "#F9F9F9"))
            .cornerRadius(17)
        }
        .background(Color.clear)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            // Prevent tap gesture from propagating to the background
        }
    }
}

//#Preview {
//    DetailsView()
//}
