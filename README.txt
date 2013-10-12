A sprite node which will take a single or multiple textures display
the textures tiled within a give size.

The node inherites from SKNode and makes use of a SKCropNode and
SKSprite nodes to create a node of exactly the right size without
distorting the picture.

When multiple textures are given each tile within the node is given
a random texture.

The example creates a tiled node from 4 textures and places it in a scene.
The node can be resize by clicking and dragging anywere on the screen.
