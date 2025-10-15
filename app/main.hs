module Main where

import SimpleJSON
import PrettyJSON
import ToJSON

main :: IO ()
main = do
 
    putStrLn "BIBLIOTECA JSON - AQUI ESTÃO OS TESTES "
    
    
 
    putStrLn "PARTE 1: TESTES BASICOS  DE ACORDO PROF"
   
    
    putStrLn " Testando tipos basicos JSON "
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
    
    putStrLn " Testando funcoes de acesso "
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
    putStrLn ""
    
    
    putStrLn "PARTE 2: EXTRA 1 - PRETTY PRINTING"
   
    
    putStrLn "Exemplo 1 - Objeto simples formatado:"
    let obj1 = JObject [("nome", JString "joao"), ("idade", JNumber 25)]
    putPretty obj1
    putStrLn ""
    
    putStrLn "Exemplo 2 - Objeto complexo aninhado:"
    let obj2 = JObject
            [ ("aluno", JString "maria")
            , ("curso", JString "computacao")
            , ("notas", JArray [JNumber 8.5, JNumber 9.0, JNumber 7.5])
            , ("aprovado", JBool True)
            , ("observacoes", JNull)
            ]
    putPretty obj2
    putStrLn ""
    
    putStrLn "Exemplo 3 - Array de objetos:"
    let obj3 = JArray
            [ JObject [("x", JNumber 10), ("y", JNumber 20)]
            , JObject [("x", JNumber 30), ("y", JNumber 40)]
            , JObject [("x", JNumber 50), ("y", JNumber 60)]
            ]
    putPretty obj3
    putStrLn ""
    
   
    putStrLn "PARTE 3: EXTRA 2 - CONVERSAO DE TIPOS"
    
    
    putStrLn "Exemplo 1 - Convertendo Int:"
    let num1 = fromInt 42
    putJValue num1
    putStrLn ""
    
    putStrLn "Exemplo 2 - Convertendo Double:"
    let num2 = fromDouble 3.14159
    putJValue num2
    putStrLn ""
    
    putStrLn "Exemplo 3 - Convertendo String:"
    let str1 = fromStr "ola haskell"
    putJValue str1
    putStrLn ""
    
    putStrLn "Exemplo 4 - Convertendo Bool:"
    let bool1 = fromBool False
    putJValue bool1
    putStrLn ""
    
    putStrLn "Exemplo 5 - Convertendo lista de Int:"
    let lista1 = fromList ([1, 2, 3, 4, 5] :: [Int])
    putJValue lista1
    putStrLn ""
    
    putStrLn "Exemplo 6 - Lista de strings:"
    let lista2 = JArray [fromStr "haskell", fromStr "python", fromStr "java"]
    putJValue lista2
    putStrLn ""
    
    putStrLn "Exemplo 7 - Convertendo Maybe (Just):"
    let maybe1 = fromMaybe (Just (100 :: Int))
    putJValue maybe1
    putStrLn ""
    
    putStrLn "Exemplo 8 - Convertendo Maybe (Nothing):"
    let maybe2 = fromMaybe (Nothing :: Maybe Int)
    putJValue maybe2
    putStrLn ""
    
    putStrLn "Exemplo 9 - Lista aninhada:"
    let lista3 = toJSON ([[1,2], [3,4], [5,6]] :: [[Int]])
    putJValue lista3
    putStrLn ""
    
    putStrLn "Exemplo 10 - Objeto completo usando conversoes:"
    let obj4 = JObject
            [ ("idade", toJSON (25 :: Int))
            , ("altura", toJSON (1.75 :: Double))
            , ("nome", fromStr "carlos")
            , ("ativo", toJSON True)
            , ("apelido", JNull)
            , ("hobbies", JArray [fromStr "futebol", fromStr "musica", fromStr "games"])
            ]
    putStrLn "Versao compacta:"
    putJValue obj4
    putStrLn ""
    putStrLn "Versao formatada (pretty print):"
    putPretty obj4
    putStrLn ""
    
   
    putStrLn "TODOS OS TESTES CONCLUIDOS COM SUCESSO!"
   
