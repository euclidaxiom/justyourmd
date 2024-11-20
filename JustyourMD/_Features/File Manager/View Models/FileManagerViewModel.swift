import Foundation
import SwiftUI

class FileManagerViewModel: ObservableObject {
  @Published private(set) var projects: [Project] = []
  @Published private(set) var isLoading = false
  @Published private(set) var errorMessage: String?
  @Published private(set) var selectedFile: File?

  func loadProjects() async {
    // Implementação base
  }

  func createFolder(name: String, at path: String, in project: Project) async throws {
    // Implementação base
  }

  func createPage(name: String, at path: String, in project: Project) async throws {
    // Implementação base
  }

  func createFile(name: String, at path: String, in project: Project) async throws {
    // Implementação base
  }

  func deleteFile(_ file: File, from project: Project) async throws {
    // Implementação base
  }

  func moveFile(_ file: File, to newPath: String, in project: Project) async throws {
    // Implementação base
  }

  func renameFile(_ file: File, to newName: String, in project: Project) async throws {
    // Implementação base
  }

  // MARK: - Protected Methods
  func updateProjects(_ newProjects: [Project]) {
    DispatchQueue.main.async {
      self.projects = newProjects
    }
  }

  func updateLoadingState(_ isLoading: Bool) {
    DispatchQueue.main.async {
      self.isLoading = isLoading
    }
  }

  func updateErrorMessage(_ message: String?) {
    DispatchQueue.main.async {
      self.errorMessage = message
    }
  }
}
