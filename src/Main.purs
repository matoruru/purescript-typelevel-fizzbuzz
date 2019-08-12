module Main where

import Effect (Effect)
import Effect.Console (log, logShow)
import FizzBuzz (NProxy(..), Succ, Zero)
import Prelude (Unit, discard, ($))
import Util (class Succ10, class Succ50, class Succ100, class Succ200, runFizzBuzz)

main :: Effect Unit
main = do
  log "\n-----Nat to Int ( 10)----------------------------"
  logShow $ toInt (NProxy :: forall n. Succ10  Zero n => NProxy n)

  log "\n-----Nat to Int ( 50)----------------------------"
  logShow $ toInt (NProxy :: forall n. Succ50  Zero n => NProxy n)

  log "\n-----Nat to Int (100)----------------------------"
  logShow $ toInt (NProxy :: forall n. Succ100 Zero n => NProxy n)

  --log "\n-----Nat to Int (200)----------------------------"
  --logShow $ toInt (NProxy :: forall n. Succ200 Zero n => NProxy n)

  --log "\n-----Nat to Int (300)----------------------------"
  --logShow $ toInt (NProxy :: forall n. Succ300 Zero n => NProxy n)

  --log "\n-----Nat to Int (400)----------------------------"
  --logShow $ toInt (NProxy :: forall n. Succ400 Zero n => NProxy n)

  --log "\n-----Nat to Int (500)----------------------------"
  --logShow $ toInt (NProxy :: forall n. Succ500 Zero n => NProxy n)

  log "\n-----FizzBuzz  10 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ10  (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz  50 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ50  (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz 100 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ100 (Succ Zero) n => NProxy n)

  --log "\n-----FizzBuzz 200 to 1---------------------"
  --logShow $ runFizzBuzz (NProxy :: forall n. Succ200 (Succ Zero) n => NProxy n)

  --log "\n-----FizzBuzz 300 to 1---------------------"
  --logShow $ runFizzBuzz (NProxy :: forall n. Succ300 (Succ Zero) n => NProxy n)

  --log "\n-----FizzBuzz 400 to 1---------------------"
  --logShow $ runFizzBuzz (NProxy :: forall n. Succ400 (Succ Zero) n => NProxy n)

  --log "\n-----FizzBuzz 500 to 1---------------------"
  --logShow $ runFizzBuzz (NProxy :: forall n. Succ500 (Succ Zero) n => NProxy n)
