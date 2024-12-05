//
//  ItemModel.swift
//  TodoList
//
//  Created by Moheb Boules on 29/11/2024.
//

import Foundation
// Immutable struct (good practise so only use constants and update within the struct itself)
struct ItemModel: Identifiable, Codable{
    let id: String
    let title: String
    let isCompleted: Bool
    init(id: String = UUID().uuidString ,title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel {
        return ItemModel(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
    
}
