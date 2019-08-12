module FizzBuzz (module FB) where

import FizzBuzz.Boolean (BProxy(..), False, True) as FB
import FizzBuzz.Nat (kind Nat, class Nat, NProxy(..), Succ, Zero, toInt) as FB
import FizzBuzz.Rule (class IsMod3, class IsMod5, class Judge, class JudgeByPattern, class Result, class ShowFizzBuzz, Buzz, Fizz, FizzBuzz, Number, RProxy(..), judge, show, toResult) as FB
