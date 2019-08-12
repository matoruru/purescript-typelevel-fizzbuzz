module Test.Main where

import Prelude (Unit, pure, unit)

import Prim hiding (Number)

import Effect (Effect)

import FizzBuzz (class Judge, Buzz, Fizz, FizzBuzz, NProxy(..), Number, RProxy(..), Succ, Zero)
import Util (class Succ10, class Succ100, class Succ15, class Succ3, class Succ5)

testSucc3 :: NProxy (Succ (Succ (Succ Zero)))
testSucc3 = NProxy :: (forall n n'. Succ3 n n' => NProxy n')

testSucc5 :: NProxy (Succ (Succ (Succ (Succ (Succ Zero)))))
testSucc5 = NProxy :: (forall n n'. Succ5 n n' => NProxy n')

testSucc10 :: NProxy (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))))
testSucc10 = NProxy :: (forall n n'. Succ10 n n' => NProxy n')

testNumber1 :: RProxy Number
testNumber1 = RProxy :: (forall r. Judge (Succ Zero) r => RProxy r)

testNumber2 :: RProxy Number
testNumber2 = RProxy :: (forall r. Judge (Succ (Succ Zero)) r => RProxy r)

testFizz3 :: RProxy Fizz
testFizz3 = RProxy :: (forall n r. Succ3 Zero n => Judge n r => RProxy r)

testNumber4 :: RProxy Number
testNumber4 = RProxy :: (forall n r. Succ3 Zero n => Judge (Succ n) r => RProxy r)

testBuzz5 :: RProxy Buzz
testBuzz5 = RProxy :: (forall n r. Succ5 Zero n => Judge n r => RProxy r)

testBuzz10 :: RProxy Buzz
testBuzz10 = RProxy :: (forall n r. Succ10 Zero n => Judge n r => RProxy r)

testFizzBuzz15 :: RProxy FizzBuzz
testFizzBuzz15 = RProxy :: (forall n r. Succ15 Zero n => Judge n r => RProxy r)

testFizzBuzz30 :: RProxy FizzBuzz
testFizzBuzz30 = RProxy :: (forall n n' r. Succ15 Zero n => Succ15 n n' => Judge n' r => RProxy r)

testFizzBuzz45 :: RProxy FizzBuzz
testFizzBuzz45 = RProxy :: (forall n n' n'' r. Succ15 Zero n => Succ15 n n' => Succ15 n' n'' => Judge n'' r => RProxy r)

testBuzz100 :: RProxy Buzz
testBuzz100 = RProxy :: (forall n r. Succ100 Zero n => Judge n r => RProxy r)

main :: Effect Unit
main = pure unit
