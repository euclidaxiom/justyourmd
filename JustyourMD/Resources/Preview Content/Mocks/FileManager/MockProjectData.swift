import Foundation

enum MockProjectData {
    static let projects: [Project] = [
        Project(
            name: "Blog Pessoal",
            path: "/Users/dev/Projects/blog",
            rootFolder: "content",
            childrens: [
                File(
                    name: "Blog Pessoal", path: "/", type: .project,
                    fileStatus: .local,
                    children: [
                        File(
                            name: "posts",
                            path: "/content/posts",
                            type: .folder,
                            fileStatus: .online,
                            children: [
                                File(
                                    name: "primeiro-post.md",
                                    path: "/content/posts/primeiro-post.md",
                                    type: .page,
                                    fileStatus: .local,
                                    content:
                                        "# Meu Primeiro Post\n\nConteúdo do post..."
                                ),
                                File(
                                    name: "rascunho.md",
                                    path: "/content/posts/rascunho.md",
                                    type: .page,
                                    fileStatus: .draft,
                                    content:
                                        "# Rascunho\n\nIdéias para novos posts..."
                                ),
                            ]
                        ),
                        File(
                            name: "sobre.md",
                            path: "/content/sobre.md",
                            type: .page,
                            fileStatus: .online,
                            content: "# Sobre\n\nPágina sobre o blog..."
                        ),
                    ])
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
                    name: "Documentação",
                    path: "/",
                    type: .project,
                    fileStatus: .online,
                    children: [
                        File(
                            name: "getting-started.md",
                            path: "/docs/getting-started.md",
                            type: .page,
                            fileStatus: .online,
                            content: "# Começando\n\nGuia inicial..."
                        )
                    ]
                )
            ],
            isGitRepository: true,
            configurationFile: "package.json"
        ),
    ]
}
