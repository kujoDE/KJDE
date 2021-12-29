#!/bin/sh
exec bspwm &&
exec sxhkd &&
setkbmap pl && 
exec lxsession &&
picom -b 
