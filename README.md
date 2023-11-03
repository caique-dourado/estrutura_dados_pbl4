# Projeto de Ordenação de Nomes

Este projeto é um exemplo de implementação de algoritmos de ordenação para classificar uma lista de nomes em um aplicativo Flutter.

## Tabela de Conteúdos

- [Visão Geral](#visão-geral)
- [Recursos](#recursos)
- [Algoritmos de Ordenação](#algoritmos-de-ordenação)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Visão Geral

Este projeto visa demonstrar como implementar algoritmos de ordenação para otimizar a classificação de nomes em um aplicativo Flutter. Ele fornece exemplos de algoritmos de ordenação, como QuickSort, MergeSort, InsertionSort e HeapSort, com o objetivo de comparar seus desempenhos.

## Recursos

- Implementação dos algoritmos QuickSort, MergeSort, InsertionSort e HeapSort.
- Exibição de nomes classificados em ordem alfabética.
- Medição do tempo de execução de cada algoritmo.

## Algoritmos de Ordenação

O projeto inclui implementações dos seguintes algoritmos de ordenação:

- **QuickSort**: Este algoritmo de ordenação é eficiente e geralmente supera outros algoritmos em muitas situações.
- **MergeSort**: Um algoritmo de ordenação estável que é útil para classificar listas encadeadas.
- **InsertionSort**: Um algoritmo de ordenação simples e eficaz para listas pequenas.
- **HeapSort**: Um algoritmo de ordenação baseado em estruturas de heap.

## Requisitos

Declare todos os requisitos necessários para executar o seu projeto. Isso pode incluir:

- Flutter SDK : '>=3.1.4 <4.0.0'
- Dependências específicas do projeto:
        http: ^1.1.0
        shared_preferences: ^2.2.2
        syncfusion_flutter_charts: ^23.1.43

## Instalação
Não foi gerado um realease (apk) da aplicação, por isso para usar o aplicativo, siga o passo a passo de configuração do ambiente Flutter na documentação disponível em: https://docs.flutter.dev/get-started/install

## Uso

##### Iniciando Servidor
O comando abaixo rodará o servidor basedo nas configurações que estão no arquivo config.yaml
Entre na pasta onde você executou o comando create e execute
``` json_rest_server run ```
Este projeto é uma aplicação de exemplo que demonstra diferentes algoritmos de ordenação e como eles afetam o tempo de execução. O uso básico do aplicativo envolve o seguinte:
##### Usando o aplicativo
1. Ao abrir o aplicativo, você será apresentado com a tela principal, onde encontrará botões representando diferentes métodos de ordenação, como **QuickSort**, **MergeSort**, **InsertionSort** e **HeapSort**.
2. Toque em um dos botões para escolher o método de ordenação que deseja visualizar. Cada algoritmo de ordenação será aplicado aos dados do conjunto de pessoas.
3. Depois de selecionar um algoritmo, você será levado para a tela "Resultados" que exibirá os dados ordenados e um gráfico comparativo do tempo de execução de cada algoritmo.
4. No botão **Ver resultado**, você poderá visualizar o tempo que cada algoritmo de ordenação levou para classificar os dados. Isso fornecerá uma compreensão clara de quais algoritmos são mais eficientes em termos de velocidade usando a base de dados.


## Contribuição

Se você deseja contribuir para este projeto, ficaremos felizes em receber suas contribuições. Você pode contribuir de várias maneiras:
1. **Reportar Problemas:** Se você encontrar algum problema ou bug na aplicação, sinta-se à vontade para abrir uma "Issue" em nosso repositório. Certifique-se de fornecer detalhes claros sobre o problema encontrado.
2. **Sugestões e Aprimoramentos:** Se você tiver ideias para melhorar a aplicação, como adicionar novos recursos, otimizar o código existente ou aprimorar a interface do usuário, compartilhe suas sugestões em uma "Issue".
3. **Desenvolvimento Ativo:** Se você deseja contribuir diretamente com código, crie um "Pull Request" com suas alterações. Certifique-se de seguir as práticas recomendadas de codificação e documentação.
4. **Documentação:** Melhorar a documentação é sempre uma forma valiosa de contribuição. Se você encontrar partes da documentação que podem ser aprimoradas, sinta-se à vontade para abrir um "Pull Request" com essas melhorias.

Lembre-se de seguir as diretrizes de contribuição deste projeto e respeitar o código de conduta. Todas as contribuições são bem-vindas e apreciadas!
