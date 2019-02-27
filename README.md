# JHPP
Push &amp; Present ViewController at any view, just so easy!
- 在任何 `view` 内进行 `Push`、`Present`，就是这么简单!

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

### 2019-02-27:
1.upload.

---

# More detail in Demo :)

---
