//
//  APIService.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 01/02/24.
//

import Foundation
import Alamofire

struct ToDoDatasource: ToDoDatasourceProtocol {
    let baseURL = "https://jsonplaceholder.typicode.com/todos"

    func fetchToDos(completion: @escaping (Result<[ToDoModel], Error>) -> Void) {
        AF.request(baseURL)
            .validate()
            .responseDecodable(of: [ToDoModel].self) { response in
                switch response.result {
                case .success(let toDos):
                    completion(.success(toDos))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
