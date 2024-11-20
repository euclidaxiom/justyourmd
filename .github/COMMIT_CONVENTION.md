# Convenção de Commits

## Formato

<tipo>(<escopo>): <descrição>

[corpo]

[issue/task]

## Tipos Principais

- init: Configuração inicial de feature/módulo
- struct: Estruturação base (MVVM, protocolos, etc)
- impl: Implementação de funcionalidade
- ui: Componentes e layouts
- mock: Dados e serviços de teste
- test: Testes unitários/UI
- docs: Documentação
- fix: Correções

## Escopos

### Features

- files-ui: Interface do gerenciador de arquivos
- files-core: Lógica/serviços do gerenciador
- editor-ui: Interface do editor WYSIWYG
- editor-core: Parser e lógica do editor
- git-core: Serviços de integração Git
- preview-ui: Interface de preview
- preview-core: Servidor e lógica de preview

### Global

- shared-ui: Componentes e estilos compartilhados
- shared-core: Serviços e utilitários base
- config: Configurações do projeto
- deps: Dependências e pacotes
- docs: Documentação
- test: Testes (quando afeta múltiplas features)

## Prefixos Especiais

- [WIP] - Trabalho em progresso
- [POC] - Prova de conceito
- [TEMP] - Solução temporária
- [REF] - Necessita refatoração futura

## Exemplos

- init(files-ui): setup básico do FileManagerView
- struct(files-core): define protocolos do FileService
- impl(shared-ui): adiciona ProjectLabelStyle
- mock(files): adiciona dados de teste para projetos
- ui(files-ui): implementa NoProjectsView
- [WIP] impl(files-core): início do FileSystemService

## Regras

1. Seja específico sobre o estágio da implementação
2. Indique claramente código temporário/POC
3. Referencie tasks do projeto quando relevante
4. Documente decisões importantes no corpo
5. Marque dependências e requisitos pendentes
