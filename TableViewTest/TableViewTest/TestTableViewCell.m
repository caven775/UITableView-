//
//  TestTableViewCell.m
//  TableViewTest
//
//  Created by 林克文 on 2017/1/14.
//  Copyright © 2017年 LKW. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

+ (TestTableViewCell *)tabelView:(UITableView *)tableView cellIdentifier:(NSString *)cellIdentifier
{
    TestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * testLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 44)];
        testLabel.text = @"测试";
        [self.contentView addSubview:testLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")]) {
            for (UIView * actionView in subView.subviews) {
                if ([actionView isKindOfClass:[UIButton class]]) {
                    UIButton * deleteButton = (UIButton *)actionView;
                    //                    deleteButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
                    [deleteButton setBackgroundColor:[UIColor cyanColor]];
                    [deleteButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
                    [deleteButton setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
                    [deleteButton setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
                    break;
                }
            }
            break;
        }
    }
}

@end
