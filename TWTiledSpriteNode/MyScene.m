//
//  MyScene.m
//  TWTiledSpriteNode
//
//  Created by Thomas Wilson on 12/10/2013.
//  Copyright (c) 2013 Thomas Wilson. All rights reserved.
//
/*
 Copyright (c) 2013 Thomas Wilson
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
#import "MyScene.h"
#import "TWTiledSpriteNode.h"

@interface MyScene ()

@property (nonatomic)CGSize currentSize;
@property (nonatomic, strong)TWTiledSpriteNode *tiledNode;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
		
		for (int i = 1; i < 4; i++) {
			SKTexture *texture = [SKTexture textureWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
			if (texture) {
				NSLog(@"got teture");
			}
			[array addObject:texture];
		}
		_currentSize = CGSizeMake(100, 100);
		_tiledNode = [[TWTiledSpriteNode alloc]initWithTextures:array andSize:_currentSize];
		_tiledNode.position = CGPointMake(_tiledNode.size.width/2, _tiledNode.size.height/2);
		_tiledNode.position = CGPointMake(200, 200);
			//[_tiledNode setTileSize:CGSizeMake(100, 100)];
		[self addChild:_tiledNode];
			//[self addChild:node];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
	UITouch *touch = [touches anyObject];
	
	CGPoint location = [touch locationInNode:self];
	
	_currentSize = CGSizeMake(location.x, location.y);
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInNode:self];
	
	_currentSize = CGSizeMake(location.x,
							  location.y);
	
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
	if (!CGSizeEqualToSize(_tiledNode.size, _currentSize)) {
		[_tiledNode setSize:_currentSize];
			//_tiledNode.position = CGPointMake(_currentSize.width/2, _currentSize.height/2);
	}
	
}

@end
