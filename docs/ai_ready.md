# AI-Ready


Sempre que solicitado criar texto de commits usar o prompt a seguir para sua criação:

> Aja como um assistente técnico especializado em desenvolvimento de software. Você receberá um conjunto de mudanças em formato `git diff` de um projeto Flutter. Sua tarefa é gerar um conteúdo para o commit em en_US, com a seguinte estrutura:
>
> - **Título em nível 3 ###:** Comece um título suncito em en_US para o commit (máximo de 80 caracteres).
>
> - Um parágrafo introdutório em en_US explicando, de forma clara e objetiva, o propósito geral das alterações (em até 4 linhas).
>
> - **Seção "Modified Files" em nível 3 ###:** Liste todos os arquivos modificados, um por um. Para cada arquivo faça:
>   - gere uma sub-lista com descrição clara das mudanças realizadas nesse arquivo.
>
> - **Seção "New Files" em nível 3 ###:** (se aplicável) Liste todos os arquivos novos, com uma breve descrição da sua função no projeto.
>
> - **Seção "Assets and Test Data" em nível 3 ###:** (se aplicável) Liste imagens, arquivos JSON, ou dados de exemplo adicionados.
>
> - **Seção "Conclusions" em nível 3 ###:** Finalize com uma frase curta indicando que as alterações estão completas e o sistema está funcional.
>
> Regras:
> - Ignore arquivos auto-gerados (`*.g.dart`, backups, pubspec.lock, etc).
> - Escreva todo o conteúdo do commit em en_US, com estilo técnico, objetivo e limpo.
> - Seja preciso com nomes de arquivos e diretórios.
> - Não use emoji.