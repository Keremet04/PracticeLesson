//
//  MainViewModel.swift
//  PracticeLesson
//
//  Created by Керемет  on 3/2/23.
//

import Foundation


internal protocol MainViewModelType{
    func fetchPosts() async throws -> Posts
    
}

public class MainViewModel: MainViewModelType {
    
    private var networkLayer: NetworkLayer
    
    init(){
        self.networkLayer = NetworkLayer.shared
    }
    
    func fetchPosts() async throws -> Posts {
        try await networkLayer.fetchPosts()
    }
    
    
}
