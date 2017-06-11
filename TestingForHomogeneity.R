# Testing for homogeneity

source("HomogeneityFunctions.R")

alpha = as.numeric(readline("Significance level(in %): "))
alpha = alpha/100

dist <- menu(c("Multinomial Distribution"), title="Select the distribution of the Sample Statistic")


if(dist == 1){
	sce <- menu(c("M die with K cells have commmon cell probabilities"), title="Select the scenario of Sample Statistic")

	if(sce == 1){
		M = as.numeric(readline("How many die (M multi-dist.)? "))
		K = as.numeric(readline("How many cell each die (K nomial)? "))
		TFH_MULTINOM_KCELL(alpha, M, K)
	}
}