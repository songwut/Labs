//
//  DocumentPickerSwiftUI.swift
//  picker
//
//  Created by Songwut Maneefun on 31/3/2565 BE.
//

import Foundation
import SwiftUI
import UIKit
import UniformTypeIdentifiers

struct DocumentPickerSwiftUI: UIViewControllerRepresentable {
    
    @Binding var file: URL?
    var types = ["public.item"]
    
    func makeCoordinator() -> DocumentPickerSwiftUI.Coordinator {
        return DocumentPickerSwiftUI.Coordinator(parent1: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPickerSwiftUI>) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(documentTypes: self.types, in: .import)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: DocumentPickerSwiftUI.UIViewControllerType, context: UIViewControllerRepresentableContext<DocumentPickerSwiftUI>) {
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        
        var parent: DocumentPickerSwiftUI
        
        init(parent1: DocumentPickerSwiftUI) {
            self.parent = parent1
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            print("documentPicker: \(url)")
            self.parent.file = url
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            print("documentPicker: cancel")
            self.parent.file = nil
        }
    }
}
