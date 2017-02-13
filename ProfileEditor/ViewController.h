//
//  ViewController.h
//  ProfileEditor
//
//  Created by Conny Yang on 12/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)chooseImageDidTap:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@property (weak, nonatomic) IBOutlet UITextField *firstNameText;

@property (weak, nonatomic) IBOutlet UITextField *lastNameText;

@property (weak, nonatomic) IBOutlet UITextField *addressText;

- (IBAction)saveProfile:(id)sender;

@end

