//
//  RSViewController.m
//  RSTask7
//
//  Created by Taisia Kataieva on 2.7.21..
//
/*
 Добрый день, уважаемые проверяющие)
 Заранее приношу извинения за свой код.
 Также при первом клике на textfield, клавиатура задерживается на 5-6 секунд (по крайней мере, на моем устройстве). Я не смогла понять, почему так происходит, если вы увидите причину этой задержки в коде и подскажете, что посмотреть, что бы поправить, буду очень признательна! Если причина не ясна, пожалуйста, наберитесь терпения - клавиатура все-таки появится))
 Спасибо, что уделили время проверке задания. Хорошего дня)
 */

#import "RSViewController.h"

@interface RSViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation RSViewController
@synthesize myLabel, myLabelSecure;
@synthesize textFieldLogin, textFieldSecure, textFieldPassword;
@synthesize myButton, buttonOne, buttonTwo, buttonThree;


- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
    
// LABEL RSSCHOOL
    
    CGRect labelFrame = CGRectMake(90.0f, 80.0f, 200.0f, 35.0f);
        //create the label
        self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
    
        //set the label text
        self.myLabel.text = @"RSSchool";
        //set the lable font
        self.myLabel.font = [UIFont boldSystemFontOfSize:36.0f];
        //se the text alignment
        self.myLabel.textAlignment =  NSTextAlignmentCenter;
        //set the border color and width
      /*  self.myLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.myLabel.layer.borderWidth = 1.0; */
        //add the label to the view
        [self.view addSubview:self.myLabel];

// TEXT FIELD LOGIN

    //NSString *textLogin = @"username";
    NSString *textEnteredLogin;
    CGRect labelFrameTextFieldLogin = CGRectMake(36.0f, 180.0f, 200.0f, 35.0f);
        //move the frame position
        labelFrame.origin.y += labelFrame.size.height + 10.0f;
        //increase the frame height
    labelFrameTextFieldLogin.size.height = 50.0f;
    labelFrameTextFieldLogin.size.width = 306.0f;
    self.textFieldLogin = [[UITextField alloc] initWithFrame:labelFrameTextFieldLogin];
    //set the delegate for the text field to the view controller so that it can listen for events
    self.textFieldLogin.delegate = self;
    //set the border style for the text view
    self.textFieldLogin.borderStyle = UITextBorderStyleRoundedRect;
    //display hint for the user data entry when the field is empty
    self.textFieldLogin.placeholder = [NSString stringWithFormat:@"Login"];
    textFieldLogin.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textFieldLogin.layer.borderWidth = 1.5f;
    self.textFieldLogin.layer.cornerRadius = 5.0f;
    self.textFieldLogin.layer.borderColor = [UIColor colorWithRed:76.0 / 255.0 green:92.0 / 255.0 blue:104.0 / 255.0 alpha:1.0].CGColor;
    //display the clear button on the text field
    //self.textFieldLogin.clearButtonMode = UITextFieldViewModeAlways;
    //return key text - "Return"
    //self.textFieldLogin.returnKeyType = UIReturnKeyDefault;
   self.textFieldLogin.delegate = self;
    //add the text field to the current view
    [self.view addSubview:self.textFieldLogin];
    textEnteredLogin = textFieldLogin.text;
    

    
// TEXT FIELD PASSWORD

    CGRect labelFrameTextPassword = CGRectMake(36.0f, 260.0f, 200.0f, 35.0f);
        //move the frame position
    labelFrame.origin.y += labelFrame.size.height + 10.0f;
        //increase the frame height
    labelFrameTextPassword.size.height = 50.0f;
    labelFrameTextPassword.size.width = 306.0f;
    
    self.textFieldPassword = [[UITextField alloc] initWithFrame:labelFrameTextPassword];
    //set the border style for the text view
    self.textFieldPassword.borderStyle = UITextBorderStyleRoundedRect;
    
    //display hint for the user data entry when the field is empty
    self.textFieldPassword.placeholder = [NSString stringWithFormat:@"Password"];
    self.textFieldPassword.layer.borderWidth = 1.5f;
    self.textFieldPassword.layer.cornerRadius = 5.0f;
    self.textFieldLogin.layer.borderColor = [UIColor colorWithRed:76.0 / 255.0 green:92.0 / 255.0 blue:104.0 / 255.0 alpha:1.0].CGColor;
    self.textFieldPassword.secureTextEntry = true;
    //display the clear button on the text field
    //self.textFieldPassword.clearButtonMode = UITextFieldViewModeAlways;
    self.textFieldPassword.returnKeyType = UIReturnKeyDefault;
    //set the delegate for the text field to the view controller so that it can listen for events
    self.textFieldPassword.delegate = self;
    //add the text field to the current view
    [self.view addSubview:self.textFieldPassword];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tap];

// BUTTON
//create a rounded rectangle type button
    self.myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //set the button size and position
    self.myButton.frame = CGRectMake(108.0f, 350.0f, 150.0f, 40.0f);
    self.myButton.layer.borderWidth = 2;
    self.myButton.layer.borderColor = [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:1.0].CGColor;
    //other colors in app: [UIColor colorWithRed:76.0 / 255.0 green:92.0 / 255.0 blue:104.0 / 255.0 alpha:1.0].CGColor; - Black Coral /// [UIColor colorWithRed:145.0 / 255.0 green:199.0 / 255.0 blue:177.0 / 255.0 alpha:1.0].CGColor; - Turquoise Green ///// [UIColor colorWithRed:194.0 / 255.0 green:199.0 / 255.0 blue:177.0 / 255.0 alpha:1.0].CGColor; - Venetian Red
    
    self.myButton.layer.cornerRadius = 10;
    
   // [self.myButton.setImage(UIImage(named: "person2x.png"), forState:UIControlStateNormal)];
  //  [self.myButton setImage:UIImage:@"person2x.png" forState:UIControlStateNormal];
    
     
    //set the button title for the normal state
    [self.myButton setTitle:@"Authorize"
                   forState:UIControlStateNormal];
    UIImage *btnImage = [UIImage imageNamed:@"personPNG2x"];
    [self.myButton setImage:btnImage forState:UIControlStateNormal];
    [self.myButton.titleLabel setFont:[UIFont systemFontOfSize:20.0f weight:UIFontWeightSemibold]];
    
    CGFloat spacing = 5; // the amount of spacing to appear between image and title
    myButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    myButton.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    
    //set the button title for when the finger is pressing it down
    [self.myButton setTitle:@"Authorize"
                   forState:UIControlStateHighlighted];
   UIImage *btnImageFilled = [UIImage imageNamed:@"person_fill_PNG2x"];
    [self.myButton setImage:btnImageFilled forState:UIControlStateHighlighted];
    
    //add action to capture the button press down event
    [self.myButton setTitle:@"Authorize"
                   forState:UIControlStateDisabled];
    //[self.myButton setEnabled: NO];
    
    [self.myButton addTarget:self
                      action:@selector(buttonIsPressed:)
            forControlEvents:UIControlEventTouchDown];
    //add action to capture when the button is released
    [self.myButton addTarget:self
                      action:@selector(buttonIsReleased:)
            forControlEvents:UIControlEventTouchUpInside];
    //set button tag
    [self.myButton setTag:1];
    //add the button to the view
    [self.view addSubview:self.myButton];

    
    
    // SECURE AREA

    
    // TEXT FIELD SECURE
    CGRect labelSecureFrame = CGRectMake(80.0f, 420.0f, 200.0f, 35.0f);
    
    self.myLabelSecure = [[UILabel alloc] initWithFrame:labelSecureFrame];
    //set the label text
    self.myLabelSecure.text = @"_";
    //set the lable font
    self.myLabelSecure.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightSemibold];
    //se the text alignment
    self.myLabelSecure.textAlignment =  NSTextAlignmentCenter;
    //add the label to the view
    [myLabelSecure addObserver:self
            forKeyPath:@"_"
               options:NSKeyValueObservingOptionNew
                     | NSKeyValueObservingOptionOld
               context:NULL];

    
    [self.view addSubview:self.myLabelSecure];
   
    self.myLabelSecure.hidden = true;
    
    
    // BUTTON 1
     
        self.buttonOne = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.buttonOne.frame = CGRectMake(90.0f, 480.0f, 50.0f, 50.0f);
        self.buttonOne.layer.borderWidth = 1.5;
        self.buttonOne.layer.borderColor = [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:1.0].CGColor;
        self.buttonOne.layer.cornerRadius = 25;
    [self.buttonOne.titleLabel setFont:[UIFont systemFontOfSize:24.0f weight:UIFontWeightSemibold]];
        
        [self.buttonOne setTitle:@"1"
                       forState:UIControlStateNormal];

        [self.buttonOne setTitle:@"1"
                       forState:UIControlStateHighlighted];
        
        //add action to capture the button press down event
        [self.buttonOne setTitle:@"1"
                       forState:UIControlStateDisabled];
        //[self.myButton setEnabled: NO];
        
        [self.buttonOne addTarget:self
                          action:@selector(buttonIsPressed:)
                forControlEvents:UIControlEventTouchDown];
        //add action to capture when the button is released
        [self.buttonOne addTarget:self
                          action:@selector(buttonIsReleased:)
                forControlEvents:UIControlEventTouchUpInside];
        //set button tag
        [self.buttonOne setTag:2];
        //add the button to the view
        [self.view addSubview:self.buttonOne];
   self.buttonOne.hidden = true;
    
    // BUTTON 2
    
    self.buttonTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonTwo.frame = CGRectMake(160.0f, 480.0f, 50.0f, 50.0f);
    
    self.buttonTwo.layer.borderWidth = 1.5;
    self.buttonTwo.layer.borderColor = [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:1.0].CGColor;
    self.buttonTwo.layer.cornerRadius = 25;
    [self.buttonTwo.titleLabel setFont:[UIFont systemFontOfSize:24.0f weight:UIFontWeightSemibold]];
    
    [self.buttonTwo setTitle:@"2"
                   forState:UIControlStateNormal];

    [self.buttonTwo setTitle:@"2"
                   forState:UIControlStateHighlighted];
    
    //add action to capture the button press down event
    [self.buttonTwo setTitle:@"2"
                   forState:UIControlStateDisabled];
    //[self.myButton setEnabled: NO];
    
    [self.buttonTwo addTarget:self
                      action:@selector(buttonIsPressed:)
            forControlEvents:UIControlEventTouchDown];
    //add action to capture when the button is released
    [self.buttonTwo addTarget:self
                      action:@selector(buttonIsReleased:)
            forControlEvents:UIControlEventTouchUpInside];
    //set button tag
    [self.buttonTwo setTag:3];
    //add the button to the view
    [self.view addSubview:self.buttonTwo];
   self.buttonTwo.hidden = true;
    
    // BUTTON 3
    
    self.buttonThree = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonThree.frame = CGRectMake(230.0f, 480.0f, 50.0f, 50.0f);
    
    self.buttonThree.layer.borderWidth = 1.5;
    self.buttonThree.layer.borderColor = [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:1.0].CGColor;
    self.buttonThree.layer.cornerRadius = 25;
    [self.buttonThree.titleLabel setFont:[UIFont systemFontOfSize:24.0f weight:UIFontWeightSemibold]];
    
    [self.buttonThree setTitle:@"3"
                   forState:UIControlStateNormal];

    [self.buttonThree setTitle:@"3"
                   forState:UIControlStateHighlighted];
    
    //add action to capture the button press down event
    [self.buttonThree setTitle:@"3"
                   forState:UIControlStateDisabled];
    //[self.myButton setEnabled: NO];
    
    [self.buttonThree addTarget:self
                      action:@selector(buttonIsPressed:)
            forControlEvents:UIControlEventTouchDown];
    //add action to capture when the button is released
    [self.buttonThree addTarget:self
                      action:@selector(buttonIsReleased:)
            forControlEvents:UIControlEventTouchUpInside];
    //set button tag
    [self.buttonThree setTag:4];
    //add the button to the view
    [self.view addSubview:self.buttonThree];
  self.buttonThree.hidden = true;
    
    
}



- (void) buttonIsPressed:(UIButton *)paramSender{
    switch (paramSender.tag) {
        case 1:
            [self.myButton setBackgroundColor: [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:0.2] ];
            
            if ([textFieldLogin.text  isEqualToString:@"username"] && [textFieldPassword.text  isEqualToString:@"password"]){
                self.buttonThree.hidden = false;
                self.myLabelSecure.hidden = false;
                self.buttonTwo.hidden = false;
                self.buttonOne.hidden = false;
                [textFieldLogin resignFirstResponder];
                [textFieldPassword resignFirstResponder];
                textFieldLogin.enabled = NO;
                self.textFieldLogin.layer.borderColor = [UIColor colorWithRed:145.0 / 255.0 green:199.0 / 255.0 blue:177.0 / 255.0 alpha:0.5].CGColor;
                self.textFieldLogin.layer.borderWidth = 1.5f;
                self.textFieldLogin.layer.cornerRadius = 5.0f;
                textFieldLogin.alpha = 0.5;
                textFieldPassword.enabled = NO;
                self.textFieldPassword.layer.borderColor = [UIColor colorWithRed:145.0 / 255.0 green:199.0 / 255.0 blue:177.0 / 255.0 alpha:0.5].CGColor;
                self.textFieldPassword.layer.borderWidth = 1.5f;
                self.textFieldPassword.layer.cornerRadius = 5.0f;
                textFieldPassword.alpha = 0.5;
                myButton.enabled = NO;
               
            }
            
            if ([textFieldLogin.text isEqualToString:@"username"] && ![textFieldPassword.text isEqualToString:@"password"]) {
                [textFieldLogin setClearsOnBeginEditing:NO];
                self.textFieldLogin.layer.borderColor = [UIColor colorWithRed:145.0 / 255.0 green:199.0 / 255.0 blue:177.0 / 255.0 alpha:1.0].CGColor;
                self.textFieldPassword.layer.borderColor = [UIColor colorWithRed:76.0 / 255.0 green:92.0 / 255.0 blue:104.0 / 255.0 alpha:1.0].CGColor;
               
            }
            
            if (![textFieldLogin.text isEqualToString:@"username"] && [textFieldPassword.text isEqualToString:@"password"]) {
                [textFieldPassword setClearsOnBeginEditing:NO];
                self.textFieldLogin.layer.borderColor = [UIColor colorWithRed:76.0 / 255.0 green:92.0 / 255.0 blue:104.0 / 255.0 alpha:1.0].CGColor;
                self.textFieldPassword.layer.borderColor = [UIColor colorWithRed:145.0 / 255.0 green:199.0 / 255.0 blue:177.0 / 255.0 alpha:1.0].CGColor;
              
                
            }
            
            if (![textFieldLogin.text isEqualToString:@"username"] ){
                self.textFieldLogin.layer.borderWidth = 1.5f;
                self.textFieldLogin.layer.cornerRadius = 5.0f;
                self.textFieldLogin.layer.borderColor = [UIColor colorWithRed:194.0 / 255.0 green:1.0 / 255.0 blue:20.0 / 255.0 alpha:1.0].CGColor;
                [textFieldLogin setClearsOnBeginEditing:YES];
            }
            
            if (![textFieldPassword.text isEqualToString:@"password"] ){
                self.textFieldPassword.layer.borderWidth = 1.0f;
                self.textFieldPassword.layer.cornerRadius = 5.0f;
                self.textFieldPassword.layer.borderColor = [UIColor colorWithRed:194.0 / 255.0 green:1.0 / 255.0 blue:20.0 / 255.0 alpha:1.0].CGColor;
                [textFieldPassword setClearsOnBeginEditing:YES];
                
            }
            break;
        case 2:
            
            [self.buttonOne setBackgroundColor: [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:0.2] ];
            if ([myLabelSecure.text isEqualToString:@"_"]){
            self.myLabelSecure.text = @"1";
                break;
            }
            
            if (![myLabelSecure.text isEqualToString:@"_"] ){
            myLabelSecure.text = [myLabelSecure.text stringByAppendingString:@"1"];
            }
            if (myLabelSecure.text.length == 3 && ![myLabelSecure.text isEqualToString:@"132"]){
                self.myLabelSecure.text = @"_";
               // CGRect labelSecureFrameCommon = CGRectMake(50.0f, 400.0f, 230.0f, 120.0f);
               
                /*myBox.layer.borderWidth = 1.0f;
                myBox.layer.cornerRadius = 5.0f;
                myBox.layer.borderColor = [UIColor colorWithRed:194.0 / 255.0 green:1.0 / 255.0 blue:20.0 / 255.0 alpha:1.0].CGColor;
                   [self.view addSubview:myBox];*/
                break;
            }
            
            
            
            break;
        case 3:
            [self.buttonTwo setBackgroundColor: [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:0.2] ];
            if ([myLabelSecure.text isEqualToString:@"_"]){
            self.myLabelSecure.text = @"2";
                break;
            }
            if (![myLabelSecure.text isEqualToString:@"_"]){
            myLabelSecure.text = [myLabelSecure.text stringByAppendingString:@"2"];
            }
            if (myLabelSecure.text.length == 4 && ![myLabelSecure.text isEqualToString:@"132"]){
                self.myLabelSecure.text = @"_";
                break;
            }
            if ([myLabelSecure.text isEqualToString:@"132"]){
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                                                         message:@"You are successfuly authorized!"
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                //We add buttons to the alert controller by creating UIAlertActions:
                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Refresh"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                    [self viewDidLoad];
                   // [self viewWillAppear:YES];
                  }];
                [alertController.view setTintColor:[UIColor redColor]];
                [alertController addAction:actionOk];
               
                [self presentViewController:alertController animated:YES completion:nil];
                self.myLabelSecure.text = @"_";
                [self.buttonTwo setBackgroundColor: [UIColor colorWithRed:255.0 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0] ];
                self.myLabelSecure.hidden = true;
                self.buttonOne.hidden = true;
                self.buttonTwo.hidden = true;
                self.buttonThree.hidden = true;
                
            }
            break;
        case 4:
            [self.buttonThree setBackgroundColor: [UIColor colorWithRed:128.0 / 255.0 green:164.0 / 255.0 blue:237.0 / 255.0 alpha:0.2] ];
            if ([myLabelSecure.text isEqualToString:@"_"]){
            self.myLabelSecure.text = @"3";
                break;
            }
            if (![myLabelSecure.text isEqualToString:@"_"]){
            myLabelSecure.text = [myLabelSecure.text stringByAppendingString:@"3"];
            }
            if (myLabelSecure.text.length == 3 || myLabelSecure.text.length > 3){
                self.myLabelSecure.text = @"_";
                break;
            }
           
    }
}

- (void) buttonIsReleased:(UIButton *)paramSender{
    switch (paramSender.tag) {
        case 1:
            [self.myButton setBackgroundColor: [UIColor colorWithRed:255.0 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0] ];
            break;
            
           
        case 2:
            [self.buttonOne setBackgroundColor: [UIColor colorWithRed:255.0 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0] ];
        case 3:
            [self.buttonTwo setBackgroundColor: [UIColor colorWithRed:255.0 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0] ];
        case 4:
            [self.buttonThree setBackgroundColor: [UIColor colorWithRed:255.0 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0] ];
        default:
            break;
    }
    
}
-(void)dismissKeyboard
{
    [textFieldLogin resignFirstResponder];
    [textFieldPassword resignFirstResponder];
}

/*-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textFieldLogin resignFirstResponder];
  [textFieldPassword resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //[textFieldLogin resignFirstResponder];
  //  [textFieldPassword resignFirstResponder];
    return [self.textFieldPassword becomeFirstResponder];
}*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textFieldPassword resignFirstResponder];
    return YES;}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
