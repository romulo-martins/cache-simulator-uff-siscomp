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

A implementação foi feita atraves da linguagem de programação ruby, uma linguagem interpretada multiparadigma.
Para informações sobre como instalar, tanto em Windows, Linux ou MAC, basta clicar [aqui](https://www.ruby-lang.org/pt/downloads/).

### Parametros

* `--size`: Representa o tamanho da cache.
* `--algorithm`: Representa o algoritmo de substituição de página escolhido, para o caso de mapeamento associativo, os algoritmos podem ser: `FIFO, LRU, LFU ou RANDOM`. No caso de mapeamento direto este parametro é ignorado.
* `--path`: Representa o caminho relativo ao arquivo de teste, que é um `.txt` com inteiros.
* `--mapping`: Representa o tipo de mapeamento, podendo ser direto ou associativo: `DIRECT ou ASSOCIATIVE`.
* `--set_size`: Representa o tamanho do conjunto para mapeamento associativo por conjunto, caso este parametro não seja passado, então é considerado o mapeamento associativo normal.

### Executando 

Para executar os testes basta ecolher o tamanho da cache, o algoritmo e passar o caminho do arquivo txt com os dados. Por exemplo:

* Comando
```
ruby main.rb --path tests/inputs/in1.txt --size 4 --algorithm FIFO --mapping ASSOCIATIVE
```

* Saida
```
-------- Cache --------
 Pos Cache | Mem. Ref. 
-----------------------
|         0|         2|
|         1|         0|
|         2|         3|
|         3|         1|
-----------------------
Mapeamento: Associativo 
Algoritmo: FIFO 
Misses: 9 
Hits: 3 
Taxa de acertos: 25.0% 
```

## Testes

Para realizar testes, foram criados arquivos `.txt` com um inteiro por linha que estão na pasta `inputs`. As entradas foram escolhidas com base em slides de aulas de diversas universidades, para realizar a comparação entre as saidas do script com as das aulas. 

Exemplo do arquivo de entrada `in1.txt`:

```
0 
2 
1 
6 
4 
0 
1 
0 
3
1 
2 
1
```

Para facilitar a comparação foi  criados arquivos com as entradas e saidas esperadas que estão na pasta `examples`.
Exemplo do arquivo de saidas esperadas `ex1.txt`:

```
Entrada:
0 2 1 6 4 0 1 0 3 1 2 1

Cache:
4

Saida:
===== FIFO =====
2
0
3
1
Misses: 9
Fault Rate: 0.75

===== LRU =====
2
0
1
3
Misses: 8
Fault Rate: 0.67

Referencia: 
http://www.idc-online.com/technical_references/pdfs/information_technology/Page_Replacement_Algorithms.pdf
```
