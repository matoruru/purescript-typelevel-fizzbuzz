module Util where

import FizzBuzz

runFizzBuzz :: forall n r. Nat n => Result n r => NProxy n -> Array String
runFizzBuzz n = toResult n RProxy

class Succ3   (n :: Nat) (n' :: Nat) | n -> n'
instance succ3   :: Succ3  n (Succ (Succ (Succ n)))

class Succ5   (n :: Nat) (n' :: Nat) | n -> n'
instance succ5   :: Succ5  n (Succ (Succ (Succ (Succ (Succ n)))))

class Succ10  (n :: Nat) (n' :: Nat) | n -> n'
instance succ10  :: Succ10 n (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ n))))))))))

class Succ15  (n :: Nat) (n' :: Nat) | n -> n'
instance succ15  :: (Succ10 n n' , Succ5   n' n'') => Succ15  n n''

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
