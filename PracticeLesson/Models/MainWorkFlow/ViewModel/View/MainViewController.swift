//
//  MainViewController.swift
//  PracticeLesson
//
//  Created by Керемет  on 3/2/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let viewModel: MainViewModelType = MainViewModel()
    
    private var posts: [Post] = [Post]() {
    
    didSet {
        print(posts)
        postsTableView.reloadData()
        
    }
}
    private func fetchPosts() {
        Task{
            let postList = try await viewModel.fetchPosts()
            self.posts = postList.posts
        }
    }
    
    @IBOutlet weak var postsTableView: UITableView!
    
    private func configurePostsTablwView() {
        postsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "posts_cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePostsTablwView()
        fetchPosts()
    }


}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "posts_cell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
}
extension MainViewController: UITableViewDelegate {
  
}
