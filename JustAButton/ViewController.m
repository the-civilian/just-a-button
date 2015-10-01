#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"ViewController"];
}
- (IBAction)buttonPressed:(id)sender {
  NSLog(@"button pressed");
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
