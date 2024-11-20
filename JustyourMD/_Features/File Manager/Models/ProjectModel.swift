import Foundation

struct Project: Identifiable {
    let id = UUID()
    var name: String
    var icon: String = "folder.fill"  // TO-DO: Aceitar imagens
    var path: String
    var rootFolder: String  // Pasta que contém os arquivos markdown
    var childrens: [File]  // Arquivos .md e pastas do rootFolder
    var isGitRepository: Bool
    var configurationFile: String?  // package.json, config.yml, etc

    // Computed property para verificar se o projeto é válido
    var isValid: Bool {
        isGitRepository && configurationFile != nil
    }
}
