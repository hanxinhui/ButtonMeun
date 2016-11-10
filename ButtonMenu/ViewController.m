//
//  ViewController.m
//  meau
//
//  Created by 韩新辉 on 2016/11/10.
//  Copyright © 2016年 韩新辉. All rights reserved.
//

#import "ViewController.h"
#import "SDAutoLayout.h"
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()



@property (nonatomic,strong) NSMutableArray *interestArray;/*存放选中的按钮*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
        [self viewView];
    
}

- (void)viewView{
    
    
    _lastTag = 10;
    _threeHeadView = [[UIView alloc]init];
    _threeHeadView.frame = CGRectMake(0, 40, SCREEN_WIDTH, 150);
    [self.view addSubview:_threeHeadView   ];
    
    CGSize size = CGSizeMake(25, 30);
        
    //间距
    CGFloat padding = 25.0;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    NSArray *titArr = [NSArray arrayWithObjects:@"动态", @"用户点评(9999)",@"专家说(9999)",nil];
    NSMutableArray *temp = [NSMutableArray new];

    for (int i = 0 ; i < titArr.count; i++) {
    
        CGFloat keyWorldWidth = [self getSizeByString:titArr[i] andFontSize:15].width;
        
        if (keyWorldWidth > width) {
        
            keyWorldWidth = width;
            
        }
        
        if (width - size.width < keyWorldWidth) {
        
            size.height += 30.0;
            size.width = 5.0;
            
        }
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(size.width, size.height - 30, keyWorldWidth, 20)];
        
        btn.tag = i + 10;
        btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btn setTitle:[titArr objectAtIndex:i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [btn setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor  redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(changeMessage:) forControlEvents:
         UIControlEventTouchUpInside];
    
        size.width += keyWorldWidth + padding;
        
        if (i == 0) {
            btn.selected = YES;
            
        }
        
        [_threeHeadView addSubview:btn];
        [temp addObject:btn];

    }
    
    
    UIView *addView = [UIView new];
    addView.frame = CGRectMake(25,30,30,1);
    addView.backgroundColor = [UIColor redColor];
    [_threeHeadView addSubview:addView];

    _addView = addView;
    
    
}

-(void)changeMessage:(UIButton *)btn{
    if (btn.tag != _lastTag) {
    
        UIButton *lastButton = (UIButton *)[_threeHeadView viewWithTag:_lastTag];
        lastButton.selected = NO;
        _lastTag = btn.tag;
        
    }
    
    
    if (!btn.selected) {
        btn.selected = YES;
    }
    
    
    if (btn.tag) {
        
        CGFloat lineX = btn.origin.x;
        CGFloat lineWidth = btn.size.width;
        
        [UIView animateWithDuration:0.25 animations:^{
        
            CGRect frame = _addView.frame;
            frame.origin.x = lineX;
            frame.size.width = lineWidth;
            _addView.frame = frame;
        }];
        
        
    }
    
}
//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string andFontSize:(CGFloat)font
{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
