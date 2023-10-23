//
//  HomeViewController.m
//  CryptoW
//
//  Created by Harold Villacob on 17/10/23.
//

#import "HomeController.h"
#import "CryptoCurrency.h"
#import "CryptoDetailController.h"

@implementation HomeController

@synthesize myHomeTableView;

-(instancetype)initWithCryptoData:(CryptoDataModel *)cryptoData {
    self = [super init];
    if (self) {
        _cryptoDataModel = cryptoData;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.cryptoDataModel.delegate = self;
    myHomeTableView = [[HomeTableView alloc] init];
    myHomeTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    myHomeTableView.myTableView.dataSource = self;
    myHomeTableView.myTableView.delegate = self;
    
//    [self.cryptoDataModel loadCryptoDataFromAPI];
    [self.cryptoDataModel loadCryptoDataFromJSON];
    
    [self.view addSubview:myHomeTableView];
    
}

- (void)cryptoDataDidUpdate {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.myHomeTableView.myTableView reloadData];
    });
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat titleHeight = myHomeTableView.titleView.frame.size.height;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > titleHeight) {
        myHomeTableView.titleView.hidden = true;
        
    } else {
        myHomeTableView.titleView.hidden = false;
    }
}

// MARK: DataSource TableView
// MARK: Delegate TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cryptoDataModel.cryptoCurrencies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CryptoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CryptoCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CryptoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CryptoCell"];
    }
    
    if (indexPath.row < self.cryptoDataModel.cryptoCurrencies.count) {
        CryptoCurrency *cryptoCurrency = self.cryptoDataModel.cryptoCurrencies[indexPath.row];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        
        [cell configureCell:cryptoCurrency.name symbol:cryptoCurrency.symbol price:[formatter stringFromNumber:cryptoCurrency.price] percentChange:[NSString stringWithFormat:@"%.2f%%", [cryptoCurrency.percentChange24h floatValue]] imageUrl:[NSString stringWithFormat:@"%d", [cryptoCurrency.idForImage intValue]]];
    }
    
    return cell;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return myHomeTableView.titleView;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CryptoCurrency *cryptoCurrency = self.cryptoDataModel.cryptoCurrencies[indexPath.row];
    
    CryptoDetailController *cryptoDetailController = [[CryptoDetailController alloc] initWithCryptoCurrency:cryptoCurrency];
    
    [self.navigationController pushViewController:cryptoDetailController animated:true];
}

@end
