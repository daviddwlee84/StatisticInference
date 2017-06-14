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

	# total sample
	total_sample = sum(sample)

	# Showing sample
	sampleMat <- matrix(NA, nrow=K+1, ncol=M+1)
	for(row in seq(K)){
		if(row == 1) rowname = sprintf("face%d", 1)
		else rowname = c(rowname, sprintf("face%d", row))
	}
	rowname = c(rowname, "Total")
	for(col in seq(M)){
		if(col == 1) colname = sprintf("die%d", 1)
		else colname = c(colname, sprintf("die%d", col))
	}
	colname = c(colname, "Total")
	sampleMat[1:K, 1:M] = sample
	sampleMat[K+1, 1:M] = n
	sampleMat[1:K, M+1] = f
	sampleMat[K+1, M+1] = total_sample
	row.names(sampleMat) = rowname
	colnames(sampleMat) = colname
	print(sampleMat)

	cat("Total samples =", total_sample, "\n")

	p <- array(NA, dim=K)
	# estimating pj as p1j, p2j, .....
	for(row in seq(K)){
		p[row] = f[row]/total_sample
		cat(sprintf("Estimated p for face %d = %f = %d/%d\n", row, p[row], f[row], total_sample))
	}

	# Degree of Freedom
	df = (M*K-M) - (K-1)
	cat(sprintf("Degree of Freedom is %d = (M * K - M) - (K - 1)\n", df))
	
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
