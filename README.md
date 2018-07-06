# Home

![Home Rose Screenshot](https://pacocoursey.github.io/img/home.png?raw=true)

Home is an Übersicht widget that updates based on your desktop.

It reads the file path of the desktop image and applies a CSS style to the `<body>` element that changes the colors.

This is intended only for personal use at this time.

## Design

The design of this widget is based on different information "blocks". Each block resides in a separate `.coffee` file. This way each modular block can refresh at different frequencies and it's easier to customize.

The file `theme.coffee` refreshes most quickly because it detects which desktop is active. The less delay on a desktop change, the less delay on the theme switch. Theme switches will affect all elements with the `themeable` class.

The file `style.coffee` imports a single base CSS file that affects all blocks of the widget. You can add block-specific customization in the `style:` section of each block.

## Getting Started

These instructions will help you install home on your macOS system. Please see the [customization](#customization) section for details on how to make it your own.

### Prerequisites

You'll need [homebrew](https://brew.sh).

Install Übersicht:

```
$ brew cask install ubersicht
```

Clone this repository and move it into the Übersicht widgets folder:

```
$ git clone https://github.com/pacocoursey/home.git
$ mv home/ ~/Library/Application\ Support/Ubersicht/widgets/
```

Ensure Übersicht is running and the widget should appear.

## Customization

Home relies on the names of your desktop images being specific to the theme you want to apply. For example, my three desktop images are named `pink/red/green.jpg`. The widget then reads the filenames, determines what image is active, and adds/removes certain CSS classes to change the style.

You will need to customize a few sections in `theme.coffee`. Here's an example for a purple theme:

* Update the if/else statement to reflect the names of your desktop images

```
if output.includes "purple"
  @handlePurple(domEl)
```

* Create the function and update their names and content

```
handlePurple: (domEl) ->
  $(".themeable").removeClass("red")
  $(".themeable").removeClass("pink")
  $(".themeable").addClass("purple")
  $(".theme").text("Purple")
```

Inside of `styles/base.css`, update the class names and change the hex values for `--fg` and `--bg`:

```
.themeable.purple {
  --bg: #xxxxxx;
  --fg: #xxxxxx;
}
```

## Todo

- Modularize to increase theme update frequency
- Increase extensibility & customizability

## Credits

- Block setup: [gawlk's polybar](https://github.com/gawlk/dots)
- Wallpapers: [gawlk's themes](https://github.com/gawlk/thms) and [unsplash](https://unsplash.com)
- System information: [supernerd widget](https://github.com/blahsd/supernerd.widget)

#

<p align="center">
  <a href="http://paco.sh"><img src="https://raw.githubusercontent.com/pacocoursey/pacocoursey.github.io/master/footer.png" height="300"></a>
</p>
