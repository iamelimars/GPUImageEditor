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
@synthesize inputImage, brightnessFilter, fx_image, hueFilter, saturationFilter, newwImage, rgbFilter, opacityFilter, gpuImageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
    hueFilter = [[GPUImageHueFilter alloc]init];
    saturationFilter = [[GPUImageSaturationFilter alloc]init];
    rgbFilter = [[GPUImageRGBFilter alloc]init];
    opacityFilter = [[GPUImageOpacityFilter alloc] init];
    inputImage = [UIImage imageNamed:@"ParallaxWeather6Plus-3.png"];
    gpuImageView = [[GPUImageView alloc]initWithFrame:self.imageView.frame];
    [self.view addSubview:gpuImageView];
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
    
    UIImage *quickFilteredImage = [stillImageFilter imageByFilteringImage:inputImage];
    
    [stillImageSource addTarget:stillImageFilter];
    [stillImageFilter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    //self.imageView.image = inputImage;
    newwImage = inputImage;
    fx_image = [[GPUImagePicture alloc] initWithImage:newwImage];
    [fx_image addTarget:rgbFilter];
    [rgbFilter addTarget:opacityFilter];
//    [hueFilter addTarget:saturationFilter];
//    [saturationFilter addTarget:brightnessFilter];
    [opacityFilter useNextFrameForImageCapture];
    [fx_image processImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderAction:(id)sender {
    
    //[brightnessFilter setBrightness:self.slider.value];
    [rgbFilter setRed:self.slider.value];
    //[fx_image addTarget:brightnessFilter];
    [opacityFilter useNextFrameForImageCapture];
    [fx_image processImage];
    
    UIImage *final_image = [opacityFilter imageFromCurrentFramebuffer];
    //newwImage = final_image;
    
    self.imageView.image = final_image;
    
    
    
}
- (IBAction)saturationSliderAction:(id)sender {
    
//    [saturationFilter setSaturation:self.saturationSlider.value];
    [rgbFilter setGreen:self.saturationSlider.value];
    //[fx_image addTarget:saturationFilter];
    [opacityFilter useNextFrameForImageCapture];
    [fx_image processImage];
    
    UIImage *final_image = [opacityFilter imageFromCurrentFramebuffer];
    //newwImage = final_image;
    self.imageView.image = final_image;
    
}
- (IBAction)hueSliderAction:(id)sender {
    
//    [hueFilter setHue:self.hueSlider.value];
    [rgbFilter setBlue:self.hueSlider.value];
    //[fx_image addTarget:hueFilter];
    [opacityFilter useNextFrameForImageCapture];
    [fx_image processImage];
    
    UIImage *final_image = [opacityFilter imageFromCurrentFramebuffer];
    //newwImage = final_image;
    self.imageView.image = final_image;
}
- (IBAction)opacitySliderChnged:(id)sender {
    
    [opacityFilter setOpacity:[(UISlider *)sender value]];
    [opacityFilter useNextFrameForImageCapture];
    [fx_image processImage];
    UIImage *final_image = [opacityFilter imageFromCurrentFramebuffer];

    self.imageView.image = final_image;
    
    
}
@end
