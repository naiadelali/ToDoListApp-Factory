//
//  FetchToDosUseCase.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 01/02/24.
//

import Foundation

protocol FetchToDosUseCaseProtocol {
    func execute(completion: @escaping (Result<[ToDoEntity], Error>) -> Void)
}


struct FetchToDosUseCase: FetchToDosUseCaseProtocol {
    private let repository: ToDoRepositoryProtocol

    init(repository: ToDoRepositoryProtocol) {
        self.repository = repository
    }


    func execute(completion: @escaping (Result<[ToDoEntity], Error>) -> Void) {
        repository.fetchToDos { result in

            completion(result)
        }
    }
}
