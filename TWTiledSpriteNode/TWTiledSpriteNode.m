//
//  TWTiledSpriteNode.m
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


#import "TWTiledSpriteNode.h"

@interface TWTiledSpriteNode ()
@property (nonatomic, strong)SKCropNode *cropNode;
@property (nonatomic, strong)SKSpriteNode *mask;
@property (nonatomic)CGFloat widthTiles;
@property (nonatomic)CGFloat heightTiles;
@property (nonatomic, strong, readonly)NSArray *tileTextures;

@end

@implementation TWTiledSpriteNode
@synthesize tileTextures = _tileTextures;
@synthesize size = _size;
@synthesize tileSize = _tileSize;

-(id)initWithTexture:(SKTexture*)texture andSize:(CGSize)size{
	NSArray *array = [NSArray arrayWithObject:texture];
	self = [self initWithTextures:array andSize:_size];
	return self;
}

-(id)initWithTextures:(NSArray *)textures andSize:(CGSize)size{
	self = [super init];
	if (self) {
		_cropNode = [[SKCropNode alloc]init];
		_mask = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:size];
		_cropNode.maskNode = _mask;
		_tileTextures = textures;
		SKTexture *first = [textures firstObject];
		_widthTiles = size.width / first.size.width;
		_heightTiles = size.height/first.size.height;
		_tileSize = first.size;
		_size = size;
		[self addChild:_cropNode];
		[self reTile];
	}
	return self;
}

-(void)reTile{
	[_cropNode removeAllChildren];
	_mask = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:_size];
	_cropNode.maskNode = _mask;
	for (int y=0; y< _heightTiles; y++) {
		for(int x=0;x< _widthTiles; x++){
			SKTexture *texture = [_tileTextures objectAtIndex:arc4random_uniform([_tileTextures count])];
			SKSpriteNode *tile = [SKSpriteNode spriteNodeWithTexture:texture];
			tile.size = _tileSize;
			tile.position = CGPointMake((x * tile.size.width)-(_size.width/2), (y * tile.size.height)-(_size.height/2));
			[_cropNode addChild:tile];
			
		}
	}
}

-(void)setTileTextures:(NSArray *)tileTextures{
	_tileTextures = tileTextures;
	if(CGSizeEqualToSize(_size, CGSizeZero)){
		[self setDivisors];
		[self reTile];
	}
}
-(void)setTileTexture:(SKTexture *)texture{
	NSMutableArray *array = [NSMutableArray arrayWithObject:texture];
	_tileTextures = array;
	[self setTileTextures:array];
	
}

-(void)setSize:(CGSize)size{
	_size = size;
	if(_tileTextures){
		[self setDivisors];
		[self reTile];
	}
}

-(void)setDivisors{
	_widthTiles = (_size.width / _tileSize.width)+1;
	_heightTiles = (_size.height/ _tileSize.height)+1;
}
-(void)setTileSize:(CGSize)tileSize{
	_tileSize = tileSize;
	[self setDivisors];
	[self reTile];
}
-(NSArray *)tileTextures{
	return [_tileTextures copy];
}
@end
