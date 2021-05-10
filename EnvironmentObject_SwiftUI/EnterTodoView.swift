//
//  EnterTodoView.swift
//  EnvironmentObject_SwiftUI
//
//  Created by Josh R on 5/8/21.
//

import SwiftUI

struct EnterTodoView: View {
    @EnvironmentObject private var todoStorage: TodoStorage
//    @Binding var showingSheet: Bool
    @Environment(\.presentationMode) private var presentationMode
    @State var newTodoTitle: String = ""

    var body: some View {
        VStack(spacing: 50) {
            Spacer().frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            TextField("Add todo here", text: $newTodoTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add") {
                if !newTodoTitle.isEmpty {
                    // FIXME: Modal view won't dismiss if adding a todo to todoStorage
                    todoStorage.add(todo: Todo(name: newTodoTitle))
                    presentationMode.wrappedValue.dismiss()
//                    showingSheet = false
                }
            }
            .font(.headline)
            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(15)

            Spacer()
        }
    }
}

struct EnterTodoView_Previews: PreviewProvider {
    static var previews: some View {
//        EnterTodoView(showingSheet: .constant(true)).environmentObject(TodoStorage())
        EnterTodoView().environmentObject(TodoStorage())
    }
}
