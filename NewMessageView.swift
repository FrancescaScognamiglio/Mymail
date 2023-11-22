//
//  NewMessageView.swift
//  Mymail
//
//  Created by FRANCESCA JLENIA SCOGNAMIGLIO on 22/11/23.
//

import SwiftUI

struct NewMessageView: View {
    
  @State var recipient = ""
  @State var sender = ""
  @State var subject = ""
  @State var bodyText = "\nSent from my iPhone"
  @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text($subject.wrappedValue.isEmpty ? "New Message" : $subject.wrappedValue)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.5)
                    Spacer()
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundStyle(.gray)
                }
                .listRowBackground(Color(uiColor: .secondarySystemGroupedBackground))
                .listRowSeparator(.hidden)
                .bold()
                .font(.largeTitle)
                HStack {
                    Text("To:")
                        .foregroundStyle(.gray)
                    TextField("", text: $recipient)
                }
                .listRowBackground(Color(uiColor: .secondarySystemGroupedBackground))
                HStack {
                    Text("Cc/Bcc, From:")
                        .foregroundStyle(.gray)
                    TextField("", text: $sender)
                }
                .listRowBackground(Color(uiColor: .secondarySystemGroupedBackground))
                HStack {
                    Text("Subject:")
                        .foregroundStyle(.gray)
                    TextField("", text: $subject)
                }
                .listRowBackground(Color(uiColor: .secondarySystemGroupedBackground))
                
                TextField("", text: $bodyText, axis: .vertical)
                    .listRowBackground(Color(uiColor: .secondarySystemGroupedBackground))
                    .listRowSeparator(.hidden, edges: .bottom)
            }
            .background(Color(uiColor: .secondarySystemGroupedBackground))
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        print("About tapped!")
                        dismiss()
                    }
                }
            }
        }
        .background(Color(uiColor: .secondarySystemGroupedBackground))
    }
}

#Preview {
    NewMessageView()
}
