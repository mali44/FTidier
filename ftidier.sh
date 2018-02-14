#!/bin/bash
echo "CTF ismi ?"
read fileName

build_fs(){
  folder=$1
  fileCount=$2
  echo $folder
  echo $fileCount

  mkdir -p "$folder"

  cd $folder
  for i in $(seq 1 $fileCount);
   do
	echo "$folder$i"
	mkdir -p "$folder$i"
	echo `pwd`
   done
  cd ../	
    
}
check_int(){
	
	if [ "$1" -eq "$1" ] 2>/dev/null
	then
	    echo "$1 is an integer !!"
	else
	    echo "ERROR: first paramter must be an integer."
	    echo $USAGE
	    exit 1
	fi
}

mainDir=$HOME/Desktop/$fileName
if [ -e $mainDir ]
then
 echo "Bu dosya ismi bu dizinde zaten var"
else
 mkdir  $mainDir
 cd $mainDir
 echo "Forensic icin dosya ihtiyaciniz  = ?"
 read forNumber
 check_int $forNumber
 forFile="Forensic"
 
 echo "Reverse icin dosya ihtiyaciniz = ?"
 read  revNumber
 check_int $revNumber
 revFile="Reverse"
 
 echo "Web icin dosya ihtiyaciniz = ?"
 read webNumber
 check_int $webNumber
 webNumber="Web"
 
 echo "Mobil icin dosya ihtiyaciniz = ?"
 read mobNumber
 check_int $mobNumber
 mobFile="Mobile"
 
 echo "Cyber Int icin dosya ihtiyaciniz = ?"
 read cybNumber
 check_int $cybNumber
 cybFile="Intelligence"
 
 build_fs $forFile $forNumber
 build_fs $revFile $revNumber
 build_fs $webFile $webNumber
 build_fs $mobFile $mobNumber
 build_fs $cybFile $cybNumber
fi

