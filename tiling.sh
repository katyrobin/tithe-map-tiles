

# look at files on local disc
# pscp
ls D:/History/PRO/IR129_3_Hereford_1/

# copy large file:
# scp D:/History/PRO/IR129_3_Hereford_1/DSC07572_modified2.tif a@b.2.213.202:/tmp/test.tif 

# copy small file:
scp tiles.tif a@b.2.213.202:/tmp/test.tif
scp a@b.2.213.202:/tmp/test.tif hereford-small.tif

# directory
# scp -rv C:/TMP/processing_284ec37bff204825867288a115a982db/65e6c521adf54d6aa7e205df055c25aa/OUTPUT a@b.2.213.202:~/repos/tiles


# downoad gdal dockerfile

# log-in to remote server - with
# ssh server-address@user
ssh a@b.2.213.202
cd ~/hd/repos/
cp -Rv ~/repos/tiles /tmp
pwd -P
free -h # how much ram do I have?

docker run --rm -it -v /tmp/tiles/:/tmp/tiles geographica/gdal2:2.4.1 /bin/bash
cd /tmp/tiles
ls

# see https://github.com/Robinlovelace/pct-raster-tests/blob/master/gdal2.4.sh
gdalinfo hereford.tif

# failed
# gdal2tiles.py hereford.tif -z 5-16 --processes 4 --resume 

# from qgis gui:
gdal2tiles.py -p mercator -z 5-18 -w all -c "David Lovelace" -r average -a 0.0 hereford.tif hereford-many
gdal2tiles.py -p mercator -z 5-18 -w all -c "David Lovelace" -r average -a 0.0 hereford.tif hereford-many
ls

exit # to quit gdal 2.4

cd /tmp/tiles
ls hereford
sudo cp hereford/leaflet.html hereford-many/
# '*.tif' >> .gitignore
# git init

# add these lines to 8 and 9:
#               <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
#             <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>

# vim hereford/leaflet.html
git clone git@github.com:katyrobin/tithe-map-tiles
# git branch -v

# # create gh-pages site: https://pkgdown.r-lib.org/reference/deploy_site_github.html 
# git checkout --orphan gh-pages
# git rm -rf .
# git commit --allow-empty -m 'Initial gh-pages commit'
# git push origin gh-pages
# cd ..
cp -Rv hereford/ tithe-map-tiles
cp -Rv hereford-many/ tithe-map-tiles
cd tithe-map-tiles
git status
# git diff
git add -A
git commit -am 'Add hereford tiles'
git push origin gh-pages
cd ..

exit # quit remote machine
