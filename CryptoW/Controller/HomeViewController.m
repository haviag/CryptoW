//
//  HomeViewController.m
//  CryptoW
//
//  Created by Harold Villacob on 17/10/23.
//

#import "HomeViewController.h"
#import "CryptoDataController.h"
#import "CryptoCell.h"
#import "CryptoCurrency.h"
#import "CryptoDetailController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource, CryptoDataControllerDelegate>

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) CryptoDataController *cryptoDataController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = [UIColor darkGrayColor];
    self.cryptoDataController = [[CryptoDataController alloc] init];
    self.cryptoDataController.delegate = self;
    
//    [self.cryptoDataController loadCryptoDataFromAPI];
    [self.cryptoDataController loadCryptoDataFromJSON];
    [self.myTableView registerClass:[CryptoCell class] forCellReuseIdentifier:@"CryptoCell"];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    [self.view addSubview:self.myTableView];
    
}

- (void)cryptoDataDidUpdate {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.myTableView reloadData];
    });
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.myTableView.frame = CGRectMake(0, 0, size.width, size.height);
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.myTableView reloadData];
    }];
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
        
        
        cell.nameLabel.text = cryptoCurrency.name;
        cell.symbolLabel.text = cryptoCurrency.symbol;
        cell.priceLabel.text = [NSString stringWithFormat:@"$%.2f", [cryptoCurrency.price floatValue]];
        cell.percentChangeLabel.text = [NSString stringWithFormat:@"%.2f%%", [cryptoCurrency.percentChange24h floatValue]];
        
        [cell configureCell:cryptoCurrency.name symbol:cryptoCurrency.symbol price:cell.priceLabel.text percentChange:cell.percentChangeLabel.text imageUrl:[NSString stringWithFormat:@"%d", [cryptoCurrency.idForImage intValue]]];
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 5, tableView.frame.size.width - 20, 20)];
    titleLabel.text = @"Home";
    titleLabel.font = [UIFont systemFontOfSize:24.0];
    titleLabel.textColor = [UIColor lightTextColor];
    
    [headerView addSubview:titleLabel];
    return headerView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CryptoCurrency *cryptoCurrency = self.cryptoDataController.cryptoCurrencies[indexPath.row];
    NSLog(@"price the %@ row", cryptoCurrency.price);
    
    CryptoDetailController *cryptoDetailController = [[CryptoDetailController alloc] initWithCryptoCurrency:cryptoCurrency];
    
//    [self presentViewController:cryptoDetailController animated:true completion:nil];
    [self.navigationController pushViewController:cryptoDetailController animated:true];
}

@end
