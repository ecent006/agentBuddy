//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import <UIKit/UIKit.h>
#import "CPCDataClass.h"
#import "CPCClaimReportViewController.h"

@class CPCEditClaimByCustomerViewController;


@interface CPCEditByCustomer2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *claimsList;
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UILabel *customerNameLabel;

@end
