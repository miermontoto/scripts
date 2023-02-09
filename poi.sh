# For each subdirectory
for dir in `ls -d */`
do
    # For each file in the subdirectory
    for file in `ls $dir`
    do
        # Find episode number from filename
        # Filenames contain "Cap.SEE" where S is
        # season number and E is episode number.
        # We want to extract S and E.
        season=`echo $file | sed -e 's/.*Cap.\([0-9]\).*/\1/'`
        episode=`echo $file | sed -e 's/.*Cap.[0-9]\([0-9]\).*/\1/'`

        # Rename each file to follow Plex naming convention
        # "ShowName – sSSeEE - Optional Information.ext"
        filename = "Person of Interest - s"$season"e"$episode
        echo "Renaming $dir$file to $dir$filename"
        #mv $dir$file $dir$filename
    done
done
