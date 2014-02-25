testautolayout
==============

This project is an attempt to get a dialog box working so that it is centered in an overlay window, full screen, has minimum distances from the screen border and where the label takes the correct height if it is possible and clips with ellipsises if it is not.

The text at the moment is some lorem ipsum... it should be possible to put a lot of text in the label and a little text and the autolayout should adapt the views to the constraints described as described.

The views have yellow, red and green backgrounds to make it more visible what is happening. At the time of writing it looks like the fullscreenViewControllor (yellow) does not take on the size of the full screen and I don't know why.

Any ideas to help progress?

(This project uses the [UIView+Autolayout](https://github.com/smileyborg/UIView-AutoLayout) shortcuts to make some constraints programmatically).