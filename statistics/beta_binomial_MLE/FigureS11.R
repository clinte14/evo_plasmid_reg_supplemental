source("CompareTools.R")

#First reading all the EC28 data
Anc <- as.matrix(read.table(file="~/Documents/UFL/RESEARCH/EvaTop/HannahJordt/FigureS11/S11Anc.txt", header=TRUE))
datamatAnc <- Anc

S11aEvo <- as.matrix(read.table(file="~/Documents/UFL/RESEARCH/EvaTop/HannahJordt/FigureS11/S11aEvo.txt", header=TRUE))
datamatEv_a <- S11aEvo

S11bEvo <- as.matrix(read.table(file="~/Documents/UFL/RESEARCH/EvaTop/HannahJordt/FigureS11/S11bEvo.txt", header=TRUE))
datamatEv_b <- S11bEvo


#####  OK, testing Anc vs Ev_1 and Anc. vs Ev_2
AncVsS11a <- joint.vs.sep.fit(datamatAnc=datamatAnc, datamatEv = datamatEv_a, plot.Anc=TRUE)
AncVsS11b <- joint.vs.sep.fit(datamatAnc=datamatAnc, datamatEv = datamatEv_b)

> AncVsS11a
$AncCIs.mat
                 2.5%         MLE       97.5%
Beta0     -4.00083758 -2.74217288 -1.48350817
Beta1      0.20447842  0.70768800  1.21089758
Beta2     -0.05997859 -0.01098525  0.03800809
log(Beta)  0.39401676  1.89624702  3.39847729

$EvCIs.mat
                 2.5%         MLE        97.5%
Beta0     -5.70736444 -3.99977477 -2.292185109
Beta1      0.42033356  1.02032064  1.620307717
Beta2     -0.09526453 -0.04406615  0.007132218
log(Beta)  0.78549969  2.29857152  3.811643353

$JointCIs.mat
                 2.5%         MLE      97.5%
Beta0     -4.20816829 -3.14256663 -2.0769650
Beta1      0.41540456  0.81428992  1.2131753
Beta2     -0.06295044 -0.02624737  0.0104557
log(Beta)  0.66868039  1.66012081  2.6515612

$BIC.sep
[1] 144.2775

$BIC.joint
[1] 139.7283

$Best.model
[1] "Joint dynamics is best"

$negll.anc
[1] 30.86243

$negll.ev
[1] 28.56413

$negll.joint
[1] 63.50804

> AncVsS11b <- joint.vs.sep.fit(datamatAnc=datamatAnc, datamatEv = datamatEv_b)
> AncVsS11b
$AncCIs.mat
                 2.5%         MLE       97.5%
Beta0     -4.00083758 -2.74217288 -1.48350817
Beta1      0.20447842  0.70768800  1.21089758
Beta2     -0.05997859 -0.01098525  0.03800809
log(Beta)  0.39401676  1.89624702  3.39847729

$EvCIs.mat
                 2.5%         MLE       97.5%
Beta0     -4.01746663 -3.01001560 -2.00256457
Beta1      0.26037342  0.64687812  1.03338283
Beta2     -0.05558952 -0.01989798  0.01579356
log(Beta)  1.32921798  2.97574475  4.62227153

$JointCIs.mat
                 2.5%         MLE       97.5%
Beta0     -3.48148780 -2.55045140 -1.61941501
Beta1      0.25198641  0.61445358  0.97692076
Beta2     -0.04993844 -0.01499853  0.01994138
log(Beta)  0.55002917  1.45817448  2.36631979

$BIC.sep
[1] 151.1408

$BIC.joint
[1] 153.2397

$Best.model
[1] "Separate dynamics is best"

$negll.anc
[1] 30.86243

$negll.ev
[1] 31.99578

$negll.joint
[1] 70.26376
