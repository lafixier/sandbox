import wNim

# import submodules one by one can speed up compilation time
# import wNim/[wApp, wFrame, wPanel, wStaticText]

let app = App()
let frame = Frame(title="wNim Frame")
let panel = Panel(frame)
let label = StaticText(panel, label="Nim (wNim) でGUI!!")

label.center() # Center label window in parent's client area
frame.center() # Center frame window in screen
frame.show() # A frame is hidden on creation by default.

app.mainLoop() # or app.run()
