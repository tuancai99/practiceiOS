//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by Tuan Cai on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    var messageArray = ["Hello", "Hi", "hru?"]
    var body: some View {
        VStack {
            VStack {
                    TitleRow()
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) {message in MessageBubble(message: message)
                            
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft,.topRight])
                    
                }
            .background(Color(red: 0.6, green: 0.4, blue: 0.8))
            MessageField().environmentObject(messagesManager)
        }
    }
}

#Preview {
    ContentView()
}
