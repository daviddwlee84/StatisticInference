# Goodness of fit

source("GoodnessOfFitFunctions.R")

alpha = as.numeric(readline("Significance level(in %): "))
alpha = alpha/100


dist <- menu(c("Multinomial Distribution", "Normal Distribution", "Poisson Distribution", "Binomial Distribution"), title="Select the distribution of the Sample Statistic")


if(dist == 1){
	sce <- menu(c("Test if the die is fair"), title="Select the scenario of Sample Statistic")

	if(sce == 1){
		K = as.numeric(readline("How many cell each die (K nomial)? "))
		GOF_MULTINOM_DIE(alpha, K)
	}


}


