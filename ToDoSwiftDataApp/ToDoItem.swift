//
//  ToDoItem.swift
//  ToDoSwiftDataApp
//
//  Created by Rafael Gonzaga on 30/11/23.
//

import Foundation
import SwiftData

//Passando o macro e informa pro projeto que isso agora é uma entidade.
@Model
// Pra usar todas funcionalidades do SwiftData usamos classes, ele trabalha com herenças
class ToDoItem {
    
    ///Propriedades
    var id = UUID().uuidString
    var name: String
    var isComolete: Bool
    var createAt = Date()
    
    ///Tudo que é vazio e nao tiver o = siginfica que devemos iniciar.
    init(name: String, isComolete: Bool ) {
        self.name = name
        self.isComolete = isComolete
         
    }
}

/// Quando quisermos modelar meu banco de dados crio o modele, pra habilitar uso a macro @Model
