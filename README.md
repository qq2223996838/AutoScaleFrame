# AutoScaleFrame

适配 各种屏幕的库

 各屏幕适配演示 ⤵️
 
```
//示例控件代码

- (void)testFrameUI
{

UIView *testView1 = [[UIView alloc]init];
testView1.frame = asKFrame(10, 10, 100, 100, asKFrameXY);
testView1.backgroundColor = [UIColor redColor];
[self.view addSubview:testView1];

UIView *testView2 = [[UIView alloc]init];
testView2.frame = asFrame(200, 200, 100, 100);
testView2.backgroundColor = [UIColor blueColor];
[self.view addSubview:testView2];
UIView *testView22 = [[UIView alloc]init];
testView22.frame = asFrame(100, 300, 100, 100);
testView22.backgroundColor = [UIColor greenColor];
[self.view addSubview:testView22];

UIView *testView3 = [[UIView alloc]init];
testView3.frame = asKFrame(iPhone6W-110, iPhone6H-150, 100, 100,asKFrameXY);
testView3.backgroundColor = [UIColor blackColor];
[self.view addSubview:testView3];

return;
}


```

![image](https://github.com/qq2223996838/AutoScaleFrame/blob/master/演示图片/iPhone%208%20显示效果.png)

![image](https://github.com/qq2223996838/AutoScaleFrame/blob/master/演示图片/iPhone%208%20Puls%20显示效果.png)

![image](https://github.com/qq2223996838/AutoScaleFrame/blob/master/演示图片/iPhone%20X%20显示效果.png)
