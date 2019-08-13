# purescript-typelevel-fizzbuzz
Type-level FizzBuzz in PureScript

## Examples

```
> runFizzBuzz (NProxy :: NProxy (Succ (Succ (Succ (Succ Zero)))))
["Fizz","2","1"]

> runFizzBuzz (NProxy :: forall n. Succ10 (Succ Zero) n => NProxy n)
["Buzz","Fizz","8","7","Fizz","Buzz","4","Fizz","2","1"]

> runFizzBuzz (NProxy :: forall n. Succ100 (Succ Zero) n => NProxy n)
["Buzz","Fizz","98","97","Fizz","Buzz","94","Fizz","92","91","Fizz-Buzz","89","88","Fizz","86","Buzz","Fizz","83","82","Fizz","Buzz","79","Fizz","77","76","Fizz-Buzz","74","73","Fizz","71","Buzz","Fizz","68","67","Fizz","Buzz","64","Fizz","62","61","Fizz-Buzz","59","58","Fizz","56","Buzz","Fizz","53","52","Fizz","Buzz","49","Fizz","47","46","Fizz-Buzz","44","43","Fizz","41","Buzz","Fizz","38","37","Fizz","Buzz","34","Fizz","32","31","Fizz-Buzz","29","28","Fizz","26","Buzz","Fizz","23","22","Fizz","Buzz","19","Fizz","17","16","Fizz-Buzz","14","13","Fizz","11","Buzz","Fizz","8","7","Fizz","Buzz","4","Fizz","2","1"]

> runFizzBuzz (NProxy :: forall n. Succ200 (Succ Zero) n => NProxy n)
["Buzz","199","Fizz","197","196","Fizz-Buzz","194","193","Fizz","191","Buzz","Fizz","188","187","Fizz","Buzz","184","Fizz","182","181","Fizz-Buzz","179","178","Fizz","176","Buzz","Fizz","173","172","Fizz","Buzz","169","Fizz","167","166","Fizz-Buzz","164","163","Fizz","161","Buzz","Fizz","158","157","Fizz","Buzz","154","Fizz","152","151","Fizz-Buzz","149","148","Fizz","146","Buzz","Fizz","143","142","Fizz","Buzz","139","Fizz","137","136","Fizz-Buzz","134","133","Fizz","131","Buzz","Fizz","128","127","Fizz","Buzz","124","Fizz","122","121","Fizz-Buzz","119","118","Fizz","116","Buzz","Fizz","113","112","Fizz","Buzz","109","Fizz","107","106","Fizz-Buzz","104","103","Fizz","101","Buzz","Fizz","98","97","Fizz","Buzz","94","Fizz","92","91","Fizz-Buzz","89","88","Fizz","86","Buzz","Fizz","83","82","Fizz","Buzz","79","Fizz","77","76","Fizz-Buzz","74","73","Fizz","71","Buzz","Fizz","68","67","Fizz","Buzz","64","Fizz","62","61","Fizz-Buzz","59","58","Fizz","56","Buzz","Fizz","53","52","Fizz","Buzz","49","Fizz","47","46","Fizz-Buzz","44","43","Fizz","41","Buzz","Fizz","38","37","Fizz","Buzz","34","Fizz","32","31","Fizz-Buzz","29","28","Fizz","26","Buzz","Fizz","23","22","Fizz","Buzz","19","Fizz","17","16","Fizz-Buzz","14","13","Fizz","11","Buzz","Fizz","8","7","Fizz","Buzz","4","Fizz","2","1"]
```
