# mergepdf
Merge pdf docker image

## Usage
merge all pdf files of the current folder to `final.pdf`

    $ docker run  -v ${PWD}:/data/ -u `id -u` -it sunix/mergepdf
