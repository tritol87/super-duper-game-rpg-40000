The Restless Dead — Godot 4 drop-in

1. Copy every file in this folder into your Godot 4 project.
2. Add an AnimatedSprite2D and set its Sprite Frames to <character>.tres.
3. play("walk_south") — every animation below is already named, ordered and sliced.

Characters (6): skeleton, wraith, ghoul, wight, gravebound, boneHound
Animations per character (4): walk_south, walk_west, walk_east, walk_north
Cell: 128x128. Regions come from frames.json, which ships beside the art.

Set Filter to Nearest on the imported textures (Project Settings > Rendering >
Textures > Canvas Textures > Default Texture Filter = Nearest) so the pixels stay crisp.

These .tres files are loaded in a real Godot 4 headless run before this pack ships, and the
animation count, frame count and every atlas region are compared against this file.
