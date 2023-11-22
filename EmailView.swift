//
//  EmailView.swift
//  Mymail
//
//  Created by FRANCESCA JLENIA SCOGNAMIGLIO on 20/11/23.
//

import SwiftUI

struct EmailView: View {
    
    
   @State var email: Email
    
    
    var body: some View {
      
            List {
                HStack(spacing: 0) {
                    Text("")
                        .frame(maxWidth: 0)
                    HStack {
                        Image(email.senderImage)
                            .resizable()
                            .frame(width: 45, height: 45)
                        VStack {
                            HStack {
                                Text(email.sender)
                                    .bold()
                                    .font(.title3)
                                Spacer()
                                Text(email.date)
                                    .foregroundStyle(.gray)
                            }
                            HStack {
                                Text("To:")
                                Text(verbatim: "frajlenia@icloud.com")
                                    .foregroundStyle(.gray)
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                        }
                    }
                }
                .listRowBackground(
                   Color(uiColor: .secondarySystemGroupedBackground)
                                )
                VStack {
                    Text(email.title)
                        .padding(.horizontal)
                        .font(.title3)
                        .bold()
                    Image(email.bodyImage)
                        .resizable()
                        .scaledToFit()
                }
                .listRowBackground(
                    Color(uiColor: .secondarySystemGroupedBackground)
                                )
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                }
            .background(
                Color(uiColor: .systemGroupedBackground)
                )
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup {
                    Button() {
               email = email.previousEmail!
                    } label: {
                        Image(systemName: "chevron.up")
                    }
                    .disabled(email.previousEmail == nil)
                    Button() {
                   email = email.nextEmail!
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                    .disabled(email.nextEmail == nil)
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button() {
                    } label: {
                        Image(systemName: "trash")
                    }
                    Spacer()
                    Button() {
                    } label: {
                        Image(systemName: "folder")
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                    Button() {
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward")
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                    Button() {
                        print("Hello world!")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
#Preview {
    EmailView(email:  Email(
        previousEmail: nil,
        nextEmail: nil,
        title: "You will be charged for your iCloud+ plan",
        body: "This is a reminder that your 50 GB storage plan automatically renews monthly for 0,...",
        sender: "iTunes Store",
        senderImage: "iTunesImage",
        date: "Yesterday",
        bodyImage: "EmailImage"
    ))
}

