//
//  GoalListCellView.swift
//  GoalsTracker
//
//  Created by Norbert Agoston on 27.12.2024.
//

import SwiftUI

struct GoalListCell: View {
    @ObservedObject var goal: Goal
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text(goal.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 150, alignment: .leading)
//                                .border(Color.blue, width: 2)
                Text("\(goal.dueDate.formattedDate())")
                    .font(.caption)
//                                .border(Color.blue, width: 2)
            }
            .foregroundStyle(.white)
//            .border(Color.blue, width: 2)
            
            ProgressBar(backgroundColor: .gray,
                        progressColor: .green,
                        progress: CGFloat(goal.progress))
        }
        .padding(.horizontal, 15)
        .padding(.vertical)
        .background() {
            RoundedRectangle(cornerRadius: 12)
                .fill(.goalCellBackground)
        }
    }
}

#Preview {
    GoalListCell(goal: MockData.goal)
}
