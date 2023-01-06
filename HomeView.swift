//
//  HomeView.swift
//  TemplatesExampleApp
//
//  Created by Marko Benačić on 06.01.2023..
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    private let onAppear = PassthroughSubject<Void, Never>()

    init (viewModel: HomeViewModel) {
        self.viewModel = viewModel

        bindInputs()
    }

    func bindInputs() {
        let input = HomeViewModel.Input(
            viewDidAppear: onAppear.eraseToAnyPublisher()
        )
        viewModel.bind(input)
    }
    
    var body: some View {
        Group {
            Text(viewModel.output.title)
        }
        .onAppear {
            onAppear.send()
        }
    }
}

struct HomePreviews: PreviewProvider {
    static var previews: some View {
        let view = HomeView(
            viewModel: HomeViewModel()
        )
        return view
    }
}

