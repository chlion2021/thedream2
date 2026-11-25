#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong) NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    // 创建窗口
    NSRect frame = NSMakeRect(0, 0, 360, 180);
    NSUInteger style = NSWindowStyleMaskTitled
                     | NSWindowStyleMaskClosable
                     | NSWindowStyleMaskMiniaturizable;
    self.window = [[NSWindow alloc] initWithContentRect:frame
                                              styleMask:style
                                                backing:NSBackingStoreBuffered
                                                  defer:NO];
    [self.window setTitle:@"All in dream"];
    [self.window center];

    // 创建按钮
    NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(100, 60, 160, 40)];
    [button setTitle:@"点我一下"];
    [button setBezelStyle:NSBezelStyleRounded];
    [button setTarget:self];
    [button setAction:@selector(buttonClicked:)];
    [self.window.contentView addSubview:button];

    [self.window makeKeyAndOrderFront:nil];
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)buttonClicked:(id)sender {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = @"All in dream!";
    alert.informativeText = @"";
    [alert addButtonWithTitle:@"OK"];
    [alert beginSheetModalForWindow:self.window completionHandler:nil];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];
        AppDelegate *delegate = [[AppDelegate alloc] init];
        [app setDelegate:delegate];
        [app setActivationPolicy:NSApplicationActivationPolicyRegular];
        [app run];
    }
    return 0;
}
