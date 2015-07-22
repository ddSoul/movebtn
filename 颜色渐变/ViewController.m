//
//  ViewController.m
//  颜色渐变
//
//  Created by 邓西亮 on 15/6/4.
//  Copyright (c) 2015年 邓西亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *tablew;
    UIButton *btn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    ////
    UILabel *lb = [[UILabel alloc]init];
    lb.backgroundColor = [UIColor redColor];
    [self.view addSubview:lb];
    
    
    
    [super viewDidLoad];
    [self insertTransparentGradient];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(125, 20, 150, 150)];
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.png"]];
    UIView *guojiaview = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 50, 50)];
    guojiaview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.png"]];
//    UITextView *textview = [[UITextView alloc]initWithFrame:CGRectMake(150, 200, 150, 50)];
//    textview.backgroundColor = [UIColor orangeColor];
//    textview.delegate = self;
    btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 200, 150, 50)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    UITextView *textview1 = [[UITextView alloc]initWithFrame:CGRectMake(100, 250, 200, 50)];
    textview1.backgroundColor = [UIColor orangeColor];
    textview1.delegate = self;
    UITextView *textview2 = [[UITextView alloc]initWithFrame:CGRectMake(100, 300, 200, 50)];
    textview2.backgroundColor = [UIColor orangeColor];
    textview2.delegate = self;
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 250, 200, 0.5)];
    view1.backgroundColor = [UIColor whiteColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 200, 0.5)];
    view2.backgroundColor = [UIColor whiteColor];
    textview1.text = @"请输入账号";
    textview1.textColor = [UIColor lightGrayColor];
    textview2.text = @"请输入密码";
    textview2.textColor = [UIColor lightGrayColor];
    
   tablew = [[UITableView alloc]initWithFrame:CGRectMake(150, 250, 150, 400) style:UITableViewStylePlain];
    tablew.delegate = self;
    tablew.dataSource = self;
    [tablew registerNib:[UINib nibWithNibName:@"MycellTableViewCell" bundle:nil] forCellReuseIdentifier:@"MycellTableViewCell"];
    
    UITextField *textfile = [[UITextField alloc]initWithFrame:CGRectMake(100, 500, 100, 50)];
    textfile.delegate = self;
    textfile.backgroundColor = [UIColor whiteColor];
    
    textfile.layer.cornerRadius = 2;
    
    [self.view addSubview:textfile];
    [self.view addSubview:textview1];
    [self.view addSubview:textview2];
    [self.view addSubview:btn];
    [self.view addSubview:guojiaview];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view];
//    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [textField resignFirstResponder];
    return YES;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MycellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MycellTableViewCell"];
    return cell;
}
-(void)login:(UIButton *)btn
{
    [self.view addSubview:tablew];
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [tablew removeFromSuperview];
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView

{
    
    textView.text=@"";
    
    textView.textColor = [UIColor blackColor];
    
    return YES;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [btn setTitle:@"123" forState:UIControlStateNormal];
    btn.tintColor = [UIColor darkGrayColor];
    [self.view addSubview:btn];
    [tablew removeFromSuperview];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"123456");
    if ([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}
- (void) insertTransparentGradient {
    UIColor *colorOne = [UIColor colorWithRed:(0/255.0)  green:(165/255.0)  blue:(168/255.0)  alpha:0.8];
    UIColor *colorTwo = [UIColor colorWithRed:(0/255.0)  green:(165/255.0)  blue:(168/255.0)  alpha:1.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo,  nil];
    
    //crate gradient layer
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    headerLayer.frame = self.view.bounds;
    
    [self.view.layer insertSublayer:headerLayer atIndex:0];
}
//color gradient layer
- (void) insertColorGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(33/255.0)  green:(33/255.0)  blue:(33/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    headerLayer.frame = self.view.bounds;
    
    [self.view.layer insertSublayer:headerLayer above:0];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
