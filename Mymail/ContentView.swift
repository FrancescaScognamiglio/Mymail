//
//  ContentView.swift
//  Mymail
//
//  Created by FRANCESCA JLENIA SCOGNAMIGLIO on 15/11/23.
//

import SwiftUI

struct EmailCategory: Identifiable {
    var id = UUID()
    
    let name: String
    let imageName: String
}

struct ContentView: View {
    // Indica se iCloud è espanso
    @State var isICloudExspanded = true
    @State var isNewMessagePresented = false
    
    let categories = [
        EmailCategory(name: "Draft", imageName: "doc"),
        EmailCategory(name: "Sent", imageName: "paperplane")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    NavigationLink {
                        MailListView(title: "Inbox")
                    } label: {
                        HStack {
                            Image(systemName: "tray")
                                .foregroundStyle(.blue)
                            Text("iCloud")
                            Spacer()
                            Text("10")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                Section() {
                    // Se iCloud è espanso, ne mostra il contenuto
                    if isICloudExspanded {
                        ForEach(categories) { category in
                            NavigationLink {
                                MailListView(title: category.name)
                            } label: {
                                HStack {
                                    Image(systemName: category.imageName)
                                        .foregroundStyle(.blue)
                                    Text(category.name)
                                    Spacer()
                                }
                            }
                        }
                    }
                } header: { // Titolo
                    HStack {
                        Text("iCloud")
                            .bold() // In grassetto
                        Spacer() // Sposta l'immagine a destra
                        /*
                         Immagine della freccia, se iCloud è espanso mostra
                         quella verso il basso, altrimenti verso destra
                         */
                        Image(
                            systemName: isICloudExspanded
                            ? "chevron.down"
                            : "chevron.right"
                        )
                        .font(.body) // Font di default per le scritte piccole
                        .foregroundStyle(.blue)
                    }
                    // Imposta manualmente il padding del titolo
                    .listRowInsets(
                        EdgeInsets(
                            top: 16,
                            leading: 0,
                            bottom: 16,
                            trailing: 0
                        )
                    )
                    // Quando viene premuto sul titolo, cambia il valore di isICloudExspanded
                    .onTapGesture {
                        isICloudExspanded.toggle()
                    }
                }
                // Incrementa la grandezza del titolo
                .headerProminence(.increased)
            }
            .navigationTitle("Mailboxes")
            .toolbar {
                ToolbarItem {
                    Button("Edit") {
                        print("About tapped!")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("Updated Just Now")
                        .font(.system(size: 14))
                    Spacer()
                    Button() {
                        print("Hello world!")
                        isNewMessagePresented.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    .sheet(isPresented: $isNewMessagePresented) {
                        NewMessageView()
                      }
                   }
                }
            }
        }
     }

#Preview {
    ContentView()
}

