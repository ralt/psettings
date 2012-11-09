vim-modes
===

Description
---

This plugin tries to emulate something close to emacs modes.

It allows you to have different vim settings for each project.

If you're working with different coding standards (X project has shiftwidth 2,
Y project has shiftwidth 4, etc), it can become cumbersome to always work with
vim.

This project solves this.

Usage
---

Put a `.mode` file at the root of your project. In this file, put the following
line:

    Drupal

That is, if you want to use the `Drupal` mode.

The default modes are in the `modes/` folder of this plugin. You can add
your own mode by putting the following in your vimrc:

    let g:modes_custom_path = '/your/path/to/modes/'

If a mode is found in both folders, both will be used.

The names you put in the `.mode` file must match the filename of the mode, less
the `.vim` extension.

You can put several modes in your `.mode` file, each mode will be read
sequentially. This allows you to have one "major" mode (for example, all the
projects in the PHP language), and several "minor" modes (Drupal projects,
Symfony projects, Zend projects, etc).

If you simply want to run a mode, you can also run the following command:

    :call Mode("Drupal")

Roadmap
---

See the [issue queue][0].

Contributors
---

- [Florian Margaine](http://margaine.com)

License
---

MIT License.


   [0]: https://github.com/Ralt/vim-modes/issues?labels=enhancement&page=1&state=open
