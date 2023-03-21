# T1 - LING PROG

- Trabalho 1 da disciplina de Linguagens de programação - 2023/1.

## Instruções

- Para executar esse código você deve instalar os seguintes programas:
  - Lex/Flex 2.5.4 ou superior
  - MinGW (Windows) [Tutorial](https://www.freecodecamp.org/news/how-to-install-c-and-cpp-compiler-on-windows/)

### Instalar Lex/Flex

- Windows - [Flex_2.5.4](http://gnuwin32.sourceforge.net/downlinks/flex.php)
- MacOS - `brew install flex`
- Linux (Ubuntu) -
    - `sudo apt-get update` <br /> `sudo apt-get install flex`

### Executar e compilar

- `lex [nome_do_arquivo].l`
- `g++ lex.yy.c -ll`
- `./a.out`