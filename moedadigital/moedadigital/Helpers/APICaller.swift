//
//  APICaller.swift
//  moedadigital
//
//  Created by Tatiana Pessoa Fernandes on 16/03/22.
//

import Foundation



final class APICaller{

  static let shared = APICaller()
  public var icons: [Icon] = []

  

  private var whenReadyBlock: ((Result<[Crypto], Error>) -> Void)?

  // se der erro trocar a chave da api

  private struct Constants{

    static let APIKey = "D202342D-AA18-4966-A29F-21B09FC5C9AD"

    static let assetsEndPoint = "https://rest-sandbox.coinapi.io/v1/assets/"
      
    static let searchUrlString = "https://rest-sandbox.coinapi.io/v1/assets/?apikey=fee855d2-2919-4804-b066-141a67b7f85b="

  }

  private init() {}

  public func getAllCryptoData(
    completion: @escaping (Result<[Crypto], Error>) -> Void
  ){
      guard !icons.isEmpty else {
      whenReadyBlock = completion

      return
    }

    guard let url = URL(string: Constants.assetsEndPoint + "?apikey=" + Constants.APIKey) else { return }

    let task = URLSession.shared.dataTask(with: url) { data, _, error in

      guard let data = data, error == nil else { return }

      do{

        let cryptos = try JSONDecoder().decode([Crypto].self, from: data)

        completion(.success(cryptos))
          
      }catch{

        completion(.failure(error))

      }



    }

    task.resume()

  }

  

  public func getAllIcons(){

    guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/55/?apikey=FEE855D2-2919-4804-B066-141A67B7F85B") else { return }

    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in

      guard let data = data, error == nil else { return }

      
      do{

        self?.icons = try JSONDecoder().decode([Icon].self, from: data)

        if let completion = self?.whenReadyBlock{

          self?.getAllCryptoData(completion: completion)

        }

        

      }catch{

        print(error)

      }



    }

    task.resume()

  }

  

}

