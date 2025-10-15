module ToJSON
    ( ToJSON(..)
    , fromInt
    , fromDouble
    , fromStr
    , fromBool
    , fromList
    , fromMaybe
    ) where

import SimpleJSON

class ToJSON a where
    toJSON :: a -> JValue

instance ToJSON Int where
    toJSON n = JNumber (fromIntegral n)

instance ToJSON Integer where
    toJSON n = JNumber (fromIntegral n)

instance ToJSON Double where
    toJSON = JNumber

instance ToJSON Float where
    toJSON f = JNumber (realToFrac f)

instance ToJSON Bool where
    toJSON = JBool

instance ToJSON a => ToJSON [a] where
    toJSON lista = JArray (map toJSON lista)

instance ToJSON a => ToJSON (Maybe a) where
    toJSON Nothing = JNull
    toJSON (Just x) = toJSON x

fromInt :: Int -> JValue
fromInt = toJSON

fromDouble :: Double -> JValue
fromDouble = toJSON

fromStr :: String -> JValue
fromStr = JString

fromBool :: Bool -> JValue
fromBool = toJSON

fromList :: ToJSON a => [a] -> JValue
fromList = toJSON

fromMaybe :: ToJSON a => Maybe a -> JValue
fromMaybe = toJSON