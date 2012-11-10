psettings aka Project Settings
===

Description
---

This plugin allows you to have different vim settings for each project.

If you're working with different coding standards (X project has shiftwidth 2,
Y project has shiftwidth 4, etc), it can become cumbersome to always work with
vim.

This project solves this.

Usage
---

Put a `.psettings` file at the root of your project. In this file, put the
following line:

    Drupal

That is, if you want to use the `Drupal` project settings.

The default settings are in the `settings/` folder of this plugin. You can add
your own settings folder by putting the following in your vimrc:

    let g:psettings_custom_path = '/your/path/to/settings/'

If a settings file is found in both folders, both will be used.

The names you put in the `.psettings` file must match the filename of the
settings file, less the `.vim` extension.

You can put several project settings in your `.psettings` file, each settings
file will be read sequentially. This allows you to have one "major" settings
file(for example, all the projects in the PHP language), and several "minor"
settings modes (Drupal projects, Symfony projects, Zend projects, etc).

If you simply want to run a project settings, you can also run the following
command:

    :call Psettings("Drupal")

Roadmap
---

See the [issue queue][0].

Contributors
---

- [Florian Margaine](http://margaine.com)

License
---

MIT License.


   [0]: https://github.com/Ralt/psettings/issues?labels=enhancement&page=1&state=open
