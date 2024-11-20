import Foundation

enum FileType {
  case folder
  case page
}

enum GitStatus {
  case unmodified
  case modified
  case staged
  case untracked
}

struct File: Identifiable, Hashable {
  let id = UUID()
  var name: String
  var path: String
  var type: FileType
  var gitStatus: GitStatus
  var content: String?
  var children: [File]?

  // Implementação do Hashable
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: File, rhs: File) -> Bool {
    lhs.id == rhs.id
  }
}
