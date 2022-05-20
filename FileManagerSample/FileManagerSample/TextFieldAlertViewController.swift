//
//  TextFieldAlertViewController.swift
//  FileManagerSample
//
//  Created by Galina Aleksandrova on 09/05/22.
//

import Combine
import SwiftUI


class TextFieldAlertViewController: UIViewController {

    // MARK: - Properties
    private let alertTitle: String
    private let message: String?
    private var isPresented: Binding<Bool>?
    private var subscription: AnyCancellable?
    
    // MARK: - Life Cycle
    init(title: String, message: String?, isPresented: Binding<Bool>?) {
        self.alertTitle = title
        self.message = message
        self.isPresented = isPresented
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           
           presentAlertController()
       }

       // MARK: - Methods
       private func presentAlertController() {
           guard subscription == nil else { return }
           let ac = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
           
           ac.view.tintColor = .red
           
           ac.addTextField()
           ac.textFields![0].placeholder = "Title"
           
          
           //ac.textFields![1].placeholder = "Description"

           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
               self?.isPresented?.wrappedValue = false
           }
           let createAction = UIAlertAction(title: "Create", style: .default) { [unowned ac] _ in
               let title = ac.textFields![0].text!
               
               let note = Note(title: title)
               
               DataProvider.shared.create(note: note)
           }
           
           ac.addAction(cancelAction)
           ac.addAction(createAction)
           present(ac, animated: true, completion: nil)
       }
}


struct TextFieldAlert {

    // MARK: Properties
    let title: String
    let message: String?
    var isPresented: Binding<Bool>? = nil

    // MARK: - Methods
    func dismissable(_ isPresented: Binding<Bool>) -> TextFieldAlert {
        TextFieldAlert(title: title, message: message, isPresented: isPresented)
    }
}

extension TextFieldAlert: UIViewControllerRepresentable {

    typealias UIViewControllerType = TextFieldAlertViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<TextFieldAlert>) -> UIViewControllerType {
        TextFieldAlertViewController(title: title, message: message, isPresented: isPresented)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<TextFieldAlert>) {}
}

struct TextFieldWrapper<PresentingView: View>: View {

    // MARK: - Properties
    @Binding var isPresented: Bool
    let presentingView: PresentingView
    let content: () -> TextFieldAlert

    // MARK: - UI Elements
    var body: some View {
        ZStack {
            if (isPresented) { content().dismissable($isPresented) }
            presentingView
        }
    }
}


extension View {
    
    // MARK: - Methods
    func textFieldAlert(isPresented: Binding<Bool>, content: @escaping () -> TextFieldAlert) -> some View {
        TextFieldWrapper(isPresented: isPresented, presentingView: self, content: content)
    }
}
