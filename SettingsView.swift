//
//  SettingsView.swift
//  TemplatesExampleApp
//
//  Created by Marko Benačić on 06.01.2023..
//

import SwiftUI
import Combine

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    private let onAppear = PassthroughSubject<Void, Never>()

    init (viewModel: SettingsViewModel) {
        self.viewModel = viewModel

        bindInputs()
    }

    func bindInputs() {
        let input = SettingsViewModel.Input(
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

struct SettingsPreviews: PreviewProvider {
    static var previews: some View {
        let view = SettingsView(
            viewModel: SettingsViewModel()
        )
    }
}
