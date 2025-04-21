setwd("/home/clint/Dropbox/PhD/Lab/ecoli_factors_incP/manuscript/statistics/stabilityToolkit")
library("devtools")
library("StabilityToolkit")

k12wt_pBP136Anc.data <- as.matrix(read.table(file="anc.csv", header=TRUE, sep=','))

k12wt_pBP136EvoA.data <- as.matrix(read.table(file="evoA.csv", header=TRUE, sep=','))

k12wt_pBP136EvoB.data <- as.matrix(read.table(file="evoB.csv", header=TRUE, sep=','))

k12wt_pBP136EvoC.data <- as.matrix(read.table(file="evoC.csv", header=TRUE, sep=','))

simpleSSfit_anc <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="SS")
simpleHTfit_anc <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="HT")

simpleSSfit_evoA <- dynamic.fit(data1=k12wt_pBP136EvoA.data,model="SS")
simpleHTfit_evoA <- dynamic.fit(data1=k12wt_pBP136EvoA.data,model="HT")

simpleSSfit_evoB <- dynamic.fit(data1=k12wt_pBP136EvoB.data,model="SS")
simpleHTfit_evoB <- dynamic.fit(data1=k12wt_pBP136EvoB.data,model="HT")

simpleSSfit_evoC <- dynamic.fit(data1=k12wt_pBP136EvoC.data,model="SS")
simpleHTfit_evoC <- dynamic.fit(data1=k12wt_pBP136EvoC.data,model="HT")

comb.SSfit_anc_evoA <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="SS", comb=TRUE,data2=k12wt_pBP136EvoA.data)
comb.SSfit_anc_evoB <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="SS", comb=TRUE,data2=k12wt_pBP136EvoB.data)
comb.SSfit_anc_evoC <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="SS", comb=TRUE,data2=k12wt_pBP136EvoC.data)
comb.SSfit_evoA_evoB <- dynamic.fit(data1=k12wt_pBP136EvoA.data,model="SS", comb=TRUE,data2=k12wt_pBP136EvoB.data)
comb.SSfit_evoA_evoC <- dynamic.fit(data1=k12wt_pBP136EvoA.data,model="SS", comb=TRUE,data2=k12wt_pBP136EvoC.data)
comb.SSfit_evoB_evoC <- dynamic.fit(data1=k12wt_pBP136EvoB.data,model="SS", comb=TRUE,data2=k12wt_pBP136EvoC.data)

comb.HTfit_anc_evoA <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="HT", comb=TRUE,data2=k12wt_pBP136EvoA.data)
comb.HTfit_anc_evoB <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="HT", comb=TRUE,data2=k12wt_pBP136EvoB.data)
comb.HTfit_anc_evoC <- dynamic.fit(data1=k12wt_pBP136Anc.data,model="HT", comb=TRUE,data2=k12wt_pBP136EvoC.data)
#comb.HTfit_evoA_evoB <- dynamic.fit(data1=k12wt_pBP136EvoA.data,model="HT", comb=TRUE,data2=k12wt_pBP136EvoB.data)
#comb.HTfit_evoA_evoC <- dynamic.fit(data1=k12wt_pBP136EvoA.data,model="HT", comb=TRUE,data2=k12wt_pBP136EvoC.data)
comb.HTfit_evoB_evoC <- dynamic.fit(data1=k12wt_pBP136EvoB.data,model="HT", comb=TRUE,data2=k12wt_pBP136EvoC.data)

print("simpleSSfit_anc")
simpleSSfit_anc$mles.cis
simpleSSfit_anc$BIC

print("simpleHTfit_anc")
simpleHTfit_anc$mles.cis
simpleHTfit_anc$BIC

print("simpleSSfit_EvoA")
simpleSSfit_evoA$mles.cis
simpleSSfit_evoA$BIC

print("simpleHTfit_EvoA")
simpleHTfit_evoA$mles.cis
simpleHTfit_evoA$BIC

print("simpleSSfit_EvoB")
simpleSSfit_evoB$mles.cis
simpleSSfit_evoB$BIC

print("simpleHTfit_EvoB")
simpleHTfit_evoB$mles.cis
simpleHTfit_evoB$BIC

print("simpleSSfit_EvoC")
simpleSSfit_evoC$mles.cis
simpleSSfit_evoC$BIC

print("simpleHTfit_EvoC")
simpleHTfit_evoC$mles.cis
simpleHTfit_evoC$BIC

print('comb.SSfit_anc_evoA')
comb.SSfit_anc_evoA

print('comb.SSfit_anc_evoB')
comb.SSfit_anc_evoB 

print('comb.SSfit_anc_evoC')
comb.SSfit_anc_evoC

print('SSfit_evoA_evoB')
comb.SSfit_evoA_evoB

print('SSfit_evoA_evoC')
comb.SSfit_evoA_evoC

print('comb.SSfit_evoB_evoC')
comb.SSfit_evoB_evoC

print('comb.HTfit_anc_evoA')
comb.HTfit_anc_evoA

print('comb.HTfit_anc_evoB')
comb.HTfit_anc_evoB 

print('comb.HTfit_anc_evoC')
comb.HTfit_anc_evoC

#print('HTfit_evoA_evoB')
#comb.HTfit_evoA_evoB

#print('HTfit_evoA_evoC')
#comb.HTfit_evoA_evoC

print('comb.HTfit_evoB_evoC')
comb.HTfit_evoB_evoC

