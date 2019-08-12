module Main where

import Effect (Effect)
import Effect.Console (log, logShow)
import FizzBuzz (NProxy(..), Succ, Zero)
import Prelude (Unit, discard, ($))
import Util (class Succ10, class Succ100, class Succ15, class Succ200, class Succ3, class Succ5, class Succ50, runFizzBuzz)

main :: Effect Unit
main = do
  log "\n-----FizzBuzz   3 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ3   (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz   5 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ5   (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz  10 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ10  (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz  15 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ15  (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz  50 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ50  (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz 100 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ100 (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz 200 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ200 (Succ Zero) n => NProxy n)
