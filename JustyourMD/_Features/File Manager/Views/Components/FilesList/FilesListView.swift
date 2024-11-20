import SwiftUI

struct FilesList: View {
    var files: [File]

    var body: some View {
        List(files, children: \.children) { file in
            Group {
                if file.type == .folder {
                    FolderRow(folder: file)
                } else if file.type == .page {
                    PageRow(page: file)
                }
            }
            .fileRowContextMenu(file: file)
        }
    }
}
