//
//  MailListView.swift
//  Mymail
//
//  Created by FRANCESCA JLENIA SCOGNAMIGLIO on 17/11/23.
//

import SwiftUI

class Email: Identifiable {
    var id = UUID()
   
    var previousEmail: Email?
    var nextEmail: Email?
    let title: String
    let body: String
    let sender: String
    let senderImage: String
    let date: String
    let bodyImage: String
    
    init(id: UUID = UUID(), previousEmail: Email? = nil, nextEmail: Email? = nil, title: String, body: String, sender: String, senderImage: String, date: String, bodyImage: String) {
        self.id = id
        self.previousEmail = previousEmail
        self.nextEmail = nextEmail
        self.title = title
        self.body = body
        self.sender = sender
        self.senderImage = senderImage
        self.date = date
        self.bodyImage = bodyImage
    }
}



 

struct MailListView: View {
    var title: String = "Inbox"
    @State var searchText = ""
    
    var emails = [
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "You will be charged for your iCloud+ plan",
            body: "This is a reminder that your 50 GB storage plan automatically renews monthly for 0,...",
            sender: "iTunes Store",
            senderImage: "iTunesImage",
            date: "Yesterday",
            bodyImage: "EmailImage"
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "The most emblematic songs",
            body: "Here are the songs that made these artists legends, From greatest hits to fan favorit...",
            sender: "Spotify",
            senderImage: "SpotifyImage",
            date: "monday",
            bodyImage: "EmailImage2"
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "Total look to -50% Black Friday",
            body: "Coupons, personalized offers, special discounts, games, missions and much m...",
            sender: "Tezenis",
            senderImage: "",
            date: "Tuesday",
            bodyImage: ""
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "The Apple store Event is coming",
            body: "From November 24th to 27th, purchase a promotional product and you will receive...",
            sender: "Apple",
            senderImage: "",
            date: "Wednesday",
            bodyImage: ""
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "Cinema",
            body: "Dear Students,we would like to share with you the opportunity to participate in the...",
            sender: "Apple Developer Academy",
            senderImage: "",
            date: "Thursday",
            bodyImage: ""
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "Cinema",
            body: "Dear Students,we would like to share with you the opportunity to participate in the...",
            sender: "Apple Developer Academy",
            senderImage: "",
            date: "Friday",
            bodyImage: ""
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "The most emblematic songs",
            body: "Here are the songs that made these artists legends, From greatest hits to fan favorit...",
            sender: "Spotify",
            senderImage: "",
            date: "Saturday",
            bodyImage: ""
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "Total look to -50% Black Friday",
            body: "Coupons, personalized offers, special discounts, games, missions and much m...",
            sender: "Tezenis",
            senderImage: "",
            date: "Sunday",
            bodyImage: ""
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "The Apple store Event is coming",
            body: "From November 24th to 27th, purchase a promotional product and you will receive...",
            sender: "Apple",
            senderImage: "",
            date: "Sunday",
            bodyImage: ""
        ),
        Email(
            previousEmail: nil,
            nextEmail: nil,
            title: "You will be charged for your iCloud+ plan",
            body: "This is a reminder that your 50 GB storage plan automatically renews monthly for 0,...",
            sender: "iTunes Store",
            senderImage: "",
            date: "Friday",
            bodyImage: ""
        ),
        
    ]
    
var body: some View {
        NavigationStack {
            
            List {
                ForEach (emails) { email in
                    NavigationLink {
                        EmailView(email: email)
                        
                    } label : {
                        VStack {
                            HStack {
                                Text(email.sender)
                                    .bold()
                                Spacer()
                                Text(email.date)
                            }
                            HStack {
                                Text(email.title)
                                Spacer()
                            }
                            HStack {
                                Text(email.body)
                                Spacer()
                            }
                                
                        }
                    }
                    
                }.swipeActions {
                    
                    Button(role: .destructive) {
                        print("Deleting conversation")
                    
//                                recordedDatas.sounds.remove(at: )
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                    Button {
                        print("Muting conversation")
                    } label: {
                        Label("Flag", systemImage: "flag")
                    }
                    .tint(.orange)
                    Button {
                        print("Muting conversation")
                    } label: {
                        Label("More", systemImage: "ellipsis.circle.fill")
                    }
                    .tint(.gray)
                   }
                .listRowSeparator(.visible)
            }

            .listStyle(.plain)
            .navigationTitle(title)
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem {
                    Button("Edit") {
                        print("About tapped!")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button() {
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    Spacer()
                    Text("Updated Just Now")
                        .font(.system(size: 14))
                    Spacer()
                    Button() {
                        print("Hello world!")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
        .onAppear() {
            emails[0].nextEmail = emails[1]
            
            for position in 1..<emails.count - 1 {
                emails[position].previousEmail = emails[position - 1]
                emails[position].nextEmail = emails[position + 1]
            }
            
            emails[emails.count - 1].previousEmail = emails[
                emails.count - 2
            ]
        }
    }
}

#Preview {
    MailListView()
}
