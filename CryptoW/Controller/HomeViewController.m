//
//  HomeViewController.m
//  CryptoW
//
//  Created by Harold Villacob on 17/10/23.
//

#import "HomeViewController.h"
#import "CryptoCell.h"
#import "CryptoCurrency.h"
#import "CryptoDetailController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource, CryptoDataControllerDelegate>

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) UILabel *titleView;

@end

@implementation HomeViewController

-(instancetype)initWithCryptoData:(CryptoDataController *)cryptoData {
    self = [super init];
    if (self) {
        _cryptoDataController = cryptoData;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.myTableView = [[UITableView alloc] init];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
    
    self.cryptoDataController.delegate = self;
    
//    [self.cryptoDataController loadCryptoDataFromAPI];
    [self.cryptoDataController loadCryptoDataFromJSON];
    [self.myTableView registerClass:[CryptoCell class] forCellReuseIdentifier:@"CryptoCell"];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    [self.myTableView addSubview:self.titleView];
    [self.view addSubview:self.myTableView];
    [self setupConstraints];
    
}

- (void)cryptoDataDidUpdate {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.myTableView reloadData];
    });
}

- (void)setupConstraints {
    self.myTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.myTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.myTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.myTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.myTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat titleHeight = self.titleView.frame.size.height;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > titleHeight) {
        _titleView.hidden = true;
    } else {
        _titleView.hidden = false;
    }
}

// MARK: DataSource TableView
// MARK: Delegate TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cryptoDataController.cryptoCurrencies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CryptoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CryptoCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CryptoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CryptoCell"];
    }
    
    if (indexPath.row < self.cryptoDataController.cryptoCurrencies.count) {
        CryptoCurrency *cryptoCurrency = self.cryptoDataController.cryptoCurrencies[indexPath.row];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        
        [cell configureCell:cryptoCurrency.name symbol:cryptoCurrency.symbol price:[formatter stringFromNumber:cryptoCurrency.price] percentChange:[NSString stringWithFormat:@"%.2f%%", [cryptoCurrency.percentChange24h floatValue]] imageUrl:[NSString stringWithFormat:@"%d", [cryptoCurrency.idForImage intValue]]];
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    self.titleView = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, self.myTableView.frame.size.width - 20, 20)];
    self.titleView.backgroundColor = [UIColor colorNamed:@"MyBackgoundColor"];
    self.titleView.text = @"Home";
    self.titleView.textColor = [UIColor whiteColor];
    self.titleView.font = [UIFont systemFontOfSize:24.0];
    [headerView addSubview:self.titleView];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CryptoCurrency *cryptoCurrency = self.cryptoDataController.cryptoCurrencies[indexPath.row];
    
    CryptoDetailController *cryptoDetailController = [[CryptoDetailController alloc] initWithCryptoCurrency:cryptoCurrency];
    
    [self.navigationController pushViewController:cryptoDetailController animated:true];
}

@end
