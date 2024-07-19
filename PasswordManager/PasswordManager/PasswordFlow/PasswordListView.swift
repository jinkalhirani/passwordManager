//
//  PasswordListView.swift
//  PasswordManager
//
//  Created by Hyperlink on 18/07/24.
//

import SwiftUI

struct Account: Identifiable {
    let id: UUID
    var name: String
    var email: String
    var password: String
}

class AccountData: ObservableObject {
    @Published var accounts: [Account] = []
}

struct PasswordListView: View {
    
    @State private var showAddDetails = false
    @State private var showEditDetails = false
    @State private var selectedAccount: Account?
    @ObservedObject var accountData = AccountData()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    Text("Password Manager")
                        .foregroundColor(Color(hex: "#333333"))
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(height: 1)
                        .background(Color(hex: "#E8E8E8"))
                    List {
                        ForEach(accountData.accounts) { account in
                            VStack(alignment: .leading) {
                                Text(account.name)
                                    .font(.headline)
                                Text(account.email)
                                    .font(.subheadline)
                            }
                            .background(Color.clear)
                            .onTapGesture {
                                selectedAccount = account
                                showEditDetails.toggle()
                            }
                        }
                        .onDelete(perform: deleteAccount)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    
                    HStack {
                        Spacer()
                        Button {
                            showAddDetails.toggle()
                        } label: {
                            Image("ic_AddIcon")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                if showAddDetails {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showAddDetails.toggle()
                            }
                        }
                    
                    AddDetailsView(isPresented: $showAddDetails, addAccount: { newAccount in
                        accountData.accounts.append(newAccount)
                    })
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                }
                
                if showEditDetails, let account = selectedAccount {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showEditDetails.toggle()
                            }
                        }
                    
                    DetailsView(isPresented: $showEditDetails, account: account, updateAccount: { updatedAccount in
                        if let index = accountData.accounts.firstIndex(where: { $0.id == updatedAccount.id }) {
                            accountData.accounts[index] = updatedAccount
                        }
                    }, deleteAccount: {
                        if let index = accountData.accounts.firstIndex(where: { $0.id == account.id }) {
                            accountData.accounts.remove(at: index)
                        }
                        showEditDetails = false
                    })
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                }
            }
        }
    }
    
    private func deleteAccount(at offsets: IndexSet) {
        accountData.accounts.remove(atOffsets: offsets)
    }
}


#Preview {
    PasswordListView()
}
