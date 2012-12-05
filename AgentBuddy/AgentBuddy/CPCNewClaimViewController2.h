//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import <UIKit/UIKit.h>
#import "CPCDataClass.h"

@interface CPCNewClaimViewController2 :  UIViewController <UITextFieldDelegate, UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *vinNumber;
@property (weak, nonatomic) IBOutlet UITextField *model;
@property (weak, nonatomic) IBOutlet UITextField *make;
@property (weak, nonatomic) IBOutlet UITextField *year;
@property (weak, nonatomic) IBOutlet UITextField *color;
@property (weak, nonatomic) IBOutlet UITextField *licensePlateNumber;
@property (weak, nonatomic) IBOutlet UITextView *claimNotes;
@property (weak, nonatomic) IBOutlet UIImageView *picture1;
@property (weak, nonatomic) IBOutlet UIImageView *picture2;
@property (weak, nonatomic) NSData *storePicture1;
@property (weak, nonatomic) NSData *storePicture2;


@property (strong, nonatomic) IBOutlet UILabel *customerLabel;
- (IBAction)addClaimBtn:(UIButton *)sender;
- (UIImage *) fixOrientation: (UIImage *) theImage;

//-(IBAction)showCamera1:(id)sender;
//-(IBAction)showCamera2:(id)sender;
@end
