//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Lameirão Lima on 02/02/24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.toDos, id: \.id) { toDo in
                HStack {
                    Text(toDo.title)
                    Spacer()
                    Image(systemName: toDo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(toDo.isCompleted ? .green : .gray)
                }
            }
            .navigationTitle("To-Dos")
            .onAppear {
                viewModel.fetchToDos()
            }
        }
    }
}


#Preview {
    ToDoListView()
}
