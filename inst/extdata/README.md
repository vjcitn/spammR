# Data files

This directory contains numerous files to be loaded with the package

## Image files
We included numerous images to run our examples:
- `us_map.png`: map of the US
- Three pancreas samples: 
    - `Image_0.png`
    - `Image_1.png`
    - `Image_2.png`
- `brain_img_0.png`: This file was manually downloaded from metaspace. 

## Coordinates files
- `brain_roi.geojson`: We manually extracted the coordinates from the brain 
  images using QuPath and exported them to `geoJSON` format for the analysis
- `bcoord.csv`: This file was generated using the script 
  `../r/load_coords_from_geojson.R`