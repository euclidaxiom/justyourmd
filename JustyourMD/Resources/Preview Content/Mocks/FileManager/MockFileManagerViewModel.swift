import Foundation
import SwiftUI

class MockFileManagerViewModel: FileManagerViewModel {
  // MARK: - Mock Data
  private var mockProjects: [Project] = MockProjectData.projects

  // MARK: - Initialization
  override init() {
    super.init()
    updateProjects(mockProjects)
  }

  // MARK: - Override Methods
  override func loadProjects() async {
    await simulateLoading {
      updateProjects(self.mockProjects)
    }
  }

  override func createFolder(name: String, at path: String, in project: Project) async throws {
    await simulateLoading {
      let newFolder = File(
        name: name,
        path: "\(path)/\(name)",
        type: .folder,
        gitStatus: .untracked,
        children: []
      )

      addFileToProject(newFolder, at: path, in: project)
    }
  }

  override func createPage(name: String, at path: String, in project: Project) async throws {
    await simulateLoading {
      let newPage = File(
        name: name.hasSuffix(".md") ? name : "\(name).md",
        path: "\(path)/\(name)",
        type: .page,
        gitStatus: .untracked,
        content: "# Novo Arquivo\n\n",
        children: nil
      )

      addFileToProject(newPage, at: path, in: project)
    }
  }

  // MARK: - Helper Methods
  private func simulateLoading<T>(_ operation: () throws -> T) async rethrows -> T {
    updateLoadingState(true)
    defer { updateLoadingState(false) }

    try? await Task.sleep(nanoseconds: 500_000_000)

    return try operation()
  }

  private func addFileToProject(_ file: File, at path: String, in project: Project) {
    if let projectIndex = projects.firstIndex(where: { $0.id == project.id }) {
      var updatedProject = project
      addFile(file, to: path, in: &updatedProject.childrens)
      var updatedProjects = projects
      updatedProjects[projectIndex] = updatedProject
      updateProjects(updatedProjects)
    }
  }

  private func addFile(_ file: File, to path: String, in files: inout [File]) {
    for index in files.indices {
      if files[index].path == path {
        files[index].children?.append(file)
        return
      } else if var children = files[index].children {
        addFile(file, to: path, in: &children)
        files[index].children = children
      }
    }
  }
}
