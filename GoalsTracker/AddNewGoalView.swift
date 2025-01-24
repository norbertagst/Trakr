//
//  AddNewGoalView.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 06.01.2025.
//

import SwiftUI

struct AddNewGoalView: View {
    var viewModel: MainViewViewModel
    @StateObject var addNewGoalViewModel = AddNewGoalViewViewModel()
    var done: ()->()
    var cancel: ()->()
    var body: some View {
        VStack {
            Text("New Item")
                .foregroundStyle(.white)
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            Form {
                TextField("Title", text: $addNewGoalViewModel.newGoal.title)
                    .autocorrectionDisabled()
                TextField("Description", text: $addNewGoalViewModel.newGoal.description)
                    .autocorrectionDisabled()
                HStack {
                    Text("Steps to complete")
                    TextField("", text: Binding<String>(
                        get: {
                            String(addNewGoalViewModel.newGoal.totalIterations)
                        },
                        set: { newValue in
                            if let intValue = Int(newValue) {
                                addNewGoalViewModel.newGoal.totalIterations = intValue
                            }
                        }))
                    .keyboardType(.numberPad)
                }

                
                DatePicker("Due Date", selection: $addNewGoalViewModel.newGoal.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            .scrollContentBackground(.hidden)
            .environment(\.colorScheme, .dark)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .overlay(
            actionButton(buttonTitle: "Done") {
                viewModel.addNewGoal(addNewGoalViewModel.newGoal)
                done()
            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10)),
                 alignment: .topTrailing)
        .overlay(
            actionButton(buttonTitle: "Cancel", action: cancel)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0)),
                 alignment: .topLeading)
    }
}

struct actionButton: View {
    let buttonTitle: String
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.buttonBackground)
                .bold()
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
        }
    }
}

#Preview {
    AddNewGoalView(viewModel: MainViewViewModel(), done: {}, cancel: {})
}
