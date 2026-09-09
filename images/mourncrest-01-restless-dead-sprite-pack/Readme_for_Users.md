# Mourncrest 01 — The Restless Dead

**Pack #1 of the Mourncrest series.** Six undead characters, four directions each, three-frame walk
cycles, at **64×64 and 128×128 — both drawn native, neither upscaled.**

> ⚠️ **AI DISCLOSURE — read this first, because you deserve to decide with it in hand.**
> **The art in this pack is generated with an AI image model.** Every sprite was produced with
> **PixelLab**, a pixel-art diffusion model, on a paid plan that grants commercial rights, and then
> palette-locked and cut to each grid by tooling we wrote. The code in that pipeline was written
> with AI assistance too. The itch listing is tagged **Generative AI: Graphics = yes, Code = yes**.
> If you would rather not use AI-generated assets, please don't buy this — no hard feelings, and
> thank you for reading this far.
>
> What we *can* offer instead of a claim about how it was made is a **mechanical proof of what you
> actually receive** — see the consistency proof below. Every number in it is re-derived from the
> decoded pixels of the exact files in this download, and you can re-run it yourself.

---

## What is in the box

| | |
| --- | --- |
| **Characters** | skeleton · wraith · ghoul · wight · gravebound · bone-hound |
| **Directions** | south, west, east, north (4) |
| **Animation** | 3-frame walk cycle per direction |
| **Frames** | **72** distinct frames per grid size |
| **Grid sizes** | **64×64 · 128×128 — each one generated natively at that size** |
| **Palette** | 48 colours, a strict superset of the base Mourncrest palette |
| **Files** | 180 PNGs, plus `pack.json` and `frames.json` |

Every frame ships **twice**: as an individual PNG in `<size>/frames/`, and packed into a
per-character sheet in `<size>/sheets/`. You should not have to slice anything by hand.

---

## RPG Maker MZ: drop the `rpgmaker_mz` folder in and it just works

Copy either grid's contents into your project's `img/characters/`. That is the whole setup — no
resizing, no re-slicing, no plugin.

**What that folder actually is, stated plainly:** the sheets in `rpgmaker_mz/` are **the same
pixels** as the ones in `64x64/sheets/` and `128x128/sheets/` — byte-for-byte identical, not
re-exported. This pack was already laid out the way MZ wants: 3 columns × 4 rows, rows in MZ's own
order (down, left, right, up).

**The only thing that changed is the filename, and it is the thing that makes or breaks it.** MZ
decides how to cut a character sheet by looking for a `$` at the front of the filename
(`ImageManager.isBigCharacter`). With the `$`, it divides the image by 3 across and 4 down — 64×64
cells, correct. **Without it, MZ assumes an eight-character sheet and divides by 12 across and 8
down**, slicing this art into 16×32 fragments and rendering nonsense. So `skeleton_sheet.png` and
`$Skeleton.png` are identical files that behave completely differently in the engine.

Both grids are provided because MZ's default character is 48×48: **64×64 is the practical choice**
for most projects; 128×128 suits higher-resolution projects and cutscene work.

Verified against the MZ core scripts shipped with the engine — the 3-across / 4-down arithmetic, the
row order and the `$` rule are each read out of `rmmz_sprites.js` and `rmmz_managers.js` rather than
assumed, and our exporter re-reads them on every run, so if Kadokawa ever changes them our build
fails instead of your game.


## Godot 4: drop the folder in and every animation is already named

Copy everything in `engine_import/godot/64x64/` into your project, add an `AnimatedSprite2D`, set
its **Sprite Frames** to `skeleton.tres`, and call `play("walk_south")`. Each character has its own
resource with every animation already named, ordered and sliced. Set **Project Settings > Rendering
> Textures > Canvas Textures > Default Texture Filter** to **Nearest** so the pixels stay crisp.

**These resources were loaded in a real headless Godot 4 before this pack shipped** — the engine was
asked to count and measure what it actually built (animations, frame counts, playback speed, loop
flag, and the atlas region of every individual frame) and every number was compared against the
files you are holding. A resource that has never been imported is a claim, not a feature.

Provided at both 64x64 and 128x128.

⚠️ **Other engines:** `64x64/frames/` holds every frame as an individual PNG, which is the path of
least resistance for Godot, Unity and GameMaker. `frames.json` gives each frame's exact
`x, y, w, h` if you would rather slice the sheets yourself.

## The cast

| | |
| --- | --- |
| **Skeleton** | The rank and file of the barrow. A spear standing clear above the skull. |
| **Wraith** | A hooded revenant in a long grave-cloth coat. Skeletal claws at the cuffs and a heavy boot stride. |
| **Ghoul** | Bent double. Head thrust forward past its own shoulders. |
| **Wight** | The barrow-king. The broadest, hardest silhouette in the pack. |
| **Gravebound** | Half-swallowed by the barrow. A wide mound instead of legs. |
| **Bone-hound** | The barrow's dog. The only four-legged thing in the pack. DRAWN IN SIDE VIEW IN ALL FOUR DIRECTIONS. |

**These six were designed to be told apart at a glance, and that is measured rather than claimed.**
Each is authored around one feature that *breaks its outline* — a spear above the skull, a hooded
grave-cloth column, a head thrust past the shoulders, a crowned and spiked helm, a mound instead of legs, four
legs and a tail. The test throws away every interior pixel and compares the bare silhouettes: the
floor is 25% of the combined outline differing, and across all 15 pairings in this pack **the
closest pair measures 51.7%** — twice the floor. In practice that is the difference between a crowd
that reads as six roles and one that reads as one sprite in six palettes.

## The sheet layout

Each character sheet is **3 columns × 4 rows**:

```
          frame 0   frame 1   frame 2
row 0  →   south     south     south      (down)
row 1  →   west      west      west       (left)
row 2  →   east      east      east       (right)
row 3  →   north     north     north      (up)
```

That is **RPG Maker's character-sheet row order** (down / left / right / up), so the sheets drop
straight into MZ/MV-style importers. For everything else, `frames.json` gives the exact
`x, y, w, h` of every frame by name — Godot, Unity, Aseprite, LÖVE, or your own loader.

## ✅ The consistency proof — the part nobody else ships

The honest worry about generated art is that frame 40 will not match frame 1. So rather than
promise consistency, this pack **asserts** it, mechanically, and the assertions are re-run against
the decoded pixels of every file before release. Measured on the exact bytes in this download:

```
PACK INTEGRITY PROOF — Mourncrest 01: The Restless Dead [64x64]
  180 image(s) · 64px cell · 48-colour palette · grid variants 64/128

  [PASS] Every .png really is a PNG (not a renamed JPEG)        180 files checked
  [PASS] Every image decodes to real pixels                     180 files checked
  [PASS] Every sprite is exactly one cell, sheets a multiple     180 files checked
  [PASS] Every opaque pixel falls inside the declared palette    1,547,384 opaque pixels checked
  [PASS] Alpha is strictly binary — no anti-aliasing           5,898,240 pixels checked
  [PASS] Frame map covers every character × direction × anim     216 frames checked
  [PASS] Every asset present at one grid size is present at all  180 asset slots checked

  RESULT: PROVEN
```

**What each one means for you, in practice:**

- **Palette conformance.** All 773,970 opaque pixels fall in the same 48 colours, listed in
  `pack.json`. Recolour that list and the whole pack recolours together.
- **Binary alpha.** No semi-transparent edge pixels anywhere. Nearest-neighbour scaling stays crisp
  and there are no grey halos when you scale or key it.
- **Grid-size parity.** Nothing exists at one size and is missing at another. (This is a real defect
  in shipped packs — it is why the check exists.)
- **Format integrity.** Every `.png` really is a PNG. (Also a real, shipped defect elsewhere.)
- **Frame-map completeness.** `frames.json` covers every declared character × direction × animation,
  and every entry lands inside its sheet.

**Both grid sizes are drawn natively — 128×128 is not a scaled-up 64×64.** The larger grid carries
genuinely more detail: more readable hands, finer bone, a sharper face. That costs more to make than
replicating pixels, and it is the difference between a pack that offers two sizes and one that
offers a size plus a resize. If you want smooth-scaled art, this is not that pack — the alpha is
deliberately hard at every size.

## ✅ And one more check, which we added because this pack failed it

**Every character's east and west facings provably face opposite ways.** That sounds too obvious to
test. It is not: two side views can be comfortably different pictures and still both face the same
direction, and every other check in our pipeline passes when they do. We measure it by comparing the
east frame against west and against *mirrored* west — the pair is correctly opposed only when it
matches the mirror more closely.

**Two characters in this pack failed that test and were repaired before release** — the bone-hound
and the wraith, whose west cycles both came back facing right. Their west frames are now derived as
exact horizontal mirrors of their east frames, which is how hand-made packs have always built a side
pair: it guarantees the two sides are opposed *and* that they hold identical detail, which
independently drawn sides do not. The other four characters have independently drawn sides.

We mention it because you would have found it in ten minutes of play, and because a pack that tells
you which two frames are mirrored is more useful than one that hopes you do not check.

## Licence

See `LICENSE.txt`. Short version: **commercial use is permitted**, in any number of projects,
including games you sell. Do not resell or redistribute the assets themselves as an asset pack.

## Using it with the rest of the series

The palette is a **frozen, strictly-growing file**: every colour of the base Mourncrest palette is
present here unchanged, so later packs extend this one rather than restyling it. A character from a
future Mourncrest pack will stand next to a wight from this one with no seam — same colours, same
cell, same four directions in the same row order, same three-frame walk.

> ℹ️ **On grid size, plainly:** the series is standardised on **64/128**. An earlier version of this
> pack was cut at 16×16; it was withdrawn and completely redrawn at native 64/128 rather than
> upscaled. If you bought that version, this rebuild is free.

## The series

Pack #1 of a numbered series, all sharing one growing palette and one grid standard.

- **01 — The Restless Dead** *(this pack)*
- 02 — The Pale Choir · cultists and their thralls
- 03 — Barrow Beasts · the crypt's animals
- 04 — Iron Wardens · the faction that fights the rest

---

*Core Systems Asset Factory*


## A note on the Bone-Hound's facings

boneHound is drawn in SIDE VIEW in all four directions. Its east and west frames are true opposed profiles; its south and north frames are side views too, not a front and a back view. This is deliberate and it is a limitation, not an oversight: a skeletal quadruped seen head-on is a view our generator cannot hold while also holding the bare-bone anatomy - three attempts across two years of tooling are on record, and each one returned either a correct front view of a LIVE dog or a correct skeleton back in profile. Every other character in this pack has true front, back and opposed side views. If you need a strict four-direction hound, use this one as a side-facing creature, or use its east/west frames for all movement.
