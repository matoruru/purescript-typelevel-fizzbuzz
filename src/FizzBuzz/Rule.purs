module FizzBuzz.Rule where

import Prim hiding (Number)

import Data.Array ((:))
import Data.Show (show) as S

import FizzBuzz.Boolean (False, True, kind Boolean)
import FizzBuzz.Nat

foreign import kind Result

foreign import data Fizz     :: Result
foreign import data Buzz     :: Result
foreign import data FizzBuzz :: Result
foreign import data Number   :: Result

data RProxy (r :: Result) = RProxy

class Result (n :: Nat) (r :: Result) | n -> r where
  toResult :: NProxy n -> RProxy r -> Array String

instance      getResultByZero ::                                                   Result (Succ Zero) r' where
  toResult _ _ = []

else instance getResultByN    :: (Nat n, ShowFizzBuzz r, Result n r, Judge n r) => Result (Succ n)    r' where
  toResult _ _ = show (RProxy :: RProxy r) (toInt (NProxy :: NProxy n)) : toResult (NProxy :: NProxy n) (judge (NProxy :: NProxy n))

class ShowFizzBuzz (r :: Result) where
  show :: RProxy r -> Int -> String

instance showFizz     :: ShowFizzBuzz Fizz where
  show _ _ = "Fizz"

instance showBuzz     :: ShowFizzBuzz Buzz where
  show _ _ = "Buzz"

instance showFizzBuzz :: ShowFizzBuzz FizzBuzz where
  show _ _ = "Fizz-Buzz"

instance showNumber   :: ShowFizzBuzz Number where
  show _   = S.show

class Judge (n :: Nat) (r :: Result) | n -> r
instance judgeByPattern  :: (IsMod3 n b3, IsMod5 n b5, JudgeByPattern b3 b5 r) => Judge n r

judge :: forall n r. Nat n => Judge n r => NProxy n -> RProxy r
judge _ = RProxy

class JudgeByPattern (fb :: Boolean) (bb :: Boolean) (r :: Result) | fb bb -> r
instance judgeFizz     :: JudgeByPattern True  False Fizz
instance judgeBuzz     :: JudgeByPattern False True  Buzz
instance judgeFizzBuzz :: JudgeByPattern True  True  FizzBuzz
instance judgeNumber   :: JudgeByPattern False False Number

class IsMod3 (n :: Nat) (b :: Boolean) | n -> b
instance      isMod3    :: IsMod3 n b => IsMod3 (Succ (Succ (Succ n))) b
else instance isMod3'   ::               IsMod3 Zero                   True
else instance isnotMod3 ::               IsMod3 n                      False

class IsMod5 (n :: Nat) (b :: Boolean) | n -> b
instance      isMod5    :: IsMod5 n b => IsMod5 (Succ (Succ (Succ (Succ (Succ n))))) b
else instance isMod5'   ::               IsMod5 Zero                                 True
else instance isnotMod5 ::               IsMod5 n                                    False
