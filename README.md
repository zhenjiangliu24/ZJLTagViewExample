# ZJLTagViewExample
A very useful editable tag view for objective-c
![Alt text](/screenshot.png |width=300?raw=true "screen shot")
![Alt text](/screenshot2.png?raw=true "screen shot")

There is an array which contains all the tag object, each of the object should consform to protocol: ZJLTagListViewObject.
Initialize the tag view by set all its attributes,
@property (assign) float tagFont;
@property (nonatomic, assign) float tagCornerRadius;
@property (nonatomic, assign) float tagBorderWidth;

@property (nonatomic, strong) UIColor *tagViewBackgroundColor;
@property (nonatomic, strong) UIColor *tagLabelBackgroundColor;
@property (nonatomic, strong) UIColor *tagLabelBorderColor;
@property (nonatomic, strong) UIColor *tagTextColor;

@property (nonatomic) NSTextAlignment tagTextAlign;
@property (nonatomic, assign) ZJLTAGTYPE tagViewType;
@property (nonatomic, assign) BOOL is_can_add;

and then call the 
- (void)createTagViewWith:(NSArray *)tagList
to create the tag view as well as the tags.

The view controller should implement the method
- (void)tagView:(ZJLTagListView *)tagView clickedTagAtIndex:(NSInteger)index

and an optional method
- (void)tagViewDidChangeType



