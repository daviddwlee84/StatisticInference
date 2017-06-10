# main prompt

inf <- menu(c("Hypothesis Testing", "Interval Estimating", "Goodness of Fit Testing", "Testing for Homogeneity", "Testing for Independence"), title="Choose an inference you want to do:")

if(inf == 1){
	source("HypothesisTesting.R")
}
if(inf == 2){
	source("IntervalEstimating.R")
}
if(inf == 3){
	source("GoodnessOfFit.R")
}
if(inf == 4){
	source("TestingForHomogeneity.R")
}
if(inf == 5){
	source("TestingForIndependence.R")
}
