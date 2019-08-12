module FizzBuzz.Boolean where

foreign import kind Boolean

foreign import data True  :: Boolean
foreign import data False :: Boolean

data BProxy (b :: Boolean) = BProxy
