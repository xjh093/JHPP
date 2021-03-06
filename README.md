# JHPP
Push &amp; Present ViewController at any view, just so easy! You can call it `Mediator` or `Router`
- 在任何 `view` 内进行 `Push`、`Present`，就是这么简单! 你可以叫它 `中间件` 或者 `路由`。无需提前注册。拿来就用！

---

# Version
Latest release version:

[1.2.5](https://github.com/xjh093/JHPP/releases)

---

# Cocoapods
`pod "JHPP"`

---

# What

![image](https://github.com/xjh093/JHPP/blob/master/gif.gif)

---

# Usage

### Example1:
```
UIViewController *vc = [[UIViewController alloc] init];
vc.title = @"JHPP Push 1";
vc.view.backgroundColor = [UIColor whiteColor];
[JHPP pushVC:vc from:self]; // or [JHPP pushVC:vc from:nil];

```

### Example2:
```
dispatch_block_t callback = ^{
    [_button setTitleColor:[UIColor redColor] forState:0];
};

NSMutableDictionary *mdic = @{}.mutableCopy;
[mdic setValue:@"跳转事件：在上一个控制器的 Cell 内" forKey:@"text"];
[mdic setValue:@"JHPP Push 3" forKey:@"title"];
[mdic setValue:callback forKey:@"callback"];

[JHPP pushVC:@"JHPPVC3" paramter:mdic from:self]; // or [JHPP pushVC:@"JHPPVC3" paramter:mdic from:nil];
```

---

# Logs

### 2019-06-20:
1.add method.
   - fetch currentViewController.

### 2019-06-13:
1.fix a bug. fetch vc may be nil.

### 2019-03-25:
1.add some methods.

### 2019-03-05:
1.add some methods.

### 2019-02-27:
1.upload.

---

# More detail in Demo :)

---
