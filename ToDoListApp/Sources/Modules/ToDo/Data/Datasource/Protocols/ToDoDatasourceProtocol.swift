//
//  APIServiceProtocol.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 01/02/24.
//

import Foundation

protocol ToDoDatasourceProtocol {
    func fetchToDos(completion: @escaping (Result<[ToDoModel], Error>) -> Void)
}
