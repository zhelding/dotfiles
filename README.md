# dotfiles

My config files, including a setup script designed to take a base Antergos
installation to my preferred machine state.

I have multiple machines running Antergos, each with slightly different
configuration requirements. However, maintaining multiple mostly-identical,
frequently-updated Git branches in sync is a pain.

So, I use [mir.qualia](https://github.com/darkfeline/mir.qualia), which allows
me to conditionally comment out blocks of config files based on the machine
name. With this method, I maintain four separate machines:

- **echidna**: Home desktop
- **hestia**: Home laptop
- **vivian**: Work laptop
- **artemis**: Cloud workstation
