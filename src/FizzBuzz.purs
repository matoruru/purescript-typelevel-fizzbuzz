module FizzBuzz where

import Prelude ((+))

import Prim hiding (Number)

import Data.Array ((:))
import Data.Show (show) as S

runFizzBuzz :: forall n r. Nat n => Result n r => NProxy n -> Array String
runFizzBuzz n = toResult n RProxy

foreign import kind Boolean

foreign import data True  :: Boolean
foreign import data False :: Boolean

data BProxy (b :: Boolean) = BProxy

foreign import kind Result

foreign import data Fizz     :: Result
foreign import data Buzz     :: Result
foreign import data FizzBuzz :: Result
foreign import data Number   :: Result

data RProxy (r :: Result) = RProxy

foreign import kind Nat

foreign import data Zero :: Nat
foreign import data Succ :: Nat -> Nat

data NProxy (n :: Nat) = NProxy

class Nat (n :: Nat) where
  toInt :: NProxy n -> Int

instance natZero :: Nat Zero where
  toInt _ = 0

instance natSucc :: Nat n => Nat (Succ n) where
  toInt _ = 1 + toInt (NProxy :: NProxy n)

class Succ10  (n :: Nat) (n' :: Nat) | n -> n'
instance succ10  :: Succ10 n (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ n))))))))))

class Succ50  (n :: Nat) (n' :: Nat) | n -> n'
instance succ50  :: (Succ10 n n1, Succ10 n1 n2, Succ10 n2 n3, Succ10 n3 n4, Succ10 n4 n5) => Succ50 n n5

class Succ100 (n :: Nat) (n' :: Nat) | n -> n'
instance succ100 :: (Succ50 n n' , Succ50  n' n'') => Succ100 n n''

class Succ200 (n :: Nat) (n' :: Nat) | n -> n'
instance succ200 :: (Succ100 n n', Succ100 n' n'') => Succ200 n n''

class Succ300 (n :: Nat) (n' :: Nat) | n -> n'
instance succ300 :: (Succ200 n n', Succ100 n' n'') => Succ300 n n''

class Succ400 (n :: Nat) (n' :: Nat) | n -> n'
instance succ400 :: (Succ300 n n', Succ100 n' n'') => Succ400 n n''

class Succ500 (n :: Nat) (n' :: Nat) | n -> n'
instance succ500 :: (Succ400 n n', Succ100 n' n'') => Succ500 n n''

class Succ600 (n :: Nat) (n' :: Nat) | n -> n'
instance succ600 :: (Succ500 n n', Succ100 n' n'') => Succ600 n n''

class Succ700 (n :: Nat) (n' :: Nat) | n -> n'
instance succ700 :: (Succ600 n n', Succ100 n' n'') => Succ700 n n''

class Succ800 (n :: Nat) (n' :: Nat) | n -> n'
instance succ800 :: (Succ700 n n', Succ100 n' n'') => Succ800 n n''

class Succ900 (n :: Nat) (n' :: Nat) | n -> n'
instance succ900 :: (Succ800 n n', Succ100 n' n'') => Succ900 n n''

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
