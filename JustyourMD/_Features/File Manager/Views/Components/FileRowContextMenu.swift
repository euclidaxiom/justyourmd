import SwiftUI

struct FileRowContextMenu: ViewModifier {
    let file: File

    func body(content: Content) -> some View {
        content
            .contextMenu {
                if file.type == .folder {
                    Button("Nova Pasta") {}
                    Button("Novo Arquivo") {}
                    Divider()
                }
                Button("Mostrar no Finder") {}
                Divider()
                Button("Excluir", role: .destructive) {}
            }
    }
}

extension View {
    func fileRowContextMenu(file: File) -> some View {
        modifier(FileRowContextMenu(file: file))
    }
}
