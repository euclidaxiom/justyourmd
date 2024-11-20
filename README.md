# JustYourMD

Editor WYSIWYG (Notion like) de Markdown para projetos web, com gerenciamento Git integrado e preview em tempo real.

![Status: Em Desenvolvimento](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow)
![Plataforma: macOS](https://img.shields.io/badge/Plataforma-macOS%2013%2B-blue)

## 💡 Visão Geral

JustYourMD é um editor focado em simplificar e melhorar a experiência de edição de conteúdo em projetos web baseados em markdown - Não quero mais abrir um IDE só para editar um markdown, nem editar um markdown digitando `##` invés de `/h2`.

Se quiser saber tudo em detalhes, leia o [SRS](Docs/SRS.md).

### Features Planejadas

- 📝 Editor WYSIWYG nativo em SwiftUI
- 📁 Gerenciamento de arquivos markdown
- 🔄 Integração Git/GitHub
- 👀 Preview em tempo real

## 🤝 Contribuindo

**Atenção desenvolvedores backend**: Sou desenvolvedor frontend então toda ajuda será bem-vinda.

[Veja o guia de contribuição](.github/CONTRIBUTING.md)

## 📋 Roadmap

### Fase 1 - Gerenciador de Arquivos (Atual)

- [ ] Interface do gerenciador (Em desenvolvimento)
- [ ] Implementação do FileService
- [ ] Testes do módulo

### Fase 2 - Editor WYSIWYG

- [ ] Interface do editor
- [ ] Parser markdown
- [ ] Implementação do EditorService
- [ ] Testes do módulo

### Fase 3 - Integração Git

- [ ] Interface de controle Git
- [ ] Implementação do GitService
- [ ] Testes do módulo

### Fase 4 - Preview

- [ ] Interface de preview
- [ ] Servidor de desenvolvimento
- [ ] Testes do módulo

### Fase 5 - Polimento

- [ ] Adicionar suporte para markdown com componentes, como `.mdx` e `.mdsvex`

### Possíveis próximas fases

- [ ] Completar os requisitos e subir na App Store
- [ ] Versão para Windows
- [ ] Estudar a possibilidade de criar uma versão mobile
