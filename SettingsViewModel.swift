//
//  SettingsViewModel.swift
//  TemplatesExampleApp
//
//  Created by Marko Benačić on 06.01.2023..
//

import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    struct Input {
        var viewDidAppear: AnyPublisher<Void, Never>
    }

    struct Output {
        var title: String = ""
    }
    @Published var output = Output()

    enum NavigationEvent {
    }
    var navigationEvent = PassthroughSubject<NavigationEvent, Never>()

    func bind(_ input: Input) {
        input.viewDidAppear
            .prefix(1)
            .receive(on: DispatchQueue.global(qos: .background))
            .sink { [weak self] in
            }
            .store(in: &cancellables)
    }
}
