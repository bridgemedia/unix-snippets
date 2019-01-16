#!/bin/bash
# Создание картинок с кадрами-превью из видео, на примере одной телепрограммы:

FILES=/home/bridgemedia/sites/v.bridgemedia.ru/podcast/repost/*

for f in $FILES
do
        FN=`basename "$f"`
        PREVIEW=("$FN".jpg)
        PREVIEW_P="/home/bridgemedia/sites/v.bridgemedia.ru/podcast/repost/$PREVIEW"

        WEBM=("$FN".webm)

        echo "Processing $f ( $FN , $PREVIEW ) file..."

        #read -rsn1

        if [ -f "$PREVIEW_P" ]
                then
                        echo "exists"
                else
                        echo "not found."
                        ffmpeg -i "$f" -ss 00:00:02 -vframes 1 "$PREVIEW_P" # здесь время, с которого берётся кадр
        fi
done

/bin/chown -R bridgemedia:bridgemedia /home/bridgemedia/sites/v.bridgemedia.ru/podcast/repost
/bin/chmod a+rx /home/bridgemedia/sites/v.bridgemedia.ru/podcast/repost

