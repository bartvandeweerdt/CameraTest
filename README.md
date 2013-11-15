CameraTest
==========

During one of my recent projects I had a serious issue with the Camera preview showing a black screen when using UIImagePickerController on iOS7 (iPad).

After searching the internet it became clear that quite a lot of other people were experiencing the same issue. Although I can't be sure if these problems have the same cause as mine, I'd like to share as much info as possible in the hopes of sparing others some valuable time.

Some people hinted that the black camera preview issue had something to do with GCD. When they don't use GCD in their projects the problem doesn't occur. I found this to be the case in my own project, so I investigated further.

What I discovered is that GCD in itself is not the problem. The problem occurs when you try to use anything at all from the UIKit framework in a thread other than the main thread (as part of an NSOperation). 

First of all, let me start by saying that it is clear to me that you shouldn't do this to begin with. In my specific case, however, I had no choice. Since I think that there's a good chance that other people might be experiencing the same weird UIImagePickerController camera behaviour with the same cause, here's some very simple example code explaining what's going on.

The **ViewController** shows 2 simple buttons. One calls **UIImagePickerController**, showing the camera, the other starts some GCD operations doing a simple task.
If you just open the camera, everything works fine. If you first start the operations and then open the camera, the black preview issue occurs.

Again, you shouldn't call UIKit in anything but the main thread. But I don't think it's normal that breaking this rule causes the camera to malfunction when opening it later in the main thread as part of a completely different flow, right?

Hope this helps some people.