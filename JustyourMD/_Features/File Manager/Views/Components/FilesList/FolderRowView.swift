import SwiftUI

struct FolderRow: View {
    let folder: File

    var body: some View {
        Label(folder.name, systemImage: "folder.fill")
    }
}
