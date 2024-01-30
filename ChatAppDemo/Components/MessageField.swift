//
//  MessageField.swift
//  ChatAppDemo
//
//  Created by Tuan Cai on 1/30/24.
//

import SwiftUI

struct MessageField: View {
    @State private var message = ""
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message ..."), text: $message)
            Button {
                print("Message sent!")
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(red: 0.6, green: 0.4, blue: 0.8))
                    .cornerRadius(30)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color(red: 0.7, green: 0.7, blue: 0.7))
        .cornerRadius(5)
        .padding()
        
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

#Preview {
    MessageField()
}
