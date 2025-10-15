module SimpleJSON
    ( JValue(..)
    , getString
    , getNumber
    , getBool
    , getObject
    , getArray
    , isNull
    , renderJValue
    , putJValue
    ) where

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
            deriving (Eq, Ord, Show)

getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _ = Nothing

getNumber :: JValue -> Maybe Double
getNumber (JNumber n) = Just n
getNumber _ = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b) = Just b
getBool _ = Nothing

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObject obj) = Just obj
getObject _ = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray arr) = Just arr
getArray _ = Nothing

isNull :: JValue -> Bool
isNull JNull = True
isNull _ = False

renderJValue :: JValue -> String
renderJValue (JString s) = fazerString s
renderJValue (JNumber n) = show n
renderJValue (JBool True) = "true"
renderJValue (JBool False) = "false"
renderJValue JNull = "null"
renderJValue (JObject pares) = "{" ++ renderPares pares ++ "}"
renderJValue (JArray itens) = "[" ++ renderItens itens ++ "]"

fazerString :: String -> String
fazerString s = "\"" ++ escapar s ++ "\""

escapar :: String -> String
escapar [] = []
escapar (c:resto)
    | c == '"'  = '\\' : '"' : escapar resto
    | c == '\\' = '\\' : '\\' : escapar resto
    | c == '\n' = '\\' : 'n' : escapar resto
    | c == '\t' = '\\' : 't' : escapar resto
    | c == '\r' = '\\' : 'r' : escapar resto
    | otherwise = c : escapar resto

renderPares :: [(String, JValue)] -> String
renderPares [] = ""
renderPares [(k, v)] = fazerString k ++ ":" ++ renderJValue v
renderPares ((k, v):ps) = fazerString k ++ ":" ++ renderJValue v ++ "," ++ renderPares ps

renderItens :: [JValue] -> String
renderItens [] = ""
renderItens [x] = renderJValue x
renderItens (x:xs) = renderJValue x ++ "," ++ renderItens xs

putJValue :: JValue -> IO ()
putJValue v = putStrLn (renderJValue v)