# Hypothesis Testing Parser

source("PValueCriticalRegion.R")
source("PlotDiagram.R")
source("HypothesisTestingFunctions.R")


alpha = as.numeric(readline("Significance level(in %): "))
alpha = alpha/100

func = menu(c("p-value", "Critical Region"), title="Select inference you want to make")

dist = menu(c("Binomial Distribution", "Negative-binomial Distribution"), title="Select the distribution of the Sample Statistic")

if(dist == 1){
	sce <- menu(c("X tagged in N random survey"), title="Select the scenario of Sample Statistic")

	if(sce == 1){
		if(func == 1){
			HT_BINOM_XTAG_PV(alpha)
		}
		if(func == 2){  
			HT_BINOM_XTAG_CR(alpha)
		}
	}


}
if(dist == 2){
	sce <- menu(c("Found Kth tagged on Xth random servey"), title="Select the scenario of Sample Statistic")
}

