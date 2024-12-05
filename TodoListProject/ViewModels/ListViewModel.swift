//
//  ListViewModel.swift
//  TodoList
//
//  Created by Moheb Boules on 29/11/2024.
//
// We are using UserDefaults to save data, the prefferable method is using coreData

import Foundation

//  CRUD functions:
/*
 1- Create (The init() and the addItems())
 2- Read (The getItems())
 3- Update (The updateItem() and the moveItem())
 4- Delete (The deleteItem())
 These are the main function added to the ViewModel
 */

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems() // This is a short hand method instead of adding saveItem in the end of each function
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    func getItems() {
//        let newItems: [ItemModel] = [
//            ItemModel(title: "This is the first title", isCompleted: false),
//            ItemModel(title: "This is the second title", isCompleted: true),
//            ItemModel(title: "This is the third title", isCompleted: false)
//            ]
//        items.append(contentsOf: newItems)
        // getting saved data Method 1:
//        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {return}
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else{return}
        //getting saved data Method 2: By combining both guard statement
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
    }
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel){
//        if let index = items.firstIndex(where: { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        })
//        {
//            
//        }
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] =  item.updateCompletion()
        }
    }
    func saveItems(){
      // UserDefaults can't read ItemModels so we will convert it to JSON files for saving and then convert it back
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
