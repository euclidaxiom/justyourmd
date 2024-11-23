import Foundation

enum MockProjectData {
  static let projects: [Project] = [
    Project(
      name: "Blog Pessoal",
      path: "/Users/dev/Projects/blog",
      rootFolder: "content",
      childrens: [
        File(
          name: "posts",
          path: "/content/posts",
          type: .folder,
          gitStatus: .unmodified,
          children: [
            File(
              name: "primeiro-post.md",
              path: "/content/posts/primeiro-post.md",
              type: .page,
              gitStatus: .modified,
              content: "# Meu Primeiro Post\n\nConteúdo do post..."
            ),
            File(
              name: "rascunho.md",
              path: "/content/posts/rascunho.md",
              type: .page,
              gitStatus: .untracked,
              content: "# Rascunho\n\nIdéias para novos posts..."
            ),
          ]
        ),
        File(
          name: "sobre.md",
          path: "/content/sobre.md",
          type: .page,
          gitStatus: .staged,
          content: "# Sobre\n\nPágina sobre o blog..."
        ),
      ],
      isGitRepository: true,
      configurationFile: "config.yml"
    ),
    Project(
      name: "Documentação",
      path: "/Users/dev/Projects/docs",
      rootFolder: "docs",
      childrens: [
        File(
          name: "getting-started.md",
          path: "/docs/getting-started.md",
          type: .page,
          gitStatus: .unmodified,
          content: "# Começando\n\nGuia inicial..."
        )
      ],
      isGitRepository: true,
      configurationFile: "package.json"
    ),
  ]
}
