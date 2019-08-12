module FizzBuzz (module FB) where

import FizzBuzz.Boolean (BProxy(..), False, True) as FB
import FizzBuzz.Nat (class Nat, class Succ10, class Succ100, class Succ200, class Succ300, class Succ400, class Succ50, class Succ500, class Succ600, class Succ700, class Succ800, class Succ900, NProxy(..), Succ, Zero) as FB
import FizzBuzz.Rule (class IsMod3, class IsMod5, class Judge, class JudgeByPattern, class Result, class ShowFizzBuzz, Buzz, Fizz, FizzBuzz, Number, RProxy(..), judge, show, toResult) as FB
