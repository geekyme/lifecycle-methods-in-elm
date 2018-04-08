 ## Explorations to test how to do a lifecycle method in Elm

 NOTE: This is purely experimental and not recommended. 
 
 It makes use of the browser event ["webkitAnimationEnd"](https://github.com/geekyme/lifecycle-methods-in-elm/blob/master/src/Main.elm#L60) as a workaround to signal that an element has loaded. We cannot use the "onload" event here as the element node would have already been loaded before the event handler was bound.
 
 The hope of this demo is to be able to show that we can run some initialization code on JS side after an element is loaded

 ## Running the code

 1. Install [create-elm-app](https://github.com/halfzebra/create-elm-app)
 
 2. `elm-app start`

 ## What you will see

 1. Screen shows "Loading..."

 2. 5 seconds later, screen shows "Your Elm app is working!"

 3. Chrome console logs show "Ready to do funny stuff on: <node>"