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
