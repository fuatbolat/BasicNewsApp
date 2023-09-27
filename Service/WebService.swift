//
//  WebService.swift
//  BasicNewsApp
//
//  Created by Fuat Bolat on 20.04.2023.
//
//   
import Foundation
class WebService{
    func haberleriIndir(uRl:URL,completion : @escaping ([News]?)->()) {
        URLSession.shared.dataTask(with: uRl) { (data, response, error) in
            if let error = error
            {print(error.localizedDescription)
               completion(nil)
            }else if let data = data {
             let haberlerDizisi = try?   JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi{
                    completion(haberlerDizisi)
                }
            }
        }.resume()
        
    }
}
