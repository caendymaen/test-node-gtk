/**
 * .cjs to be able to use require...
 * module imports somehow don't work with node-gtk...
 * 
 * run as LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so node test.js 
 * 
 */

const gi = require("node-gtk")
gi.startLoop();
const GtkLayerShell = gi.require('Gtk4LayerShell');
const GLib = gi.require('GLib', '2.0')
const Gtk = gi.require('Gtk', '4.0')

console.log(Object.values(gi))

//console.log(gi.listAvailableModules())

async function avMod() {
  console.log("list:")
  const abc = await gi.listAvailableModules();
  console.log(abc);
  console.log("abc")
}
avMod()


const loop = GLib.MainLoop.new(null, false)
//gi.startLoop();
console.log("test")

const app = new Gtk.Application('com.yourapp.example',0);

app.on("activate", () => {
  console.log("activated")
  const window = new Gtk.ApplicationWindow(app);
  window.setTitle('My GTK4 Window');
  window.setDefaultSize(400, 300);

  const button = new Gtk.Button.newWithLabel('Click Me');
  button.on('clicked', () => {
    console.log('Button clicked!');
  });

  window.setChild(button);

  GtkLayerShell.initForWindow(window);
  GtkLayerShell.setLayer(window, GtkLayerShell.Layer.TOP);
  GtkLayerShell.setAnchor(window, GtkLayerShell.Edge.BOTTOM, true); 
  GtkLayerShell.setAnchor(window, GtkLayerShell.Edge.LEFT, true); 
  GtkLayerShell.setAnchor(window, GtkLayerShell.Edge.RIGHT, true); // Anchor the window to the bottom of the screen
  GtkLayerShell.autoExclusiveZoneEnable(window)

  window.show();
  window.present();
  console.log("before startloop")
  console.log("before loop run")
  loop.run();
  console.log("after loop run")
});
console.log("before run")
const status = app.run([]);
console.log("run")