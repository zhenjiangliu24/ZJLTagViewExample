//
//  ViewController.m
//  ZJLTagViewExample
//
//  Created by ZhongZhongzhong on 16/6/8.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ViewController.h"
#import "TagObject.h"

@interface ViewController ()<ZJLTagListViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *tagNameLabel;
@property (weak, nonatomic) IBOutlet ZJLTagListView *ZJLTagListView;

@property (nonatomic, strong) NSMutableArray *tagList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TagObject *tag1 = [[TagObject alloc]initWithTagName:@"Montreal"];
    TagObject *tag2 = [[TagObject alloc]initWithTagName:@"Toronto"];
    TagObject *tag3 = [[TagObject alloc]initWithTagName:@"Vancouver"];
    TagObject *tag4 = [[TagObject alloc]initWithTagName:@"Saint John"];
    TagObject *tag5 = [[TagObject alloc]initWithTagName:@"Ottawa"];
    TagObject *tag6 = [[TagObject alloc]initWithTagName:@"Quebec city"];
    TagObject *tag7 = [[TagObject alloc]initWithTagName:@"Winnipeg"];
    TagObject *tag8 = [[TagObject alloc]initWithTagName:@"Calgary"];
    self.tagList = [NSMutableArray arrayWithObjects:tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8, nil];
    [self initZJLTagView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)initZJLTagView
{
    self.ZJLTagListView.tagViewType = ZJLTAGNORMAL;
    self.ZJLTagListView.delegate = self;
    self.ZJLTagListView.is_can_add = NO;
    self.ZJLTagListView.tagViewBackgroundColor = [UIColor lightGrayColor];
    self.ZJLTagListView.tagLabelBorderColor = [UIColor blackColor];
    self.ZJLTagListView.tagBorderWidth = 3.0;
    [self.ZJLTagListView createTagViewWith:[self.tagList copy]];
}

#pragma mark - ZJL tag view delegate
- (void)tagView:(ZJLTagListView *)tagView clickedTagAtIndex:(NSInteger)index
{
    if(self.ZJLTagListView.tagViewType == ZJLTAGNORMAL){
        if(index != self.tagList.count){//normal state, click tag
            TagObject *obj = self.tagList[index];
            if([obj respondsToSelector:@selector(tagName)]){
                self.tagNameLabel.text = [obj tagName];
            }
        }else{
            self.ZJLTagListView.tagViewType = ZJLTAGEDIT;
        }
    }else if (self.ZJLTagListView.tagViewType == ZJLTAGEDIT){
        if(index !=self.tagList.count){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Delete this tag?" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //[self dismissViewControllerAnimated:YES completion:nil];
            }];
            UIAlertAction *deleteActon = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                [self.tagList removeObjectAtIndex:index];
                [self.ZJLTagListView reloadData:[self.tagList copy] andTime:0];
            }];
            [alert addAction:cancelAction];
            [alert addAction:deleteActon];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            self.ZJLTagListView.tagViewType = ZJLTAGNORMAL;
        }
    }
}

- (void)tagViewDidChangeType
{
    [self.ZJLTagListView reloadData:[self.tagList copy] andTime:0];
}

@end
