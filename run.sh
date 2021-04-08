#!/bin/sh

path="./detections_only/MOT16/"
# path="./detections_only/MOT17/"

#output="output_CNN_features.txt"
output="output.txt"

motdir="../deep_sort/MOT16/train/"

results="./results/"

#To run for single video; Edit motdir as well
# python3 shallow_sort_app.py \
# --sequence_dir=$motdir \
# --detection_file=$path \
# --min_confidence=0.37
# --output_file=$results

python3 evaluate_motchallenge.py \
--mot_dir=$motdir \
--detection_dir=$path \
--output_dir=$results \
--min_confidence=0.3 \
--mode=111

#Evaluate using py-motmetrics
var=$(python3 ../py-motmetrics/motmetrics/apps/evaluateTracking.py \
$motdir \
$results \
./Sequence.txt)

echo "$var\n" > $output

exit 0 #Remove to run other modes

#IOU only
python3 evaluate_motchallenge_copy.py \
--mot_dir=./MOT16/train/ \
--detection_dir=$path \
--output_dir=./results \
--mode=011

var=$(python3 ../py-motmetrics/motmetrics/apps/evaluateTracking.py \
./MOT16/train/ \
./results \
./Sequence.txt)

echo "$var\n" >> $output

#Features with gating
python3 evaluate_motchallenge_copy.py \
--mot_dir=./MOT16/train/ \
--detection_dir=$path \
--output_dir=./results \
--mode=101


var=$(python3 ../py-motmetrics/motmetrics/apps/evaluateTracking.py \
./MOT16/train/ \
./results \
./Sequence.txt)

echo "$var\n" >> $output

#Features without gating
python3 evaluate_motchallenge_copy.py \
--mot_dir=./MOT16/train/ \
--detection_dir=$path \
--output_dir=./results \
--mode=100

var=$(python3 ../py-motmetrics/motmetrics/apps/evaluateTracking.py \
./MOT16/train/ \
./results \
./Sequence.txt)

echo "$var\n" >> $output
