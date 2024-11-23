import SwiftUI

struct FileManagerView: View {
    @StateObject var viewModel: FileManagerViewModel

    var body: some View {
        if viewModel.projects.isEmpty {
            NoProjects()
        } else {
            Group {
                FilesList(projects: viewModel.projects)
            }
            .task {
                await viewModel.loadProjects()
            }
        }
    }
}

struct FileManagerView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView(viewModel: MockFileManagerViewModel())
    }
}
