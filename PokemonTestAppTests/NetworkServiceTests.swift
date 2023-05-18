//
//  NetworkServiceTests.swift
//  PokemonTestAppTests
//
//  Created by Lobster on 7.05.23.
//

import XCTest

@testable import PokemonTestApp

final class NetworkServiceTests: XCTestCase {
    
    private enum Const {
        static let loadPokemonListURL = "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0"
        static let loadPokemonURL = "https://pokeapi.co/api/v2/pokemon/2/"
        static let loadPokemonsHTTPLMethod = "GET"
    }
    
    private let networkSessionSpy = NetworkSessionSpy()
    
    private func makeSut() -> NetworkService {
        return NetworkService(networkSession: networkSessionSpy,
                              internetConnectionMonitor: InternetConnectionMonitorSpy(),
                              coreDataManager: CoreDataSpy())
    }
    
    private func clearData() {
        networkSessionSpy.request = nil
    }
    
    
    func test_loadPokemonList() {
        clearData()
        
        let sut = makeSut()
        let exp = expectation(description: "test_loadPokemons")

        let mock = PokemonListMock.makeMock()
        let mockData = try? JSONEncoder().encode([mock])
        networkSessionSpy.mockData = mockData

        var loadedPokemonList = PokemonListModel(results: [])
        sut.getPockemonsList { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let pokemonList):
                loadedPokemonList = pokemonList
                XCTAssertFalse(pokemonList.results.isEmpty)
                XCTAssertNotNil(pokemonList)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 20.0)


        let createdRequest = networkSessionSpy.request

        XCTAssertNotNil(createdRequest)
        XCTAssertEqual(createdRequest?.url?.absoluteString, Const.loadPokemonListURL)
        XCTAssertNotNil(loadedPokemonList.results.isEmpty)
        XCTAssertEqual(createdRequest?.httpMethod, Const.loadPokemonsHTTPLMethod)
    }
    
    func test_loadPkemonWithRightPokemonURL() {
        clearData()

        let sut = makeSut()
        sut.getPokemonDetails(url: Const.loadPokemonURL, completion: { _ in})

        let createdRequest = networkSessionSpy.request

        XCTAssertNotNil(createdRequest)
        XCTAssertEqual(createdRequest?.httpMethod, Const.loadPokemonsHTTPLMethod)
    }

    func test_LoadPokemonWithWrongURL() {
        clearData()

        let sut = makeSut()
        let wrongURL = "Wrong URL"
        sut.getPokemonDetails(url: wrongURL, completion: { _ in })

        let createdRequest = networkSessionSpy.request

        XCTAssertNil(createdRequest)
    }

    
}

private final class NetworkSessionSpy: NetworkSessionProtocol {
    
    var request: URLRequest? = nil
    var error: Error? = nil
    var mockData: Data? = nil
    
    func callDataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.request = request
        if error == nil {
            completionHandler(mockData, URLResponse(), nil)
        } else {
            completionHandler(nil, nil, error)
        }
    }
}

private final class CoreDataSpy: SavePokemonCoreDataManagerProtocol {
    
    var coreData = PokemonsCoreDataService.shared
    var pokemonListModel: PokemonListModel? = nil
    
    func savePokemonList(pokemonListModel: PokemonTestApp.PokemonListModel) {
        if self.pokemonListModel == nil {
            XCTFail("Nothing to save")
        }
    }
    
}

private final class InternetConnectionMonitorSpy: InternetConnectionMonitorServiceProtocol {
    
    func checkInternetConnection(completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}

final class PokemonListMock {
    
    static func makeMock(
        name: String = "bulbasaur",
        url: String = "https://pokeapi.co/api/v2/pokemon/1/"
    ) -> PokemonListModel {
        return PokemonListModel(results: [PokemonResult(name: name, url: url)])
    }
}
