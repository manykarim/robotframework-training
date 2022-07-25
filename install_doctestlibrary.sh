sudo apt-get update
sudo apt-get install -y imagemagick tesseract-ocr ghostscript libdmtx0b allure
export release_name=gs952
export archive_name=ghostpcl-9.52-linux-x86_64
wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/${release_name}/${archive_name}.tgz
tar -xvzf ${archive_name}.tgz
chmod +x ${archive_name}/gpcl6*
cp ${archive_name}/gpcl6* ${archive_name}/pcl6
sudo cp ${archive_name}/* /usr/bin
sudo cp policy.xml /etc/ImageMagick-6/