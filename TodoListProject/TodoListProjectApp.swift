//
//  TodoListProjectApp.swift
//  TodoListProject
//
//  Created by Moheb Boules on 29/11/2024.
//

import SwiftUI
// MVVM architechture
/*
 Model - Data point
 V - View (UI)
 VM - View Model (Class that manages models for view)
 */

@main
struct TodoListProjectApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
