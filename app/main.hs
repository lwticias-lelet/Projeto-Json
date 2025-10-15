module Main where

import SimpleJSON

main :: IO ()
main = do
    putStrLn "=== Testando biblioteca JSON ==="
    putStrLn ""
    
    putStrLn "Teste 1 - String:"
    let t1 = JString "ola mundo"
    putJValue t1
    putStrLn ""
    
    putStrLn "Teste 2 - Numero:"
    let t2 = JNumber 42.5
    putJValue t2
    putStrLn ""
    
    putStrLn "Teste 3 - Boolean verdadeiro:"
    let t3 = JBool True
    putJValue t3
    putStrLn ""
    
    putStrLn "Teste 4 - Boolean falso:"
    let t4 = JBool False
    putJValue t4
    putStrLn ""
    
    putStrLn "Teste 5 - Null:"
    let t5 = JNull
    putJValue t5
    putStrLn ""
    
    putStrLn "Teste 6 - Array de numeros:"
    let t6 = JArray [JNumber 1, JNumber 2, JNumber 3, JNumber 4]
    putJValue t6
    putStrLn ""
    
    putStrLn "Teste 7 - Objeto simples:"
    let t7 = JObject [("nome", JString "joao"), ("idade", JNumber 25)]
    putJValue t7
    putStrLn ""
    
    putStrLn "Teste 8 - Objeto com varios tipos:"
    let t8 = JObject 
            [ ("nome", JString "maria")
            , ("idade", JNumber 30)
            , ("ativo", JBool True)
            , ("endereco", JNull)
            ]
    putJValue t8
    putStrLn ""
    
    putStrLn "Teste 9 - Array de objetos:"
    let t9 = JArray
            [ JObject [("x", JNumber 10), ("y", JNumber 20)]
            , JObject [("x", JNumber 30), ("y", JNumber 40)]
            ]
    putJValue t9
    putStrLn ""
    
    putStrLn "Teste 10 - Objeto aninhado complexo:"
    let t10 = JObject
            [ ("aluno", JString "carlos")
            , ("curso", JString "ciencia da computacao")
            , ("notas", JArray [JNumber 8.5, JNumber 9.0, JNumber 7.5])
            , ("aprovado", JBool True)
            , ("observacoes", JNull)
            ]
    putJValue t10
    putStrLn ""
    
    putStrLn "=== Testando funcoes de acesso ==="
    putStrLn ""
    
    let obj = JObject [("teste", JString "valor")]
    putStrLn "Testando getObject:"
    case getObject obj of
        Just lista -> putStrLn $ "Consegui pegar o objeto, tem " ++ show (length lista) ++ " par(es)"
        Nothing -> putStrLn "Nao consegui pegar"
    
    let num = JNumber 123.45
    putStrLn "Testando getNumber:"
    case getNumber num of
        Just n -> putStrLn $ "O numero e: " ++ show n
        Nothing -> putStrLn "Nao e numero"
    
    let str = JString "teste123"
    putStrLn "Testando getString:"
    case getString str of
        Just s -> putStrLn $ "A string e: " ++ s
        Nothing -> putStrLn "Nao e string"
    
    let bool = JBool False
    putStrLn "Testando getBool:"
    case getBool bool of
        Just b -> putStrLn $ "O boolean e: " ++ show b
        Nothing -> putStrLn "Nao e boolean"
    
    let arr = JArray [JNumber 1, JNumber 2]
    putStrLn "Testando getArray:"
    case getArray arr of
        Just a -> putStrLn $ "O array tem " ++ show (length a) ++ " elementos"
        Nothing -> putStrLn "Nao e array"
    
    putStrLn "Testando isNull:"
    putStrLn $ "JNull e null? " ++ show (isNull JNull)
    putStrLn $ "JString e null? " ++ show (isNull (JString "abc"))
    putStrLn $ "JNumber e null? " ++ show (isNull (JNumber 10))
```

## projeto-json.cabal
```
cabal-version: 2.2
name: projeto-json
version: 0.1.0.0
synopsis: Biblioteca JSON em Haskell
description: Trabalho de programacao funcional - manipulacao de JSON usando ADT
license: BSD-3-Clause
author: Aluno1, Aluno2, Aluno3
maintainer: grupo@email.com
category: Data
build-type: Simple

library
  exposed-modules:
      SimpleJSON
  hs-source-dirs:
      src
  build-depends:
      base >=4.7 && <5
  default-language: Haskell2010

executable projeto-json-exe
  main-is: Main.hs
  hs-source-dirs:
      app
  ghc-options: -threaded -rtsopts -with-rtsopts=-N
  build-depends:
      base >=4.7 && <5
    , projeto-json
  default-language: Haskell2010