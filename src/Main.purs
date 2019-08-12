module Main where

import Effect (Effect)
import Effect.Console (log, logShow)
import FizzBuzz (NProxy(..), Succ, Zero)
import Prelude (Unit, discard, ($))
import Util (class Succ10, class Succ50, class Succ100, class Succ200, runFizzBuzz)

main :: Effect Unit
main = do
  log "\n-----FizzBuzz   3 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: NProxy (Succ (Succ (Succ (Succ Zero)))))

  log "\n-----FizzBuzz  10 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ10  (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz  50 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ50  (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz 100 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ100 (Succ Zero) n => NProxy n)

  log "\n-----FizzBuzz 200 to 1---------------------"
  logShow $ runFizzBuzz (NProxy :: forall n. Succ200 (Succ Zero) n => NProxy n)
