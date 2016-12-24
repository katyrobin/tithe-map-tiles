library(raster)
system.time({r = stack("TMO_georef.tif")})
r # 8000 by 5000

msg = "gdal2tiles.py TMO_georef_4326.tif"
system.time(system(msg)) # 50 seconds
dim(r)[1] * dim(r)[2] / 50000 # 761,000 pixels/second on 3 bands

dir.create("partiles")
msg = "python ~/other-repos/geopackage-python/Tiling/gdal2tiles_parallel.py -e -p -output_format='png' mercator TMO_georef_4326.tif partiles/"
system.time(system(msg)) # 50 second
