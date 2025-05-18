# ZÉ BOMBINHA

Nossa versão do jogo Bomber Men feita para rodar no processador do Simões.
Link para o repositório do processador do ICMC (A.K.A. processador do Simões): https://github.com/simoesusp/Processador-ICMC

## 1. Como rodar isso na sua máquina

### 1.1 Caso vc use Linux

Abra seu terminal e digite:

```sh
git clone git@github.com:Gaius10/ze_bombinha.git 
cd ze_bombinha
make run
```
### 1.2 Caso vc use Windows

Desinstale seu sistema operacional, instale alguma distro Linux e então pule para o capítulo 1.1

## 2. Gostou do framework? Quer copiar a gente?

Um esqueleto desse repositório ficará disponível em algum lugar do github.
Ele conterá apenas nosso makefile, os utilitários e a estrutura de pastas, é só baixar e começar a codar em assembly!

## 3. Organização das pastas

@todo

## 4. Convenções

- r0 reservado para retorno de funções
- Funções sempre darão push de tras pra frente
    - primeiro r7
    - segundo r6
    - etc...
- Passagem de parâmetros também sempre de trás pra frente
