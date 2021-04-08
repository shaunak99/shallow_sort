# ShallowSORT

ShallowSORT is based on DeepSORT. In ShallowSORT, the deep CNN features are replaced with the HSV based color histograms as features and the feature extraction process is brought online. 

You may find the MOTChallenge results [here](https://motchallenge.net/method/MOT=3356&chl=5).

This implementation also running the method in a few modes to see the effect of tracking using only certain modes such as Tracking using:

* IoU Only
* Features Only (With Gating)
* Features Only (Without Gating)

When tracking using features only, IoUs are only used for track initiation and not for association.

Clone the repo and place the MOTChallenge dataset to form path ./MOT16/train. 

To run the code, use the bash script

```bash
./run
```

Edit run.sh accordingly to enable other modes.
