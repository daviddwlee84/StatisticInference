# Goodness of fit functions

source("PlotDiagram.R")
source("PValueCriticalRegion.R")

# Hypothesis Testing Functions

########################### Multinomial ###########################


# Statistics Notes
# Testing For Homogenneity:
#			H0: die is fair => p1 = p2 = ... = pn (common cell probability)
#	against H1 : not H0
# Test if the die is fair by testing if the multinomial distribution has common cell probability
GOF_MULTINOM_DIE <- function(alpha, K){

	sample <- array(NA, dim=K)
	# input sample
	for(i in seq(K)){
		# Xi
		sample[i] = as.numeric(readline(sprintf("Input times of %d face: ", i)))
	}

	# total fliping times
	N = sum(sample)

	# estimating pi
	# p <- array(list(rep(1/K, K)), dim=K)
	p <- 1/K
	cat(sprintf("Estimated common cell probability = %f = (1/%d)\n", p, K))

	# Degree of Freedom
	df = K-1
	cat(sprintf("Degree of Freedom is %d = (K - 1)\n", df))

	# Calculating Statistic Q under H0
	Q <- 0
	for(i in seq(K)){
		Q <- Q + ((sample[i] - N*p)^2)/(N*p)
	}

	func = menu(c("p-value", "Critical Region"), title="Select inference you want to make")

	if(func == 1){ # p-value
		pvalue = pchisq(Q, df, lower.tail=FALSE)
		PValue(pvalue, alpha)
		switch(readline("Plot(y/n)? "), y={ChiSquPlotPV(N, Q, df)})
	}
	if(func == 2){ # Critical Region
		c = qchisq(1-alpha, df)
		cat(sprintf("Critical Region is C = {Q >= %f}\n", c))
		if(Q >= c){
			cat(sprintf("Reject at %.2f%% significance level since Qhat = %f is in C\n", alpha, Q))
		}
		else{
			cat(sprintf("Do not reject at %.2f%% significance level since Qhat = %f is not in C\n", alpha, Q))
		}
		switch(readline("Plot(y/n)? "), y={ChiSquPlotCR(N, Q, df, c)})
	}


}