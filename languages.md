---
title: Languages
layout: default
---

# Language Comparison

## Looping

**JavaScript**
```
var words = ['one', 'two', 'three', four', 'five'];
var i;
for (i = 0; i < words.length; i++) {
  document.write(words[i]);
}
```

**Python**
```
words = ['one', 'two', 'three', four', 'five']
for i in words:
  print(i)
```

**PHP**
```
$words = array('one', 'two', 'three', four', 'five');
foreach ($words as $word) {
  print $word;
}
```

## Functions

**JavaScript**
```
function myFunction(n) {
  document.write(n);
}
```

**Python**
All functions return a value. You can set a default input parameter
```
def myFunction(n=1):  # set a default value
  print(n)
```

**PHP**
```
function myFunction($n) {
  print $n;
    }
```

## Classes and Objects

**JavaScript**
```


```

**Python**
```
class Duck:
  sound = "Quaaack"
  ambulation = "Waddling"
  def quack(self):
    print(self.sound)
  def walk(self):
    print(self.ambulation)

donald = Duck()
donald.quack()
donald.walk()

```

**PHP**
```
class Duck {
  function quack(){ }
  function walk(){ }

}


```
