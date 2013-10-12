//
//  TWTiledSpriteNode.h
//  TWTiledSpriteNode
//
//  Created by Thomas Wilson on 12/10/2013.
//  Copyright (c) 2013 Thomas Wilson. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TWTiledSpriteNode : SKNode

@property(nonatomic)CGSize size;

-(id)initWithTextures:(NSArray *)textures andSize:(CGSize)size;
-(id)initWithTexture:(SKTexture*)texture andSize:(CGSize)size;


-(void)setTileTextures:(NSArray *)tileTextures;
-(void)setTileTexture:(SKTexture *)texture;


-(void)setSize:(CGSize)size;

@end
