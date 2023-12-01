//
//  ToDoSwiftDataAppApp.swift
//  ToDoSwiftDataApp
//
//  Created by Rafael Gonzaga on 30/11/23.
//

import SwiftUI
import SwiftData


//Ponto de partida, todas as funcionalidades serao feitas aqui
@main
struct ToDoSwiftDataAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        /// Precisamos criar um conteineir na tela zero, no nosso ponto de partida do app,  nao vamos usar os valores vamos usar o tipo .self ou seja o tipo ToDoItem
        .modelContainer(for: ToDoItem.self)
    }
}
