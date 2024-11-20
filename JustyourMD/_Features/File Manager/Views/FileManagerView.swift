import SwiftUI

struct FileManagerView: View {
    @StateObject var viewModel: FileManagerViewModel

    var body: some View {
        if viewModel.projects.isEmpty {
            NoProjects()
        } else {
            List {
                ForEach(viewModel.projects) { project in
                    DisclosureGroup {
                        if !project.childrens.isEmpty {
                            FilesList(files: project.childrens)
                        }
                    } label: {
                        ProjectRow(project: project)
                    }
                }
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
