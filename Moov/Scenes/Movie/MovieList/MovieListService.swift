//
//  MovieListService.swift
//  Moov
//
//  Created by Jade Silveira on 01/12/21.
//

import Foundation
import NatworkSPM

protocol MovieListServicing {
    func fetchDailyTrendingMovieList(completion: @escaping (Result<MovieListResponse, ApiError>) -> Void)
    func fetchWeeklyTrendingMovieList(completion: @escaping (Result<MovieListResponse, ApiError>) -> Void)
    func search(movieText: String, page: Int, completion: @escaping (Result<MovieListResponse, ApiError>) -> Void)
}

final class MovieListService: MovieListServicing {
    private let network: Networking
    
    init(network: Networking) {
        self.network = network
    }
    
    func fetchDailyTrendingMovieList(completion: @escaping (Result<MovieListResponse, ApiError>) -> Void) {
        network.fetchData(urlText: MovieEndpoint.trendingDaily.urlText,
            resultType: MovieListResponse.self,
            decodingStrategy: .convertFromSnakeCase,
            completion: completion)
    }
    
    func fetchWeeklyTrendingMovieList(completion: @escaping (Result<MovieListResponse, ApiError>) -> Void) {
        network.fetchData(urlText: MovieEndpoint.trendingWeekly.urlText,
            resultType: MovieListResponse.self,
            decodingStrategy: .convertFromSnakeCase,
            completion: completion)
    }
    
    func search(movieText: String, page: Int, completion: @escaping (Result<MovieListResponse, ApiError>) -> Void) {
        network.fetchData(urlText: MovieEndpoint.searchText(movieText, page: page).urlText,
            resultType: MovieListResponse.self,
            decodingStrategy: .convertFromSnakeCase,
            completion: completion)
    }
}
