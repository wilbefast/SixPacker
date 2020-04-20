# SIX PACKER

## WHAT IT IS
This is a little sprite packing script for [Heaps](https://heaps.io), but it will work for anything that uses the [.atlas](https://fileinfo.com/extension/atlas) format.

## DEPENDENCIES
You'll need to install [ImageMagick](https://imagemagick.org).

## HOW TO USE IT
You can regenerate the example by doing the following:
```bash
$cd example
../sixpacker.sh foreground
```
This will generate an atlas in PNG format as well as metadata in ALTAS format. Each folder is assumed to contain an animation, exported as individual frames. I use [Krita](https://krita.org/)'s "render animation" to create these frames easily.

## ROADMAP
I plan to improve the tool moving forward so that it packs atlases better: currently it is very much a minimal viable product for use in small projects.

## LICENCE
I use the MIT licence. Please mention me, but otherwise you're free to use this however you like. 
