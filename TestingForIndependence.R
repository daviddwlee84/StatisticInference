# Testing for independence

source("IndependenceFunctions.R")

alpha = as.numeric(readline("Significance level(in %): "))
alpha = alpha/100


sce <- menu(c("Compare attribute A and B (multinomial distribution with a*b cells)"), title="Select the scenario of Sample Statistic")

if(sce == 1){
	a = as.numeric(readline("How many events of A? "))
	b = as.numeric(readline("How many events of B? "))
	TFI_MULTINOM_abCELL(alpha, a, b)
}
