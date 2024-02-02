//
//  ToDoListDIContainer.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 02/02/24.
//

import Factory

extension Container: AutoRegistering {
    public func autoRegister() {
        Container.shared.toDoDatasource.register { ToDoDatasource() }
        Container.shared.toDoRepository.register {
            ToDoRepository(apiService: Container.shared.toDoDatasource.resolve())
        }
        Container.shared.fetchToDosUseCase.register {
            FetchToDosUseCase(repository: Container.shared.toDoRepository.resolve())
        }
    }
}


extension Container {

    var toDoDatasource: Factory<ToDoDatasourceProtocol> {
        Factory(self)  {ToDoDatasource()}
    }
    
    var toDoRepository: Factory<ToDoRepositoryProtocol> {
        Factory(self)  {
            ToDoRepository(apiService: self.toDoDatasource())
        }
    }
    
    var fetchToDosUseCase: Factory<FetchToDosUseCaseProtocol> {
        Factory(self)     {
            FetchToDosUseCase(repository: self.toDoRepository())
        }
    }
}
