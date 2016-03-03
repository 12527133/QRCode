//
//  ViewController.m
//  QRCode
//
//  Created by Mac_Mini on 15/9/15.
//  Copyright (c) 2015年 Chenxuhun. All rights reserved.
//

#import "CustomViewController.h"
#import "QRCodeViewController.h"
@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *openQRBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 100, self.view.frame.origin.y + 250, 150, 40)];
    openQRBtn.backgroundColor = [UIColor grayColor];
    [openQRBtn setTitle:@"Open QRCode" forState:UIControlStateNormal];
    [openQRBtn addTarget:self action:@selector(validateCanmere:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openQRBtn];
    
}

-(void)validateCanmere:(UIButton *)validate
{
    if ([self validateCamera]) {
        
        [self showQRViewController];
        
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有摄像头或摄像头不可用" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (BOOL)validateCamera {
    
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] &&
    [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (void)showQRViewController {
    
    QRCodeViewController *qrVC = [[QRCodeViewController alloc] init];
    [self.navigationController pushViewController:qrVC animated:YES];
}



@end
