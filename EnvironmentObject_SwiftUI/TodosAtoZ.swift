//
//  TodosAtoZ.swift
//  EnvironmentObject_SwiftUI
//
//  Created by Josh R on 5/6/21.
//

//[x] - UI Complete
//[x] - Add todo
//[] - Update todo
//[x] - Delete todo

import SwiftUI

struct TodosAtoZ: View {
    @EnvironmentObject var todoStorage: TodoStorage
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("\(todoStorage.todoCount) todos")) {

                    ForEach(todoStorage.todos) { todo in
                        HStack {
                            Button(action: {
                                todoStorage.toggle(todo: todo)
                            }, label: {
                                Image(systemName: todo.isCompleted ? "largecircle.fill.circle" : "circle")
                                    .resizable()
                                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.pink)
                            })
                            Text(todo.name)
                                .font(.body)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        todoStorage.delete(at: indexSet)
                    })
                }
            }
            .navigationTitle("TodosAtoZ")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                Button(action: {
                    showingSheet = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }.sheet(isPresented: $showingSheet) {
            EnterTodoView().environmentObject(todoStorage)
        }
    }
}

struct TodosAtoZ_Previews: PreviewProvider {
    static var previews: some View {
        TodosAtoZ().environmentObject(TodoStorage())
    }
}
