module FizzBuzz.Nat where

import Prelude ((+))

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
