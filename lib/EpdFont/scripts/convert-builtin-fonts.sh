#!/bin/bash

set -e

cd "$(dirname "$0")"

READER_FONT_STYLES=("Regular" "Italic" "Bold" "BoldItalic")
BOOKERLY_FONT_SIZES=(12 14 16 18)
NOTOSANS_FONT_SIZES=(12 14 16 18)
OPENDYSLEXIC_FONT_SIZES=(8 10 12 14)

for size in ${BOOKERLY_FONT_SIZES[@]}; do
# Default: render at the size requested
  render_size=$size
  
  # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 12 ]; then
    render_size=11
  fi

    # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 14 ]; then
    render_size=11.5
  fi

    # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 16 ]; then
    render_size=12
  fi

    # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 18 ]; then
    render_size=12.5
  fi

  for style in ${READER_FONT_STYLES[@]}; do
    font_name="bookerly_${size}_$(echo $style | tr '[:upper:]' '[:lower:]')"
    font_path="../builtinFonts/source/Bookerly/Bookerly-${style}.ttf"
    output_path="../builtinFonts/${font_name}.h"
    
    # Generate the font using the custom render_size
    python3 fontconvert.py $font_name $render_size $font_path --2bit > $output_path
    
    echo "Generated $output_path (Actual Size: $render_size)"
  done
done

for size in ${NOTOSANS_FONT_SIZES[@]}; do

  # Default: render at the size requested
  render_size=$size
  
  # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 12 ]; then
    render_size=11
  fi

    # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 14 ]; then
    render_size=11.5
  fi

    # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 16 ]; then
    render_size=12
  fi

    # HACK: If the requested size is 12, force it to render at 12.5 instead
  if [ "$size" -eq 18 ]; then
    render_size=12.5
  fi


  for style in ${READER_FONT_STYLES[@]}; do
    font_name="notosans_${size}_$(echo $style | tr '[:upper:]' '[:lower:]')"
    font_path="../builtinFonts/source/NotoSans/NotoSans-${style}.ttf"
    output_path="../builtinFonts/${font_name}.h"
# Generate the font using the custom render_size
    python3 fontconvert.py $font_name $render_size $font_path --2bit > $output_path
    
    echo "Generated $output_path (Actual Size: $render_size)"
  done
done

for size in ${OPENDYSLEXIC_FONT_SIZES[@]}; do
  for style in ${READER_FONT_STYLES[@]}; do
    font_name="opendyslexic_${size}_$(echo $style | tr '[:upper:]' '[:lower:]')"
    font_path="../builtinFonts/source/OpenDyslexic/OpenDyslexic-${style}.otf"
    output_path="../builtinFonts/${font_name}.h"
# Generate the font using the custom render_size
    python3 fontconvert.py $font_name $render_size $font_path --2bit > $output_path
    
    echo "Generated $output_path (Actual Size: $render_size)"
  done
done

UI_FONT_SIZES=(10 12)
UI_FONT_STYLES=("Regular" "Bold")

for size in ${UI_FONT_SIZES[@]}; do
  for style in ${UI_FONT_STYLES[@]}; do
    font_name="ubuntu_${size}_$(echo $style | tr '[:upper:]' '[:lower:]')"
    font_path="../builtinFonts/source/Ubuntu/Ubuntu-${style}.ttf"
    output_path="../builtinFonts/${font_name}.h"
# Generate the font using the custom render_size
    python3 fontconvert.py $font_name $render_size $font_path --2bit > $output_path
    
    echo "Generated $output_path (Actual Size: $render_size)"
  done
done

python3 fontconvert.py notosans_8_regular 8 ../builtinFonts/source/NotoSans/NotoSans-Regular.ttf > ../builtinFonts/notosans_8_regular.h
