# Convenção de Commits do Justyourmd

## Formato do Commit

```bash
[<prefixo>] <tipo>(<escopo>): <descrição>

[corpo]
```

## Prefixos: Sinalizando o Contexto

- **[WIP]** Trabalho em andamento
- **[POC]** Prova de conceito
- **[TEMP]** Solução temporária
- **[REF]** Refatoração necessária

## Tipos de Commits

- **init**: Configuração inicial
- **struct**: Estruturação base
- **impl**: Implementação de funcionalidade
- **ui**: Componentes e layouts
- **mock**: Dados de teste
- **test**: Testes
- **docs**: Documentação
- **fix**: Correções

## Escopos

### Features

- **files-ui**: Gerenciador de arquivos (interface)
- **files-core**: Gerenciador de arquivos (lógica)
- **editor-ui**: Editor WYSIWYG (interface)
- **editor-core**: Editor (parser e lógica)
- **git-core**: Integração Git
- **preview-ui**: Interface de preview
- **preview-core**: Servidor de preview

### Global

- **shared-core**: Serviços base
- **config**: Configurações
- **deps**: Dependências
- **docs**: Documentação
- **test**: Testes gerais

---

## Boas Práticas

1. Seja específico e claro
2. Identifique o estágio da implementação
3. Documente decisões importantes

---

## Exemplos

- init(files-ui): Configura FileManagerView
- struct(files-core): Define protocolos FileService
- [WIP] impl(files-core): Início do FileSystemService
