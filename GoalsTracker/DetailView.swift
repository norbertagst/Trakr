//
//  DetailView.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 27.12.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var selectedGoal: Goal
    
    
    var body: some View {
        VStack {
            Form {
                TextField("title", text: $selectedGoal.title)
                .autocorrectionDisabled()
                .padding()
                
                TextEditor(text: $selectedGoal.description)
                .padding()
                .frame(height: 100)
                .autocorrectionDisabled()
            }
            .frame(height: 250)
            .scrollContentBackground(.hidden)
            .environment(\.colorScheme, .dark)

            currentProgressView(selectedGoal: selectedGoal)
            makeProgressView(selectedGoal: selectedGoal)
            Spacer()
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
}

struct currentProgressView: View {
    @ObservedObject var selectedGoal: Goal
    
    var body: some View {
        Text("\(selectedGoal.finishedIterations) / \(selectedGoal.totalIterations)")
            .foregroundStyle(.white)
        ProgressBar(backgroundColor: .gray, progressColor: .green, progress: CGFloat(selectedGoal.progress))
            .padding()
    }
}

struct makeProgressView: View {
    @State private var numberOfNewInterations = 1
    var selectedGoal: Goal
    
    var body: some View {
        VStack {
            HStack {
                changeProgressButton(progressAction: .decrement {
                    print("decrement")
                    numberOfNewInterations -= 1
                })
                TextField("", text:  Binding<String>(
                    get: {
                        String(numberOfNewInterations)
                    },
                    set: { newValue in
                        if let intValue = Int(newValue) {
                            numberOfNewInterations = intValue
                        }
                    }))
                .multilineTextAlignment(.center)
                .frame(width: 40, height: 40)
                .foregroundStyle(.white)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                changeProgressButton(progressAction: .increment {
                    print("increment")
                    numberOfNewInterations += 1
                })
            }
            
            Button {
                print("Make Progress \(numberOfNewInterations)")
                selectedGoal.updateFinishedIterations(with: numberOfNewInterations)
            } label: {
                Text("Make progress")
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                    .foregroundStyle(.white)
                    .background(.buttonBackground)
                    .bold()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
            }
        }
    }
}

private enum ProgressAction {
    case increment(()->())
    case decrement(()->())
    
    
    var actionName: String {
        switch self {
        case .increment:
            return "+"
        case .decrement:
            return "\u{2212}"
        }
    }
    
    var action: () -> () {
        switch self {
        case .increment(let closure):
            return closure
        case .decrement(let closure):
            return closure
        }
    }
}

private struct changeProgressButton: View {
    let progressAction: ProgressAction
    
    var body: some View {
        Button {
            progressAction.action()
        } label: {
            Text("\(progressAction.actionName)")
                .font(.system(size: 32))
                .foregroundStyle(.white)
                .padding()
                .background(.clear)
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
        }
    }
}

#Preview {
    DetailView(selectedGoal: Goal())
}
    
//    var body: some View {
//        VStack {
//            TextField("title", text: $selectedGoal.title)
//            .textFieldStyle(.roundedBorder)
//            .autocorrectionDisabled()
//            .padding()
//            
//            TextEditor(text: $selectedGoal.description)
//            .padding()
//            .frame(height: 100)
//            .border(Color.gray, width: 1)
//            .autocorrectionDisabled()
//            
//            HStack {
//                Text("Finished iterations")
//                    .padding()
//                    .border(Color.pink, width: 2)
//                TextField("", text:  Binding<String>(
//                    get: {
//                        String(numberOfNewInterations) // Convert Int to String
//                    },
//                    set: { newValue in
//                        if let intValue = Int(newValue) { // Convert String back to Int
//                            numberOfNewInterations = intValue
//                        }
//                    }))
//                .multilineTextAlignment(.center)
//                .frame(width: 40, height: 40)
//                .border(Color.green, width: 2)
//                
//                Button {
//                    print("Make Progress \(numberOfNewInterations)")
//                    selectedGoal.updateFinishedIterations(with: numberOfNewInterations)
//                    progress = CGFloat(selectedGoal.progress)
//                } label: {
//                    Text("Make progress")
//                        .padding()
//                        .foregroundStyle(.white)
//                        .background(.pink)
//                        .bold()
//                        .clipShape(
//                            RoundedRectangle(cornerRadius: 10)
//                        )
//                }
//            }
////            Text("\($selectedGoal.finishedIterations.wrappedValue) / \($selectedGoal.totalIterations.wrappedValue)")
//            Text("\(selectedGoal.finishedIterations) / \(selectedGoal.totalIterations)")
//            ProgressBar(backgroundColor: .gray, progressColor: .green, progress: CGFloat(progress))
//                .padding()
//            Spacer()
//        }
//        .border(Color.pink, width: 2)
//        .onAppear(perform: {
//            progress = CGFloat(selectedGoal.progress)
//        })
//    }
//}
//
//#Preview {
//    DetailView(numberOfNewInterations: 1, selectedGoal: .constant(Goal()))
//}
