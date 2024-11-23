import Foundation

enum FileType {
    case project
    case folder
    case page
}

enum FileStatus {
    case online
    case local
    case draft
}

struct File: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var path: String
    var type: FileType
    var fileStatus: FileStatus
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
