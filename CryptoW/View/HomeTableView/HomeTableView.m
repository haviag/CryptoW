//
//  UITableView+HomeTableView.m
//  CryptoW
//
//  Created by Harold Villacob on 23/10/23.
//

#import "HomeTableView.h"

@implementation HomeTableView
@synthesize myTableView;
@synthesize titleView;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
        titleView = [[UILabel alloc] init];
        titleView.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
        titleView.text = @"Home";
        titleView.textColor = [UIColor whiteColor];
        titleView.font = [UIFont systemFontOfSize:24.0];
        titleView.textAlignment = NSTextAlignmentLeft;
        [self addSubview:titleView];
        
        myTableView = [[UITableView alloc] init];
        myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        myTableView.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
        [myTableView registerClass:[CryptoCell class] forCellReuseIdentifier:@"CryptoCell"];
        
        [self addSubview:myTableView];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints {
    myTableView.translatesAutoresizingMaskIntoConstraints = NO;
    titleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [titleView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [titleView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = YES;
    [titleView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:16].active = YES;
    [titleView.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:-16].active = YES;
    
    [myTableView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [myTableView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [myTableView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [myTableView.topAnchor constraintEqualToAnchor:titleView.bottomAnchor constant:16].active = YES;
}
@end
