# Hypothesis Testing Parser

source("HypothesisTestingFunctions.R")


alpha = as.numeric(readline("Significance level(in %): "))
alpha = alpha/100

func = menu(c("p-value", "Critical Region"), title="Select inference you want to make")

dist = menu(c("Binomial Distribution", "Negative-binomial Distribution", "Normal Distribution", "Hypergeometric Distribution"), title="Select the distribution of the Sample Statistic")

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
if(dist == 3){
	sce <- menu(c("Proportion (by CLT)"), title="Select the scenario of Sample Statistic")
}
if(dist == 4){
	sce <- menu(c("Randomly draw without replacement n fish and find Y with tag", "Number of femailes in a group"), title="Select the scenario of Sample Statistic")

	if(sce == 1){
		if(func == 1){
			HT_HYPER_TOTAL_PV(alpha)
		}
		if(func == 2){ 
		}
	}
	if(sce == 2){
		if(func == 1){
			HT_HYPER_TAGGED_PV(alpha)
		}
		if(func == 2){  
		}
	}
}

