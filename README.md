# Dotfiles
Dotfiles managed by GNU Stow.

## Usage

### Using Stow

```
./stow.sh [-[nV]] [package1 package2 ...]

Explanations:
    Default is in verbose mode, add -V to disable verbose.
    Add -n to dry run.
```

### Check Sensitive Infomations Leakage

If you would like to make your repository public, privacy protection need to
be valued.

To do it, first create a file named `sensitive.txt`, which contains patterns
one per line. Each patterns is a BRE that matches some of your sensitive
informations. Then run the following command:

```bash
./check.sh
```

I strongly recommend you run this command in you local repository:

```bash
ln -sr check.sh .git/hooks/pre-commit
```
