# Projeto JSON Haskell

Biblioteca pra trabalhar com JSON usando Haskell e tipos de dados algebricos.

## FEITO POR
LETICIA DELFINO DE ARAUJO - 2021061763

CARLOS DANIEL DOS SANTOS SILVA - 2023098593

DANIEL LINDOSO PENHA -2020033639

## Link do Repositorio

https://github.com/lwticias-lelet/Projeto-Json/tree/main

## O que o projeto faz?

Esse projeto cria uma biblioteca em Haskell pra representar dados JSON. usei ADT pra isso  que separa bem o codigo puro do impuro.

A biblioteca tem:
- Tipo JValue que representa todos os tipos do JSON
- Funcoes pra acessar os valores de forma segura
- Funcao pra transformar JValue em string JSON
- Funcao pra imprimir JSON na tela
renderJValue é pura e putJValue é impura, coloquei os comnetarios no codigoo
## Como usar

### Instalar as coisas

Primeiro precisa instalar o Stack. No Linux ou Mac:
bash
curl -sSL https://get.haskellstack.org/ | sh


No Windows baixa daqui: https://get.haskellstack.org/stable/windows-x86_64-installer.exe
 meu caso é windows
### Compilar

Entra na pasta do projeto e roda:

stack setup
stack build


### Rodar

Pra rodar os testes:
stack build
stack exec projeto-json-exe

### Testar no terminal

Da pra testar as funcoes direto no GHCi:
bash
stack ghci


no terminal do GHCi podemos fazer assim 
haskell
import SimpleJSON
let teste = JString "ola"
putJValue teste

## Exemplos de como usar

### Criando valores JSON
```haskell
-- string
let nome = JString "pedro"

-- numero
let idade = JNumber 20

-- boolean
let ativo = JBool True

-- null
let nada = JNull

-- array
let numeros = JArray [JNumber 1, JNumber 2, JNumber 3]

-- objeto
let pessoa = JObject [("nome", JString "ana"), ("idade", JNumber 25)]
```

### Usando as funcoes de acesso
```haskell
let num = JNumber 42
case getNumber num of
    Just n -> print n
    Nothing -> putStrLn "nao e numero"
```

### Transformando em JSON
```haskell
-- jeito puro
let resultado = renderJValue (JBool True)

-- jeito impuro (imprime)
putJValue (JArray [JNumber 1, JNumber 2])
```

## Como funciona

### Parte pura e impura

O codigo puro nao faz entrada e saida, sao as funcoes tipo renderJValue, getString, etc.

O codigo impuro so tem a funcao putJValue que imprime na tela.

### Tratamento de string

A funcao escapar trata os caracteres especiais:
- aspas vira \"
- barra vira \\
- quebra de linha vira \n
- tab vira \t

### Funcoes internas

Tem umas funcoes que sao so internas do modulo:
- fazerString
- escapar
- renderPares
- renderItens

Essas nao aparecem pra quem usa a biblioteca.

## Testes

O arquivo Main.hs tem 10 testes diferentes:
1. String simples
2. Numero
3. Boolean true
4. Boolean false
5. Null
6. Array
7. Objeto simples
8. Objeto com varios tipos
9. Array de objetos
10. Objeto complexo aninhado
coloquei também duas funções extras,pretty priting e conversão de tipos

E tambem testa todas as funcoes de acesso (getString, getNumber, etc).



