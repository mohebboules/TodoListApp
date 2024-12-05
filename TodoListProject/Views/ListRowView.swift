//
//  ListRowView.swift
//  TodoList
//
//  Created by Moheb Boules on 29/11/2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName:  item.isCompleted ? "checkmark.circle": "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}
struct ListRowView_Previews: PreviewProvider{
    static var item1: ItemModel = ItemModel(title: "First item", isCompleted: true)
    static var item2: ItemModel = ItemModel(title: "Second item", isCompleted: false)

    static var previews: some View{
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)

    }
}



