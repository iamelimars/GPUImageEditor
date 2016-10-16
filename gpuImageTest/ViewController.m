//
//  ViewController.m
//  gpuImageTest
//
//  Created by iMac on 10/16/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize inputImage, brightnessFilter, fx_image, hueFilter, saturationFilter, newwImage;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
    hueFilter = [[GPUImageHueFilter alloc]init];
    saturationFilter = [[GPUImageSaturationFilter alloc]init];
    
    inputImage = [UIImage imageNamed:@"ParallaxWeather6Plus-3.png"];
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
    
    UIImage *quickFilteredImage = [stillImageFilter imageByFilteringImage:inputImage];
    
    [stillImageSource addTarget:stillImageFilter];
    [stillImageFilter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    self.imageView.image = inputImage;
    
    newwImage = inputImage;
    fx_image = [[GPUImagePicture alloc] initWithImage:newwImage];
    [fx_image addTarget:hueFilter];
    [hueFilter addTarget:saturationFilter];
    [saturationFilter addTarget:brightnessFilter];
    [brightnessFilter useNextFrameForImageCapture];
    [fx_image processImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderAction:(id)sender {
    
    [brightnessFilter setBrightness:self.slider.value];
    //[fx_image addTarget:brightnessFilter];
    [brightnessFilter useNextFrameForImageCapture];
    [fx_image processImage];
    
    UIImage *final_image = [brightnessFilter imageFromCurrentFramebuffer];
    //newwImage = final_image;
    
    self.imageView.image = final_image;
    
    
    
}
- (IBAction)saturationSliderAction:(id)sender {
    
    [saturationFilter setSaturation:self.saturationSlider.value];
    //[fx_image addTarget:saturationFilter];
    [saturationFilter useNextFrameForImageCapture];
    [fx_image processImage];
    
    UIImage *final_image = [saturationFilter imageFromCurrentFramebuffer];
    //newwImage = final_image;
    self.imageView.image = final_image;
    
}
- (IBAction)hueSliderAction:(id)sender {
    
    [hueFilter setHue:self.hueSlider.value];
    //[fx_image addTarget:hueFilter];
    [hueFilter useNextFrameForImageCapture];
    [fx_image processImage];
    
    UIImage *final_image = [hueFilter imageFromCurrentFramebuffer];
    //newwImage = final_image;
    self.imageView.image = final_image;
}
@end
