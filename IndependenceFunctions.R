# Testing for Independence Functions

source("PlotDiagram.R")
source("PValueCriticalRegion.R")

# Statistics Notes
# Test whether two classification variables are independent:
#			H0: pij = ri * cj => two variables are independent
# 	against H1: not H0



########################### Multinomial ###########################

# Compare attribute A and B (one multinomial distribution with a*b cells)
TFI_MULTINOM_abCELL <- function(alpha, a, b){

	# row: A attribute; col: B attribute
	sample <- array(NA, dim=c(a, b))
	# input sample
	for(row in seq(a)){
		for(col in seq(b)){
			# Xij
			sample[row, col] = as.numeric(readline(sprintf("Input Xij = A%d, B%d: ", row, col)))
		}
	}

	# total sample
	total_sample = sum(sample)

	# estimating ri, for i = 1:a
	r <- array(NA, dim=a)
	r = rowSums(sample)/total_sample

	# estimatin cj, for j = 1:b
	c <- array(NA, dim=b)
	c = colSums(sample)/total_sample

	# indicate pij by pij = ri * cj
	p <- array(NA, dim=c(a, b))
	p = r %*% t(c) # r cross product c's transpose

	

	# Showing sample
	sampleMat <- matrix(NA, nrow=a+1, ncol=b+1)
	sampleMat[1:a, 1:b] = sample
	sampleMat[1:a, b+1] = rowSums(sample)
	sampleMat[a+1, 1:b] = colSums(sample)
	sampleMat[a+1, b+1] = total_sample

	rowname <- paste("A", 1:(nrow(sampleMat)-1), sep="")
	rowname = c(rowname, "Total")
	colname <- paste("B", 1:(ncol(sampleMat)-1), sep="")
	colname = c(colname, "Total")
	row.names(sampleMat) = rowname
	colnames(sampleMat) = colname

	print(sampleMat)

	# Degree of Freedom
	df = (a-1)*(b-1)
	cat(sprintf("Degree of Freedom is %d = (ab-1)-(a-1)-(b-1) = (a-1)(b-1)\n", df))

	# Calculating Statistic Q under H0
	Q <- 0
	for(col in seq(b)){
		for(row in seq(a)){
			Q <- Q + ((sample[row, col] - total_sample*p[row, col])^2)/(total_sample*p[row, col])
		}
	}

	func = menu(c("p-value", "Critical Region"), title="Select inference you want to make")

	if(func == 1){ # p-value
		pvalue = pchisq(Q, df, lower.tail=FALSE)
		PValue(pvalue, alpha)
		switch(readline("Plot(y/n)? "), y={ChiSquPlotPV(total_sample, Q, df)})
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
		switch(readline("Plot(y/n)? "), y={ChiSquPlotCR(total_sample, Q, df, c)})
	}
}

