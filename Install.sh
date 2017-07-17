path=$(pwd)
path=$path/json/json.jar
cat ANGRYPUPPY.cna | sed -e "s|{{PATH}}|$path|g" > ANGRYPUPPY2.cna
mv ANGRYPUPPY2.cna ANGRYPUPPY.cna
