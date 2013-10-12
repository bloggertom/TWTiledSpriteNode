//
//  MyScene.m
//  TWTiledSpriteNode
//
//  Created by Thomas Wilson on 12/10/2013.
//  Copyright (c) 2013 Thomas Wilson. All rights reserved.
//

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
		_currentSize = self.size;
		_tiledNode = [[TWTiledSpriteNode alloc]initWithTextures:array andSize:_currentSize];
			//_tiledNode.position = CGPointMake(100, 100);
		
		[self addChild:_tiledNode];

        
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
	}
	
}

@end
