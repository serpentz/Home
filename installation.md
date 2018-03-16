# installation

You'll need [homebrew](https://brew.sh).

Install Übersicht:

```
brew cask install ubersicht
```

Clone this repository and move it into the Ubersicht widgets folder:

```
git clone https://github.com/pacocoursey/home.git
mv home ~/Library/Application\ Support/Ubersicht/widgets/
```

Ensure Ubersicht is running and the widget should appear.

---

This relies heavily on the name of the current desktop image.

You will need to customize a few sections in `home.coffee`:

* Update this if/else statement to reflect the names of your desktop images (i.e. `includes "purple"`)
* Update the function and function call names

```
if values.desktop.includes "green"
  @handleGreen(domEl)
else if values.desktop.includes "red"
  @handleRed(domEl)
else if values.desktop.includes "pink"
  @handlePink(domEl)
```

* Update the function classes and theme name (i.e. `addClass("purple)"`)

```
handleGreen: (domEl) ->
  $(".wrapper").removeClass("red")
  $(".wrapper").removeClass("pink")
  $(".wrapper").addClass("green")
  $(".theme").text("Lily")
```

Inside of `styles/base.css`, update the class names and change the hex values for `--fg` and `--bg`.

Ex:

```
.wrapper.purple {
  --bg: #xxxxxx;
  --fg: #xxxxxx;
}
```
