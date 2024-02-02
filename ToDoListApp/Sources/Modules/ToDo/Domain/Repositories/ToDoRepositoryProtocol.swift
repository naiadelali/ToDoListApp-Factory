//
//  ToDoRepositoryProtocol.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 01/02/24.
//

import Foundation

protocol ToDoRepositoryProtocol {
    func fetchToDos(completion: @escaping (Result<[ToDoEntity], Error>) -> Void)
}
