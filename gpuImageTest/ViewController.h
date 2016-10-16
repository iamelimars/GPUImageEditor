//
//  ViewController.h
//  gpuImageTest
//
//  Created by iMac on 10/16/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) UIImage *inputImage;
@property (strong, nonatomic) UIImage *newwImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)sliderAction:(id)sender;
@property (strong, nonatomic) GPUImageBrightnessFilter *brightnessFilter;
@property (strong, nonatomic) GPUImageHueFilter *hueFilter;
@property (strong, nonatomic) GPUImageSaturationFilter *saturationFilter;
@property (strong, nonatomic) GPUImagePicture *fx_image;
- (IBAction)saturationSliderAction:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *saturationSlider;
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;
- (IBAction)hueSliderAction:(id)sender;

@end

