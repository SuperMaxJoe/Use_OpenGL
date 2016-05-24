//
//  ViewController.m
//  Use_OpenGL
//
//  Created by pengfei on 16/5/20.
//  Copyright © 2016年 pengfei. All rights reserved.
//

#import "ViewController.h"



@interface ViewController()<GLKViewDelegate>
@property(nonatomic,strong)EAGLContext *context;
@property(nonatomic,strong)GLKBaseEffect *effect;

@end

@implementation ViewController
@synthesize context,effect;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat squareVertexData[48] = { 0.5f, 0.5f, -0.9f, 0.0f, 0.0f, 1.0f, 1.0f,
        1.0f, -0.5f, 0.5f, -0.9f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.5f, -0.5f, -0.9f,
        0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.5f, -0.5f, -0.9f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f,
        -0.5f, 0.5f, -0.9f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, -0.5f, -0.5f, -0.9f, 0.0f,
        0.0f, 1.0f, 1.0f, 1.0f};
    self.context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES3];
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.delegate = self;
    
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    [EAGLContext setCurrentContext:context];
    glEnable(GL_DEPTH_TEST);
    
    self.effect = [[GLKBaseEffect alloc]init];
    self.effect.light0.enabled = GL_TRUE;
    self.effect.light0.diffuseColor = GLKVector4Make(1.0f, 1.0f, 0.0f, 1.0f);
    
    GLuint buffer;
    glGenBuffers(1, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(squareVertexData), squareVertexData, GL_STATIC_DRAW);

    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 4*8, (char*)NULL+0);
    
}
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
