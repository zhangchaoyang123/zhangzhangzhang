//
//  ViewController.m
//  计算器
//
//  Created by zhangchaoyang on 15/11/9.
//  Copyright (c) 2015年 zhangchaoyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize button,label,string,num1,num2,num3,num4;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置背景图片
    NSBundle *bundle=[NSBundle mainBundle];
    NSData *data=[[NSData alloc]initWithContentsOfFile:[bundle pathForResource:@"1" ofType:@"jpg"]];//找到NSBundle的某一资源
    UIImage *img=[UIImage imageWithData:data];//创建了可用的图像对象
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:img]];//UIColor colorWithPatternImage:
    
    
    UIAlertView *alex=[[UIAlertView alloc]initWithTitle:@"计算器" message:@"洛阳塔比图张朝阳。" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];[alex show];
    [alex show];
    
    
    //创建标签
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(30, 20, 255, 60)];
      [self.view addSubview:label];
    self.label.backgroundColor=[UIColor clearColor];//清空背景颜色
//    self.label.backgroundColor=[UIColor   blueColor];
    [ label  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];

    self.label.textColor=[UIColor redColor];//字体颜色
    self.label.textAlignment=UITextAlignmentRight;//字体居右
    self.label.font=[UIFont systemFontOfSize:32.4];NSArray *array=[NSArray arrayWithObjects:@"7",@"8",@"9",@"4",@"5",@"6",@"1",@"2",@"3", nil];
    int n=0;
    for (int i=0; i<3; i++)
    {
        for (int j=0; j<3; j++)
        {
            self.button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            self.button.frame=CGRectMake(30+65*j, 150+65*i, 60, 60);
            [self.button setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"10.jpg"]]];
            //            self.label=[[UILabel alloc]initWithFrame:CGRectMake(30+65*j, 150+65*i, 60, 60)];
//            [self.view addSubview:label];
//            self.label.backgroundColor=[UIColor clearColor];
//            self.label.backgroundColor=[UIColor   blueColor];
            [self.button setTitle:[array objectAtIndex:n++] forState:UIControlStateNormal];
            [self.view addSubview:button];
            [self.button addTarget:self action:@selector(one:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    UIButton *button0=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button0 setFrame:CGRectMake(30, 345, 120 ,60)];
    [button0 setTitle:@"0" forState:UIControlStateNormal];
  
     [button0 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];
    [button0 addTarget:self action:@selector(one:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
    
    
    NSArray *array1=[NSArray arrayWithObjects:@"/",@"*",@"-",@"+",nil];
    for (int i=0; i<4; i++)
    {
     
        UIButton *button1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button1 setFrame:CGRectMake(225, 85+65*i, 60, 60)];
        [button1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];

        [button1 setTitle:[array1 objectAtIndex:i] forState:UIControlStateNormal];
        [self.view addSubview:button1];
      
        [button1 addTarget:self action:@selector(two:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton *button2= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(225,345,60, 60)];
     [button2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];
    [button2 setTitle:@"=" forState:UIControlStateNormal];
    [button2 addTarget:self  action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:button2];
    
    
    UIButton *button4=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setFrame:CGRectMake(160, 85,60 , 60)];
     [button4 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];
    [button4 setTitle:@"AC" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(clean:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setFrame:CGRectMake(95, 85, 60, 60)];
     [button3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];
    [button3 setTitle:@"back" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button6=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button6 setFrame:CGRectMake(30, 85, 60, 60)];
    [button6 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];
    [button6 setTitle:@"%" forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(ss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UIButton *button5=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button5 setFrame:CGRectMake(160, 345, 60, 60)];
    [button5 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"11.jpg"]]];
    [button5 setTitle:@"." forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(one:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    self.string= [[NSMutableString alloc] init];
}
-(void)one:(id)sender
{
    //保证是符号时在输入数字时隐藏
    if ([self.string hasPrefix:@"+"]||[self.string hasPrefix:@"-"]||[self.string hasPrefix:@"*"]||[self.string hasPrefix:@"/"])//判断是否为运算符
    {
        [self.string setString:@""];//字符串清零
    }
    [self.string appendString:[sender currentTitle]];//数字连续输入
    self.label.text=[NSString stringWithString:string];//显示数值
    self.num1=[self.label.text doubleValue];//保存输入的数值
    NSLog(@"%f",self.num1);
    
}

-(void)two:(id)sender
{
    [self.string setString:@""];//字符串清零
    [self.string appendString:[sender currentTitle]];
    self.label.text=[NSString stringWithString:string];
    
    //判断输入是+号
    if ([self.string hasPrefix:@"+"])//hasPrefix:判断字符串以加号开头
    {
        self.num2=self.num1;//将前面的数值保存在num2里
        self.num4=1;
    }
    
    else if([self.string hasPrefix:@"-"])//hasPrefix:判断字符串以减号开头
    {
        self.num2=self.num1;
        self.num4=2;
    }
    //判断输入是*号
    else if([self.string hasPrefix:@"*"])//hasPrefix:判断字符串以乘号开头
    {
        self.num2=self.num1;
        self.num4=3;
    }
    //判断输入是/号
    else if([self.string hasPrefix:@"/"])//hasPrefix:判断字符串以除号开头
    {
        self.num2=self.num1;
        self.num4=4;
    }
}


-(void)go:(id)sender
{
    //判断输入是+号
    if (self.num4==1)
    {
        self.num3=self.num2+[self.label.text doubleValue];//[self.label.text doubleValue]是每次后输入的数字
        self.label.text=[NSString stringWithFormat:@"%f",self.num3];//显示结果
        self.num1=[self.label.text doubleValue];//为了可以连加。保存结果
        self.num3=0;
        [self.string setString:@""];//保证每次结果正确输出后，再次计算，不用按清除键
    }
    //判断输入是-号
    else if(self.num4==2)
    {
        self.num3=self.num2-[self.label.text doubleValue];
        self.label.text=[NSString stringWithFormat:@"%f",self.num3];
        self.num1=[self.label.text doubleValue];
        self.num3=0;
        [self.string setString:@""];
    }
    else if(self.num4==3)
    {
        self.num3=self.num2*[self.label.text doubleValue];
        self.label.text=[NSString stringWithFormat:@"%f",self.num3];
        self.num1=[self.label.text doubleValue];
        self.num3=0;
        [self.string setString:@""];
    }
    //判断输入是/号
    else if(self.num4==4)
    {
        self.num3=self.num2/[self.label.text doubleValue];
        self.label.text=[NSString stringWithFormat:@"%f",self.num3];//计算结果显示出来
        self.num1=[self.label.text doubleValue];//把计算的结果保存一下
        self.num3=0;
        [self.string setString:@""];
    }
    
    
}



//当按下清除建时，所有数据清零
-(void)clean:(id)sender{
    [self.string setString:@""];//清空字符串
    self.num3=0;
    self.num2=0;
    self.label.text=@"0";//保证下次输入时清零
    
}

//返回键
-(void)back:(id)sender
{
    if (![self.label.text isEqualToString:@""])//判断不是空
    {
        [self.string deleteCharactersInRange:NSMakeRange
         ([self.string length]-1,1)];//删除最后一个字符
        self.label.text=[NSString stringWithString:string];//显示结果
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
