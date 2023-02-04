//
//  NetworkLayer.swift
//  PracticeLesson
//
//  Created by Керемет  on 3/2/23.
//

import Foundation

import UIKit

import RxSwift
import RxCocoa


final class NetworkLayer {
    
    static let shared = NetworkLayer()
    private init() { }
    
    var baseURL = URL(string: "https://dummyjson.com/posts")!
    
    //    func decodeOrderTypeData(_ json: String) -> [OrderTypeModel] {
    //        var orderTypeModelArray = [OrderTypeModel]()
    //        let orderTypeData = Data(json.utf8)
    //        let jsonDecoder = JSONDecoder()
    //        do { let orderTypeModelData = try jsonDecoder.decode([OrderTypeModel].self, from: orderTypeData)
    //            orderTypeModelArray = orderTypeModelData
    //        } catch {
    //            print(error.localizedDescription)
    //        }
    //        return orderTypeModelArray
    //    }
    //
    
    
    //    func fetchProductsData(completion: @escaping (Result<MainProductModel, Error>) -> Void) {
    //        guard let url = baseURL else { return }
    //
    //        let request = URLRequest(url: url)
    //
    //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
    //            guard let data = data else { return }
    //            self.decodeData(data: data, completion: completion)
    //            }
    //        task.resume()
    //    }
    //
    func fetchPosts() async throws -> Posts {
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        print("response\(response)")
        return await decodeData(data: data)
    }
    
    func decodeData<T: Decodable>(data: Data) async -> T {
        let decoder = JSONDecoder()
        return try! decoder.decode(T.self, from: data)
    }
    
}
