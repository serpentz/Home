# home

Home is an Übersicht widget that updates based on your desktop.

It reads the file path of the desktop image and applies a CSS style to the `<body>` element that changes the colors.

This is the first version and is intended only for personal use at this time.

## setup

My three desktops have three different backgrounds. The images are named `pink/red/green.jpg`.

When the Übersicht widget refreshes, it reads the path of the background image, determines what color is active, and applies the appropriate CSS style.

## todo

- Modularize to increase theme update frequency
- Increase extensibility & customizability

## credits

Things I stole from:

- Block setup: [gawlk's polybar](https://github.com/gawlk/dots)
- Wallpapers: [gawlk's themes](https://github.com/gawlk/thms) and [unsplash](https://unsplash.com)
- System information: [supernerd widget](https://github.com/blahsd/supernerd.widget)
