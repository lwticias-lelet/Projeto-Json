module PrettyJSON
    ( renderPretty
    , putPretty
    ) where

import SimpleJSON

renderPretty :: JValue -> String
renderPretty val = renderComIndentacao 0 val

renderComIndentacao :: Int -> JValue -> String
renderComIndentacao _ (JString s) = "\"" ++ escaparString s ++ "\""
renderComIndentacao _ (JNumber n) = show n
renderComIndentacao _ (JBool True) = "true"
renderComIndentacao _ (JBool False) = "false"
renderComIndentacao _ JNull = "null"
renderComIndentacao nivel (JObject pares) = renderObjeto nivel pares
renderComIndentacao nivel (JArray itens) = renderArray nivel itens

escaparString :: String -> String
escaparString [] = []
escaparString (c:resto)
    | c == '"'  = '\\' : '"' : escaparString resto
    | c == '\\' = '\\' : '\\' : escaparString resto
    | c == '\n' = '\\' : 'n' : escaparString resto
    | c == '\t' = '\\' : 't' : escaparString resto
    | c == '\r' = '\\' : 'r' : escaparString resto
    | otherwise = c : escaparString resto

renderObjeto :: Int -> [(String, JValue)] -> String
renderObjeto _ [] = "{}"
renderObjeto nivel pares = "{\n" ++ conteudo ++ "\n" ++ espacos nivel ++ "}"
  where
    conteudo = juntarComVirgula (map (renderPar (nivel + 1)) pares)

renderPar :: Int -> (String, JValue) -> String
renderPar nivel (chave, valor) = 
    espacos nivel ++ "\"" ++ escaparString chave ++ "\": " ++ renderComIndentacao nivel valor

renderArray :: Int -> [JValue] -> String
renderArray _ [] = "[]"
renderArray nivel itens = "[\n" ++ conteudo ++ "\n" ++ espacos nivel ++ "]"
  where
    conteudo = juntarComVirgula (map (\v -> espacos (nivel + 1) ++ renderComIndentacao (nivel + 1) v) itens)

juntarComVirgula :: [String] -> String
juntarComVirgula [] = ""
juntarComVirgula [x] = x
juntarComVirgula (x:xs) = x ++ ",\n" ++ juntarComVirgula xs

espacos :: Int -> String
espacos n = replicate (n * 2) ' '

putPretty :: JValue -> IO ()
putPretty v = putStrLn (renderPretty v)