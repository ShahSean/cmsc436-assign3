# Assignment 3: Fancy Triples

## Goals
Learn to use:
 * property animation
 * custom views
 * drawing
 * gestures
 * tab bar view controllers
 * user defaults
 * dynamic animations

This is the project where we end up with a real game we can give out
to friends and family. We are not significantly changing core
functionality, but we are adding many of the extras that make apps usable.
See the "assign3.mp4" video on ELMS.

## Before you begin

This project is based on the last one, but copying Xcode projects is a
dicy, multiple-step project, easy to mess up.

Instead, I suggest you create a new project `assign3` in your repository,
no need for either unit or UI tests. Create a new `model.swift`, and then
copy and paste whichever portions of your code you want to keep (probably a lot
of it).

Run this version to ensure everything is working correctly, quit out of Xcode,
`git add` your code, and then commit push to the server. Note that if you
create more files, you need to manually add them as well. `git status` will
tell you what has been modified or is new.

We realize that `git` is sometimes a challenging, non-intuitive tool,
especially as we are not using Xcode's GUI interface, but understanding git
will serve you well in almost any facet of the tech world going forward.

**XXX -- the rest of this has not been updated!**

## Task 1: Change your storyboard.
Throw away your statically defined "tile" Buttons. You are going to
programmatically create
"tiles" on the fly to match your game model.

The storyboard will have the following elements:
- a `view` (view from the interface builder, just as if it were a button) to use as your square board (add a constraint to ensure that it stays square)
- a stack of controls, including:
  - left, right, up, down buttons
  - newgame
  - segmented random/determ control
  - score label

Put the view and the control stack into another stack (the top-level stack), add constraints as I
did in class to:
- pull the top-level stack's leading and trailing edges to 10 points off safe
  area, center it vertically
- ensure that the square board is as large as possible (pin leading and
  trailing edges to it's superview

### Adapt to Orientation changes
Introduce two variations to allow your storyboard to adapt smoothly to
landscape mode and back again:
- Introduce a *horizontal* variant to the top-level stack for *compact height*
- Put the storyboard in horizontal mode, click on "Vary for Traits", and get
  rid of some constraints that no longer apply in horizontal mode (don't need
  to pin leading and trailing edges of top-level stack to edges, etc.), and
  add new ones (pin top and bottom of top-level stack to edges, etc.)
- Click done varying, go back to vertical mode, and click "Done Varying".

You cannot run at this point because your `IBOutlet`s refer to non-existent views.


## Task 2: Change the Model to use Tiles

Your model is conceptually unchanged. However, **the view** is
now going to animate tile movement, and therefore needs to recognize
specific tiles in order to identify tile movements.

We are therefore going to change our board's base type from `Int` to a
new struct `Tile`.
`Tile`s will have a unique *id*, and  therefore be identifiable even
as their value (the number) changes. Define `Tile` as follows:
```
     struct Tile {
         var val : Int
         var id : Int
         var row: Int    // recommended
         var col: Int    // recommended
     }
```

Your model's `board` will change from `[[Int]]` to  `[[Tile?]]`. Note the
optional base type; each cell of your board will consist of either a `Tile`
or a `nil`.

You might want to include `row` and `col` properties to make drawing on the
board a bit easier. Be sure to update these properties before returning to the
view controller after a collapse, spawn, or newgame.

**Hint:** If a row has the following tiles and we are collapsing left:
```
   (val: 1, id: 13), (val:2, id:14), nil, nil
```
you probably want to have tile 13 disappear, while tile 14 moves to the
left. This makes animation more straightforward.


## Change the ViewController to use TileButtons
Your `updateViewForGame` (substitute whatever name you use) needs to ensure
that there are buttons on top of the *board* (`viewOutlet` you've attached to
the square view you put on the storyboard) for each current tile. This
involves:
- create buttons for each newly-seen tile and adding as a *subview* to the
  `board` at the correct location
- moving the `frame` for each tile that we've already seen
- removing buttons for any tiles that we had seen before but are no longer in
  the model

Before you get started, you should create a new subclass `ButtonTile`:
```
class ButtonTile: UIButton {
    var tile = Tile(val: 0, id: 0, row: 0, col: 0)

    convenience init(t: Tile) {
        self.init()
        tile = t
    }
}
```
where you have defined `Tile` in your new model. You can use a `ButtonTile`
just like a `UIButton`, but it has the `Tile` information readily at hand
(crucial for implementing animation via a custom view later).

Your code will be able to recognize tiles from previous steps in the
application because each tile will have a unique `ID`.

At the end of this step you should have a fully functional game again. It
should adapt well to the orientation changes *except* that existing TileButtons
might have the wrong size and position until a subsequent swipe.

**Hint:** You should create a method `func buttonFrame(row: Int, col: Int,
view: UIView) -> CGRect` 
that will compute the frame for a `ButtonTile`, based on `view` and the fact
that your game board will always have four rows of four possible positions.

**Hint:** adding a button to `board` can be done w/ the following code:
```
                let button = ButtonTile(t: tileMap[id]!)
                board.addSubview(button)
```
Later on it can be removed via `tileButton.removeFromSuperView()`

**Save early and often by pushing to your repository.**

## Task 3: Custom View
At this point we want to build a custom view for our board, and have
`ButtonTile` operate independently of the view controller.

- Subclass `UIView` with a custom `BoardView` by create a new Cocoa Touch
  file.
- Move `buttonFrame` your new `BoardView` class.
- `override func draw(_ rect: CGRect)` to draw the board lines any way you
  wish, though you must use `UIBezierPath`.
- `override func layoutSubviews()` to get lay out your buttons in the correct
  location.
  
`draw` is called by iOS whenever a previously unseen portion of the board gets
seen. Use this just to draw the board's background lines.

`layoutSubviews` is the majority of this task. It is called whenever iOS think
there might have been a change in layout (at app startup, orientation changes,
and other seemingly random times).

Your job is to make put each button in it's proper place, set the titles,
colors, etc. Views should not access view controllers' data directly. Instead make this
routine entirely standalone, deriving all information by querying its own
`subviews` property. 

`subviews` is an array of all child view, which in this case is only those
buttons that the view controller has put on the board. But how to figure out
where to situate the buttons, and how to figure out color and text of each?

Luckily, these "buttons" are actually `ButtonTile`s. Cast each `UIView` to a
`ButtonTile` and you now have access to the complete `Tile` associated with
each button.

The view controller's `updateViewFromGame()` method is now quite short. It has
to:
- add `ButtonTile`s to the board if the model has a previously-unseen `Tile`.
- remove `ButtonTile`s from the board if a previously-seen `Tile` no longer
  exists. 
- ensure that all remaining `ButtonTile`s have accurate row/col information.
- update the score
- ensure that the board's layout / draw methods are called by calling `board.setNeedsDisplay()`

**Do not add any externally-accessed methods or properties in your custom view.**
All communication from view controller to view should be from the
`ButtonTiles` in the custom view's `subviews` array.

## Task 4: Animation
Implement tile animation entirely in your `BoardView` class:
- animate new tiles but starting them w/ opacity of 0 and animating to opacity
  1.0
- animate movement of existing tiles to new locations
- use opacity again to animate disappearence of previously-seen tiles

**Hint:** Animating tile disappearence in `BoardView` will not work if the
view controller removes the `ButtonTile` from the board.

## Task 5: Gestures
Add up, down, left, and right swipe gestures to the board. The gesture recognizer use your
game's view controller as a target (first parameter to the
`UISwipeGestureRecognizer` initializer), but you can attach this either to
view controller's view, or to the game board. Either works.

## Task 6: TabBarController
This task is simple: draw out a `TabBarController` in the storyboard, attach
the game controller (your original `ViewController`), and ensure that the `TabBarController` is the initial
controller by moving the arrow.

Everything else should continue working the same.

## Task 7: Implement the *HighController* Scene
You should:
- subclass the `UIViewController` to a new `HighController` class. 
- use interface builder to add a `UITableView`.
- implement routines for the view controller to call providing a new high
  score
- use `UserDefaults` to store and retrieve high scores
- the the tableview to show at least ten of the top scores with rank / score /
  date-and-date, as shown in the video.
- your game should jump to the high-scores screen at the end of a game when
  calling `isDone()` returns true for the first time.
- you do not need to worry about landscape mode


## Task 8: Implement the *About* Scene
It doesn't have to be like mine, and it doesn't have use gestures, but it
should be fancy. Use `UIBezierPath` to draw something a diagram, make a little
mini-game using dynamic gestures, be creative!
- You do have to worry about landscape mode. If you do use dynamic animations
  and they fly away during rotation, it's fine just to have a way to restart
  in the new orientation


## Grading
 Note that the above tasks are for sequencing your work. They do not match up exactly with this grading rubric:
- 30: change storyboard and buttons to be dynamic, adapting to orientation/device changes
- 30: animation, both movement and spawns
- 10: gestures
- 10: tabbarcontroller (just with labels saying "High Score" and "by AwesomeWhoever")
- 10: High scores using a tableview and `UserDefaults`
- 10: Fancy About scene using dynamic animation. 
  
  
