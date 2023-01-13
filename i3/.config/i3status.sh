#!/bin/bash

scripts = "/home/coolpants/.config"

echo '{"version":1}'

echo '['
echo '[],'

exec conky -c "/home/coolpants/.config/i3status/conkystatus"
