//
//  ToDoRepository.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 01/02/24.
//
import Foundation

struct ToDoRepository: ToDoRepositoryProtocol {
    private let apiService: ToDoDatasourceProtocol

    init(apiService: ToDoDatasourceProtocol) {
        self.apiService = apiService
    }

    func fetchToDos(completion: @escaping (Result<[ToDoEntity], Error>) -> Void) {
        apiService.fetchToDos { result in
            switch result {
            case .success(let models):
                let entities = models.map(ToDoMapper.mapToEntity)
                completion(.success(entities))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
