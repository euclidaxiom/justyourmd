import SwiftUI

struct FilesList: View {
    var projects: [Project]

    private var files: [File] {
        projects.flatMap { $0.childrens }
    }

    var body: some View {

        List(files, children: \.children) { file in
            Group {
                if file.type == .project {
                    ProjectRow(project: file)
                } else if file.type == .folder {
                    FolderRow(folder: file)
                } else if file.type == .page {
                    PageRow(page: file)
                }
            }
            .fileRowContextMenu(file: file)
        }
    }
}
