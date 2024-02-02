//
//  ToDoModel.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 01/02/24.
//

import Foundation

struct ToDoModel: Identifiable, Codable, Equatable {
    let id: Int
    let title: String
    let completed: Bool
}
