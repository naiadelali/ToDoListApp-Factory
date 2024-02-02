//
//  ToDoMapper.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 01/02/24.
//

import Foundation
struct ToDoMapper {
    static func mapToEntity(_ model: ToDoModel) -> ToDoEntity {
        return ToDoEntity(id: model.id, title: model.title, isCompleted: model.completed)
    }

    static func mapToModel(_ entity: ToDoEntity) -> ToDoModel {
        return ToDoModel(id: entity.id, title: entity.title, completed: entity.isCompleted)
    }
}
