//
//  choiceCheckpointLayer.m
//  demoCocos01
//
//  Created by liuchang on 11/18/13.
//
//

#import "choiceCheckpointLayer.h"
#import "HelloWorldLayer.h"

@implementation choiceCheckpointLayer {

      CCSprite *gameTitle;
      CGPoint titleLocation;
      CGSize screenSize;
}

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	choiceCheckpointLayer *layer = [choiceCheckpointLayer node];
	[scene addChild:layer];
	return scene;
}

-(void)getScreenSize{
    
    screenSize = [CCDirector sharedDirector].winSize;
}

-(void) onEnter
{
    [super onEnter];
    //设置位置
    //[self setMenuLocation];
    //设置标题
    [self addGameTitle];

}

//设置位置
-(void)setMenuLocation{
    
    [self getScreenSize];
    
    titleLocation = ccp(screenSize.width*0.55,screenSize.height*0.5);
}

//添加标题
-(void)addGameTitle{
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCSprite *background;
	background = [CCSprite spriteWithFile:@"bg.png"];	background.position = ccp(size.width/2, size.height/2);
	[self addChild: background];
    
    gameTitle = [CCSprite spriteWithFile:@"13.png" rect:CGRectMake(0, 0, 76, 76)];
    gameTitle.position = ccp( size.width/2 , size.height/2 );;
    [self addChild:gameTitle z:0];
    
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Challenge" fontName:@"ChalkboardSE-Bold" fontSize:28];
    label.position = ccp( size.width /2 , size.height/3 );
    label.color = ccc3(255,255,255);
    
    [self addChild:label z:0];
    
    self.isTouchEnabled = YES;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self scheduleOnce:@selector(makeTransition:) delay:0];
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
}
@end
