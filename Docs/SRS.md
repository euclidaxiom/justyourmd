# Especificação de Requisitos de Software

## JustYourMD - Editor de Markdown para Projetos Web

### 1. Introdução

#### 1.1 Propósito

Este documento especifica os requisitos para o JustYourMD, um aplicativo nativo para macOS focado em edição de conteúdo markdown para projetos web.

#### 1.2 Escopo do Produto

JustYourMD é um editor de markdown WYSIWYG que simplifica o fluxo de trabalho de edição de conteúdo em projetos web baseados em arquivos markdown, integrando funcionalidades de gerenciamento de arquivos, controle de versão Git e pré-visualização do projeto.

#### 1.3 Público-Alvo

- Desenvolvedores web que mantêm projetos baseados em markdown
- Redatores técnicos que trabalham com documentação em markdown
- Criadores de conteúdo que utilizam geradores de sites estáticos

### 2. Descrição Geral

#### 2.1 Perspectiva do Produto

JustYourMD é um aplicativo standalone para macOS que oferece uma alternativa simplificada às IDEs tradicionais quando o foco é apenas a edição de conteúdo markdown.

#### 2.2 Funcionalidades Principais

- Gerenciamento de arquivos markdown
- Editor WYSIWYG nativo
- Integração Git
- Pré-visualização do projeto em tempo real

#### 2.3 Restrições

- Compatível apenas com macOS 13.0 ou superior
- Requer conexão com internet para funcionalidades Git
- Suporta apenas projetos que utilizam markdown como fonte de conteúdo

### 3. Requisitos Específicos

#### 3.1 Requisitos Funcionais

##### 3.1.1 Configuração de Projeto

- O sistema deve permitir selecionar uma pasta raiz do projeto
- O sistema deve permitir selecionar uma subpasta específica para arquivos markdown
- O sistema deve validar a estrutura do projeto selecionado:
  - Verificar se é um repositório Git válido (.git presente)
  - Verificar se existe pelo menos um arquivo markdown na pasta selecionada
  - Verificar se existe um arquivo de configuração do projeto (package.json, etc.)
  - Verificar permissões de leitura/escrita nas pastas
- O sistema deve armazenar as configurações do projeto localmente

##### 3.1.2 Gerenciamento de Arquivos

- O sistema deve listar todos os arquivos markdown da pasta selecionada
- O sistema deve permitir abrir e editar arquivos markdown
- O sistema deve permitir operações de arquivo:
  - Criar novos arquivos markdown e subpastas
  - Renomear arquivos e pastas existentes
  - Mover arquivos entre subpastas via drag-and-drop
  - Deletar arquivos e pastas (com confirmação)
- O sistema deve salvar alterações automaticamente
- O sistema deve monitorar mudanças nos arquivos em tempo real
- O sistema deve atualizar a árvore de arquivos automaticamente após modificações

##### 3.1.3 Editor Markdown

- O sistema deve fornecer uma interface WYSIWYG para edição
- O sistema deve suportar formatação básica de markdown
- O sistema deve preservar a sintaxe markdown original
- O sistema deve validar a estrutura do documento:
  - Verificar e alertar sobre problemas comuns de formatação

##### 3.1.4 Integração Git

- O sistema deve detectar o repositório Git do projeto
- O sistema deve mostrar o status de cada arquivo (local/remoto)
- O sistema deve permitir operações commit/push
- O sistema deve integrar com GitHub:
  - Autenticação OAuth com conta GitHub
  - Listar repositórios disponíveis
  - Conectar repositório local com remoto
  - Sincronizar alterações com repositório remoto
  - Mostrar histórico básico de commits

##### 3.1.5 Pré-visualização

- O sistema deve executar o script de desenvolvimento do projeto
- O sistema deve exibir a pré-visualização em uma janela interna
- O sistema deve atualizar a pré-visualização automaticamente
- O sistema deve gerenciar o processo do servidor de desenvolvimento

#### 3.2 Requisitos Não-Funcionais

##### 3.2.1 Usabilidade

- Interface nativa macOS seguindo Human Interface Guidelines
- Tempo de resposta máximo de 100ms para operações locais
- Feedback visual claro para todas as operações
- Suporte a atalhos de teclado padrão do macOS

##### 3.2.2 Confiabilidade

- Backup automático antes de operações críticas
- Recuperação automática em caso de falhas
- Validação de todas as operações de arquivo
- Logs detalhados para diagnóstico

##### 3.2.3 Performance

- Inicialização do aplicativo em menos de 2 segundos
- Carregamento de arquivos em menos de 1 segundo
- Uso máximo de memória de 512MB
- Processamento assíncrono para operações pesadas

##### 3.2.4 Segurança

- Conformidade com sandbox do macOS
- Criptografia de credenciais Git
- Validação de todas as entradas do usuário
- Proteção contra injeção de comandos

### 4. Interfaces

#### 4.1 Interface do Usuário

- Layout em três painéis (navegador, editor, preview)
- Barra de ferramentas nativa
- Menu contextual padrão macOS
- Indicadores visuais de status Git

#### 4.2 Interface de Software

- Integração com sistema de arquivos macOS
- Comunicação com servidores Git
- Interação com servidor de desenvolvimento local
- Parsing e renderização markdown

### 5. Requisitos de Sistema

#### 5.1 Hardware Mínimo

- macOS 13.0 ou superior
- 8GB RAM
- 256MB espaço em disco
- Processador Apple Silicon ou Intel x64

#### 5.2 Software Necessário

- Git instalado e configurado
- Ambiente de desenvolvimento do projeto configurado
- Conexão com internet para operações Git

### 6. Especificações Técnicas

#### 6.1 Arquitetura do Sistema

##### 6.1.1 Padrões de Design

- MVVM (Model-View-ViewModel) como arquitetura base
- Observer Pattern para atualizações reativas
- Command Pattern para operações de arquivo
- Repository Pattern para acesso a dados
- Factory Pattern para criação de ViewModels

##### 6.1.2 Estrutura de Módulos

- Core: Serviços fundamentais e utilitários
- Features: Módulos independentes por funcionalidade
- Infrastructure: Componentes de baixo nível
- Presentation: Camada de interface do usuário

##### 6.1.3 Fluxo de Dados

- Unidirecional (one-way data flow)
- Estado centralizado por módulo
- Atualizações via Combine publishers
- Operações assíncronas via async/await

##### 6.1.4 Padrão de Comunicação MVVM

###### Estrutura Base

```swift
// Service: Lógica de negócio e operações
protocol FileServiceProtocol {
    func loadFiles() async throws -> [FileItem]
    func saveFile(_ file: FileItem) async throws
}

// ViewModel: Estado e lógica de apresentação
@MainActor
class FileManagerViewModel: ObservableObject {
    @Published private(set) var files: [FileItem] = []
    @Published private(set) var isLoading = false
    private let service: FileServiceProtocol

    init(service: FileServiceProtocol) {
        self.service = service
    }

    func loadFiles() async {
        isLoading = true
        defer { isLoading = false }

        do {
            files = try await service.loadFiles()
        } catch {
            // Tratamento de erro
        }
    }
}

// View: Interface e interação do usuário
struct FileManagerView: View {
    @StateObject var viewModel: FileManagerViewModel

    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.files) { file in
                    FileRowView(file: file)
                }
            }
        }
        .task {
            await viewModel.loadFiles()
        }
    }
}
```

###### Divisão de Responsabilidades

1. **Services**

   - Lógica de negócio pura
   - Operações assíncronas
   - Comunicação com APIs externas
   - Não mantém estado

   Exemplo:

   ```swift
   class GitService: GitServiceProtocol {
       func commit(message: String) async throws {
           // Executa comando git
           // Trata erros
           // Retorna resultado
       }
   }
   ```

2. **ViewModels**

   - Gerenciamento de estado da UI
   - Transformação de dados para a View
   - Coordenação entre Services
   - Tratamento de erros de UI

   Exemplo:

   ```swift
   @MainActor
   class EditorViewModel: ObservableObject {
       @Published private(set) var document: Document
       @Published private(set) var isSaving = false

       private let fileService: FileServiceProtocol
       private let gitService: GitServiceProtocol

       func saveAndCommit() async throws {
           isSaving = true
           defer { isSaving = false }

           try await fileService.save(document)
           try await gitService.commit(message: "Update \(document.name)")
       }
   }
   ```

3. **Views**

   - Apresentação visual
   - Interação do usuário
   - Binding com ViewModel
   - Não contém lógica de negócio

   Exemplo:

   ```swift
   struct EditorView: View {
       @StateObject var viewModel: EditorViewModel

       var body: some View {
           VStack {
               TextEditor(text: $viewModel.document.content)

               Button("Salvar") {
                   Task {
                       try? await viewModel.saveAndCommit()
                   }
               }
               .disabled(viewModel.isSaving)
           }
       }
   }
   ```

###### Fluxo de Comunicação

1. **View → ViewModel**

   - Através de métodos
   - Via bindings
   - Usando actions

2. **ViewModel → View**

   - Via @Published properties
   - Através de @State binding
   - Usando Combine publishers

3. **ViewModel → Service**

   - Chamadas diretas assíncronas
   - Através de protocolos
   - Injeção de dependência

4. **Service → ViewModel**
   - Retornos assíncronos
   - Throws de erros
   - Callbacks via closures (quando necessário)

###### Boas Práticas

1. **Injeção de Dependência**

   ```swift
   class FileManagerViewModel {
       init(fileService: FileServiceProtocol,
            gitService: GitServiceProtocol) {
           // Injeção via construtor
       }
   }
   ```

2. **Tratamento de Erros**

   ```swift
   extension FileManagerViewModel {
       @MainActor
       func handleError(_ error: Error) {
           errorMessage = error.localizedDescription
           showError = true
       }
   }
   ```

3. **Estado Imutável**

   ```swift
   struct EditorState {
       let document: Document
       let isSaving: Bool
       let error: Error?
   }
   ```

4. **Previews para Desenvolvimento**
   ```swift
   struct EditorView_Previews: PreviewProvider {
       static var previews: some View {
           EditorView(viewModel: .preview)
       }
   }
   ```

#### 6.2 Padrões de Desenvolvimento

##### 6.2.1 Convenções de Código

- Swift Style Guide da Apple
- Documentação em formato DocC
- Nomenclatura descritiva em inglês
- Organização por funcionalidade

##### 6.2.2 Práticas de Desenvolvimento

- TDD para serviços críticos
- Code review pessoal antes de commits
- Commits semânticos
- Logs detalhados para debugging

##### 6.2.3 Gestão de Estado

- Source of truth única por módulo
- Estados imutáveis
- Atualizações atômicas
- Persistência automática de configurações

#### 6.3 Considerações de UI/UX

##### 6.3.1 Padrões Visuais

- Aderência ao macOS Design System
- Consistência com apps nativos
- Feedback visual imediato
- Animações suaves nativas

##### 6.3.2 Interações

- Drag and drop nativo
- Atalhos de teclado padrão
- Menus contextuais
- Gestos trackpad

### 7. Estrutura do Projeto

#### 7.1 Organização de Diretórios

```plaintext
JustYourMD/
├── App/
│   ├── JustYourMDApp.swift       # Entry point do aplicativo
│   └── AppDelegate.swift         # Lifecycle e configurações globais
│
├── Features/                     # Módulos independentes
│   ├── ProjectSetup/            # Configuração inicial
│   │   ├── Views/
│   │   │   └── ProjectSetupView.swift
│   │   ├── ViewModels/
│   │   │   └── ProjectSetupViewModel.swift
│   │   └── Models/
│   │       └── ProjectConfiguration.swift
│   │
│   ├── FileManager/             # Gerenciamento de arquivos
│   │   ├── Views/
│   │   │   ├── FileManagerView.swift
│   │   │   └── FileRowView.swift
│   │   ├── ViewModels/
│   │   │   └── FileManagerViewModel.swift
│   │   └── Models/
│   │       └── FileItem.swift
│   │
│   ├── Editor/                  # Editor WYSIWYG
│   │   ├── Views/
│   │   │   ├── EditorView.swift
│   │   │   └── ToolbarView.swift
│   │   ├── ViewModels/
│   │   │   └── EditorViewModel.swift
│   │   └── Models/
│   │       └── Document.swift
│   │
│   └── Preview/                 # Pré-visualização
│       ├── Views/
│       │   └── PreviewView.swift
│       └── ViewModels/
│           └── PreviewViewModel.swift
│
├── Core/                        # Componentes compartilhados
│   ├── Services/
│   │   ├── GitService.swift     # Operações Git
│   │   ├── FileService.swift    # Operações de arquivo
│   │   └── PreviewService.swift # Servidor de preview
│   │
│   ├── Models/
│   │   └── SharedModels.swift   # Modelos compartilhados
│   │
│   └── Utils/
│       ├── Extensions/          # Extensões Swift/AppKit
│       └── Constants.swift      # Constantes globais
│
└── Resources/                   # Recursos estáticos
    └── Assets.xcassets
```

#### 7.2 Fluxo de Dados e Dependências

##### 7.2.1 Comunicação Entre Módulos

- ProjectSetup → FileManager: Configurações de pasta
- FileManager → Editor: Seleção de arquivo
- Editor → Preview: Conteúdo atualizado
- Core Services → Todos os módulos: Serviços compartilhados

##### 7.2.2 Responsabilidades dos Componentes

- App: Inicialização e configuração global
- Features: Funcionalidades independentes
- Core: Serviços e utilitários compartilhados
- Resources: Ativos estáticos

#### 7.3 Convenções de Código

##### 7.3.1 Nomenclatura de Arquivos

- Views: `NomeView.swift`
- ViewModels: `NomeViewModel.swift`
- Models: `NomeModel.swift`
- Services: `NomeService.swift`

##### 7.3.2 Protocolos e Extensions

- Protocolos de serviço: `NomeServicing`
- Extensions: `Type+Categoria.swift`

### 8. Limitações e Exclusões

- Não suporta edição colaborativa em tempo real
- Não inclui funcionalidades de merge/resolução de conflitos
- Não oferece integração com serviços além do Git
- Não suporta plugins ou extensões de terceiros
