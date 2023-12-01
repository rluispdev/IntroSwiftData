//
//  ContentView.swift
//  ToDoSwiftDataApp
//
//  Created by Rafael Gonzaga on 30/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    /// Container x Context =  Quando falamos de context estamos fa;lando de banco de dados,  Container = Id, Name, IsComplete, o objeto em si,  o Context é a referencia do objeto
    @Environment(\.modelContext) private var context
    @Query private var todos: [ToDoItem]
    
    var body: some View {
        
    
        NavigationStack {
            List {
                ForEach(todos) { ToDoItem in
                    Text(ToDoItem.name)
                }
            }
            .navigationTitle("Meus ToDo")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        let todo = ToDoItem(name: "Tarefa", isComolete: false)
                        context.insert(todo)
                        
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self)
}
