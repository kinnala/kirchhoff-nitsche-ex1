#!/bin/bash

jq -r '.cells[2].outputs[1].data."image/png"' nitsche_clamped_square.nbconvert.ipynb | base64 -d > ex1_mesh_$1.png
jq -r '.cells[4].outputs[1].data."image/png"' nitsche_clamped_square.nbconvert.ipynb | base64 -d > ex1_nitsche_$1.png
jq -r '.cells[5].outputs[1].data."image/png"' nitsche_clamped_square.nbconvert.ipynb | base64 -d > ex1_traditional_$1.png
jq '[(.cells[2].outputs[0].data."text/plain"[0]|tonumber), (.cells[4].outputs[0].data."text/plain"[0]|tonumber), (.cells[5].outputs[0].data."text/plain"[0]|tonumber), (.cells[6].outputs[0].data."text/plain"[0]|tonumber), (.cells[8].outputs[0].data."text/plain"[0]|tonumber), (.cells[9].outputs[0].data."text/plain"[0]|tonumber)] | @csv' nitsche_clamped_square.nbconvert.ipynb -r >> ex1results.csv
