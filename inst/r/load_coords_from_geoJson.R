  library(geojsonR)
  jsondat <- FROM_GeoJson(system.file('extdata','brain_roi.geojson',
                                      package = 'spammR'))
 
  ##herr er hry yhr
  coords <- do.call(rbind, lapply(jsondat$features,function(x){
     roi <- x$properties$name
     xv <- x$geometry$coordinates[,1]
     yv <- x$geometry$coordinates[,2]
     if (is.null(roi))
        roi = ""
     return(list(ID = roi, x_pixels = min(xv), y_pixels = min(yv),
                  spot_height = max(yv) - min(yv),
                 spot_width = max(xv) - min(xv)))
     })) |>
     as.data.frame() |>
     subset(ID != "") |>
     tidyr::separate(ID,into = c('ROI','Replicate'), 
                     sep = '_', 
                     remove = FALSE) |>
     tibble::remove_rownames() |>
     tibble::column_to_rownames('ID')
 
 ##now for each ROI we want an x, y, cell height and cell_width
 #y-coordinates are from top, so need to udpate
  coords$y_pixels = 263 - unlist(coords$y_pixels) - unlist(coords$spot_height)
  coords$x_pixels = unlist(coords$x_pixels)
  coords$spot_height = unlist(coords$spot_height)
  coords$spot_width = unlist(coords$spot_width)
  readr::write_csv(as.data.frame(coords),file='../extdata/bcoords.csv')