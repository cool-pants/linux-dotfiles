#!/bin/bash

# Install fisher
sh <(curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher)

# Install Fisher libraries
fisher install jethrokuan/z
fisher install IlanCosman/tide

