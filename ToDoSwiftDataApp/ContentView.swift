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
    @State private var todo: ToDoItem?
    
    var body: some View {
        
    //Criando minha navegacao
        NavigationStack {
            List {
                ForEach(todos) { ToDoItem in
                    //Descricao da minha tarefa
                    Text(ToDoItem.name)
                    ///gestos de arrastar para deletar, edicao na lista
                        .swipeActions() {
                            Button(action: {
                                //Abrir model de detalhaemento
                                todo = ToDoItem
                                
                                
                            }, label: {
                               Label("Editar", systemImage: "pencil")
                            })
                            .tint(.orange)
                        }
                }
            }
            .navigationTitle("Meus ToDo")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    //Adicionar
                    Button(action: {
                        let todo = ToDoItem(name: "Tarefa", isComolete: false)
                        context.insert(todo)
                        
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(item: $todo) { todo in
                DetailView()
            }
        }
    }
}


//Modularizar

struct DetailView: View {
    var body: some View {
        VStack {
            //TextField
            Spacer()
            
            //Botoes
            Button ("Fechar") {
                
            }
            Button ("Deletar") {
                
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self)
}
