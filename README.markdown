DejalActivityView
=================

DejalActivityView conveniently displays a horizontal, bezel-style, or keyboard-covering view with a spinning activity indicator and adjustable text.


Donations
---------

I wrote DejalActivityView for my own use, but I'm making it available for the benefit of the iOS developer community.

If you find it useful, a donation via PayPal (or something from my Amazon.com Wish List) would be very much appreciated. Appropriate links can be found on the Dejal Developer page:

<http://www.dejal.com/developer>


Latest Version
--------------

You can find the latest version of this code via the GitHub repository:

<https://github.com/Dejal/DejalActivityView>

For news on updates, also check out the Dejal Developer page or the Dejal Blog filtered for DejalActivityView posts:

<http://www.dejal.com/blog/dejalactivityview>


Requirements
------------

- Xcode 4.2 or later.
- iOS 5 or later.
- ARC.


Features
--------

- **DejalActivityView**: a simple horizontal-style loading view, intended for situations where you have a blank view while loading data.
- **DejalWhiteActivityView**: the same as the simple one, but with a white indicator and text instead of black, for use in dark views.
- **DejalBezelActivityView**: an animated round-rect-enclosed variation, with a gray background covering the parent view.
- **DejalKeyboardActivityView**: displays over the keyboard.  Rarely used nowadays (and may be removed in a future version; let me know if you need it).
- A demo project is included.


Usage
-----

Include the DejalActivityView.h and DejalActivityView.m files in your project.

To display the basic `DejalActivityView`, simply use:

	[DejalActivityView activityViewForView:self.view];

The activity view is automatically added as a subview of the specified view (e.g. the current content view). No need to save the result to an ivar.

You can instead specify a custom label via:

	[DejalActivityView activityViewForView:self.view withLabel:@"Processing..."];

Or specify a custom width, e.g. so you can change the label while it is being displayed without upsetting the geometry, via:

	[DejalActivityView activityViewForView:self.view withLabel:@"Connecting..." width:100];

You can also have it manage the network activity indicator in the status bar, e.g.:

	[DejalActivityView activityViewForView:self.view].showNetworkActivityIndicator = YES;

Then when you're done with it, simply invoke this to get rid of it:

	[DejalActivityView removeView];

The other variations are similar.  So for example you can display `DejalBezelActivityView` via:

	[DejalBezelActivityView activityViewForView:self.view];

The `[DejalBezelActivityView activityViewForView:withLabel:]` and `[DejalBezelActivityView activityViewForView:withLabel:width:]` variations are also available.

To remove with animation, call:

	[DejalBezelActivityView removeViewAnimated:YES];

There are other options too; see the [DejalActivityView blog posts](http://www.dejal.com/blog/dejalactivityview) for full details, screenshots, and a demo movie.  Or try the included demo project.


License and Warranty
--------------------

This code uses the standard BSD license.  See the included License.txt file.  Please also see the [Dejal Open Source License](http://www.dejal.com/developer/license/) web page for more information.

You can use this code at no cost, with attribution.  A non-attribution license is also available, for a fee.

You're welcome to use it in commercial, closed-source, open source, free or any other kind of software, as long as you credit Dejal appropriately.

The placement and format of the credit is up to you, but I prefer the credit to be in the software's "About" window or view, if any. Alternatively, you could put the credit in the software's documentation, or on the web page for the product. The suggested format for the attribution is:

> Includes DejalActivityView code from [Dejal](http://www.dejal.com/developer/).

Where possible, please link the text "Dejal" to the Dejal Developer web page, or include the page's URL: <http://www.dejal.com/developer/>.

This code comes with no warranty of any kind.  I hope it'll be useful to you, but I make no guarantees regarding its functionality or otherwise.


Credits
-------

This work was inspired in part by Matt Gallagher's excellent article, [Showing a "Loading..." message over the iPhone keyboard](http://cocoawithlove.com/2009/04/showing-message-over-iphone-keyboard.html). My code only uses the `-keyboardView` method from his article, but he deserves credit and thanks for that and many other helpful articles.


Support / Contact / Bugs / Features
-----------------------------------

I can't promise to answer questions about how to use the code.

If you create an app that uses the code, please tell me about it.

If you want to submit a feature request or bug report, please use [GitHub's issue tracker for this project](https://github.com/Dejal/DejalActivityView/issues).  Or preferably fork the code and implement the feature/fix yourself, then submit a pull request.

Enjoy!

David Sinclair  
Dejal Systems, LLC


Contact: <http://www.dejal.com/contact/?subject=DejalActivityView&ref=dejalactivityview>  
More open source projects: <http://www.dejal.com/developer>  
Open source announcements on Twitter: <http://twitter.com/dejalopen>  
General Dejal news on Twitter: <http://twitter.com/dejal>

