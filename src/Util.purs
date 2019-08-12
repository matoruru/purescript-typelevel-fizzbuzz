module Util where

import FizzBuzz (class Nat, class Result, NProxy, RProxy(..), toResult)

runFizzBuzz :: forall n r. Nat n => Result n r => NProxy n -> Array String
runFizzBuzz n = toResult n RProxy
