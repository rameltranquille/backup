#!/bin/bash

currDesktop="$( xdotool get_desktop )"

if [[ $currDesktop == '1' ]]; then
   next='2'
fi 
if [[ $currDesktop == '2' ]]; then
   next='3'
fi 
if [[ $currDesktop == '3' ]]; then
   next='1'
fi 



if [[ $currDesktop == '4' ]]; then
   next='5'
fi 
if [[ $currDesktop == '5' ]]; then
   next='4'
fi 


if [[ $currDesktop == '0' ]]; then
   next='6'
fi 
if [[ $currDesktop == '6' ]]; then
   next='0'
fi 


echo curr = $currDesktop
echo going to $next
