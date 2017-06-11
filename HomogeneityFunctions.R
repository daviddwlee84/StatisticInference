# Testing For Homogeneity Functions

source("PlotDiagram.R")
source("PValueCriticalRegion.R")

# Statistics Notes
# Testing For Homogenneity:
#			H0 : p11 = p12, p12 = p22, ....., p1k = p2k
#	against H1 : not H0


# Hypothesis Testing Functions

########################### Multinomial ###########################

# M die with K cells have commmon cell probabilities
TFH_MULTINOM_KCELL <- function(alpha, M, K){

	# col: die M; row: face K
	sample <- array(NA, dim=c(K, M))
	# input sample
	for(row in seq(K)){
		for(col in seq(M)){
			# Xij
			sample[row, col] = as.numeric(readline(sprintf("Input %d die, %d face times: ", col, row)))
		}
	}
	# total result of each face
	f <- array(NA, dim=K)
	f = rowSums(sample)

	# throwing times of each die
	n <- array(NA, dim=M)
	n = colSums(sample)

	p <- array(NA, dim=K)
	# estimating pj as p1j, p2j, .....
	for(row in seq(K)){
		p[row] = rowSums(sample)[row]/sum(n)
	}

	# Degree of Freedom
	df = (M*K-M) - (K-1)
	
	# Calculating Statistic Q under H0
	Q <- 0
	for(col in seq(M)){
		for(row in seq(K)){
			Q <- Q + ((sample[row, col] - n[col]*p[row])^2)/(n[col]*p[row])
		}
	}

	func = menu(c("p-value", "Critical Region"), title="Select inference you want to make")

	if(func == 1){ # p-value
		pvalue = pchisq(Q, df, lower.tail=FALSE)
		PValue(pvalue, alpha)
		switch(readline("Plot(y/n)? "), y={TFHPlotMPV(sum(n), Q, df)})
	}
	if(func == 2){ # Critical Region
		c = qchisq(1-alpha, df)
		cat(sprintf("Critical Region is C = {Q >= %f}\n", c))
		if(Q >= c){
			cat(sprintf("Reject at %.2f %% significance level since Qhat = %f is in C\n", alpha, Q))
		}
		else{
			cat(sprintf("Do not reject at %.2f%% significance level since Qhat = %f is not in C\n", alpha, Q))
		}
		switch(readline("Plot(y/n)? "), y={TFHPlotMCR(sum(n), Q, df, c)})
	}
}