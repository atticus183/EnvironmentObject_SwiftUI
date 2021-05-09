//
//  TodoStorage.swift
//  EnvironmentObject_SwiftUI
//
//  Created by Josh R on 5/7/21.
//

import Foundation
import SwiftUI

class TodoStorage: ObservableObject {
    @Published var todos = [
        Todo(name: "Buy mail"),
        Todo(name: "Buy bread"),
        Todo(name: "Buy car oil"),
        Todo(name: "Send email"),
    ].sorted(by: { $0.name < $1.name })

    func add(todo: Todo) {
        todos.append(todo)
    }

    func delete(at indexSet: IndexSet) {
        indexSet.forEach { index in
            todos.remove(at: index)
        }
    }

    func update(todo: Todo) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[index] = todo
    }

    var todoCount: Int {
        todos.count
    }

    func toggle(todo: Todo) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[index].isCompleted.toggle()
    }
}
