//
//  ToDoListViewModel.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 02/02/24.
//

import Foundation
import Factory

class ToDoListViewModel: ObservableObject {
    @Published var toDos: [ToDoEntity] = []
    private var fetchToDosUseCase: FetchToDosUseCaseProtocol?

    init() {
        self.fetchToDosUseCase = Container.shared.fetchToDosUseCase.resolve()
    }

    func fetchToDos() {
        fetchToDosUseCase?.execute { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let toDos):
                    self?.toDos = toDos
                case .failure:
                    self?.toDos = []
                }
            }
        }
    }
}
