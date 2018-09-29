# Simulador de algoritmos de substituição de página de memória em cache

Trabalho da disciplina Sistemas de Computação UFF.

## Descrição

O projeto consiste em um simulador de algoritmos de substituição de página de memória em cache. 
O simulador recebe como entrada a sequência de referências às páginas de memória (endereços), e
simula as substituições realizadas em cache após a ocorrência de um miss, para os algoritmos
FIFO, LRU, LFU e RANDOM. O simulador assume um cache operando com o esquema de
mapeamento associativo. O programa recebe como parâmetro a capacidade total da memória
cache (ou seja, número total de páginas), além do caminho e nome do arquivo a ser lido pelo
programa, contendo as sequências de referências aos acessos de páginas da memória. O formato do
arquivo de entrada consiste em um valor de endereço de memória a ser carregada por linha no
arquivo. O simulador da como retorno, para cada política de substituição:
* A cada novo armazenamento na memória cache, a lista todas as páginas armazenadas na
memória cache;
* Ao final da execução, a fração de acertos às referências de memória.


## Implementação

A implementação foi feita atraves da linguagem de programação ruby. Que é uma linguagem interpretada multiparadigma.

### Parametros

`--size` Representa o tamanho da cache.
`--algorithm` Representa o algoritmo de substituição de página escolhido, para o caso de mapeamento associativo, os algoritmos podem ser: FIFO, LRU, LFU ou RANDOM. No caso de mapeamento direto este parametro é ignorado.
`--path` Representa o caminho relativo ao arquivo de teste, que é um `.txt` com inteiros.
`--mapping` Representa o tipo de mapeamento, podendo ser direto ou associativo {DIRECT, ASSOCIATIVE}.

### Executando 

Para executar os testes basta ecolher o tamanho da cache, o algoritmo e passar o caminho do arquivo txt com os dados. Por exemplo:

`ruby main.rb --path tests/example2.txt --size 4 --algorithm FIFO`

## Referências
* https://pt.wikipedia.org/wiki/Ruby_(linguagem_de_programa%C3%A7%C3%A3o)
