//
//  RSViewController.h
//  RSTask7
//
//  Created by Taisia Kataieva on 2.7.21..
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic, strong) UILabel *myLabel, *myLabelSecure;
@property (nonatomic, strong) UITextField *textFieldLogin;
@property (nonatomic, strong) UITextField *textFieldPassword;
@property (nonatomic, strong) UITextField *textFieldSecure;
@property (nonatomic, strong) UIButton *myButton;
@property (nonatomic, strong) UIButton *buttonOne;
@property (nonatomic, strong) UIButton *buttonTwo;
@property (nonatomic, strong) UIButton *buttonThree;

@end





NS_ASSUME_NONNULL_END
