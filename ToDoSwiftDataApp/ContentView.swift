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
    @Environment(\.modelContext) private var context //Gerente
    
    //Criando ordenacao
    @Query(sort: \ToDoItem.name,order: .reverse,  animation: .easeInOut)  private var todos: [ToDoItem]
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
                DetailView(item: todo)
                    .presentationDetents([.fraction(0.2)])
                    .interactiveDismissDisabled()
            }
        }
    }
}


//Modularizar

struct DetailView: View {
    @State var item: ToDoItem
    @Environment(\.dismiss) var dismiss
    //Gerente
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        VStack {
            //TextField
            TextField("Tarefa", text: $item.name)
            Spacer()
            
            //Botoes
            Button (action: {
                dismiss()
            }, label: {
                Text("Fechar")
                    .frame(maxWidth: .infinity)
                  
            })
            .tint(.black)
            .buttonStyle(.borderedProminent)
           
            Button (action: {
                context.delete(item)
                
            }, label: {
                Text("Deletar")
                    .frame(maxWidth: .infinity)
            })
            .tint(.red)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}


#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self)
}
