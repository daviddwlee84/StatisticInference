# Hypothesis Testing Functions

source("PValueCriticalRegion.R")

########################### Binomial ###########################

# X tagged in N random survey
#=========== p-value =============#
HT_BINOM_XTAG_PV <- function(alpha) {
	p = as.numeric(readline("Hypothesis of population proportion: "))
	x = as.numeric(readline("Observed x: "))
	N = as.numeric(readline("Total random surveys: "))

	expx = as.integer(p*N) # Expected X

	if(x >= expx){
		pvalue = 2*(pbinom(x-1, N, p, lower.tail = FALSE))
	}
	else{
		pvalue = 2*(pbinom(x, N, p))
	}
	PValue(pvalue, alpha)
	switch(readline("Plot(y/n)? "), y={HTPlotBPV(expx, N, p, x)})
}
#=========== Critical Region =============#
# Haven't test yet #TODO: type 1 & 2 error
HT_BINOM_XTAG_CR <- function(alpha) {
	p = as.numeric(readline("Hypothesis 0 of population proportion: "))
	N = as.numeric(readline("Total random surveys: "))
	whatTail = PH1(ph0, 1)

	expx = as.integer(p*N) # Expected X
	
	if(whatTail == -1){
		c = qbinom(alpha, N, ph0)
		cat(sprintf("Critical Region is C = {X <= %d}\n", c)) 
	}
	if(whatTail == 0){
		c1 = qbinom(alpha/2, N, ph0)
		c2 = qbinom(1-alpha/2, N, ph0)
		cat(sprintf("Critical Region is C = {X <= %d or X >= %d}\n", c1, c2))
		c = c(c1, c2)
	}
	if(whatTail == 1){
		c = qbinom(1-alpha, N, ph0)
		cat(sprintf("Critical Region is C = {X >= %d}\n", c)) 
	}
	switch(readline("Plot(y/n)? "), y={HTPlotBCR(expx, N, p, c, whatTail)})
}


########################### Hypergeometric ###########################

# Randomly draw without replacement n fish and find Y with tag
#=========== p-value =============#
HT_HYPER_TOTAL_PV <- function(alpha) {
	# Statistics Notes
	# Sample Statistic Y: Randomly draw without replacement n fish and find Y fish with tags
	# Inference: The total fish amount N

	N = as.numeric(readline("Hypothesis 0 of total fish N: "))
	k = as.numeric(readline("Total fish with tag: "))
	n = as.numeric(readline("Randomly draw n fish: "))
	y = as.numeric(readline("Found y fish with tag: "))


	expx = as.integer((k/N)*n) # Expected X

	if(y >= expx){
		pvalue = 2*(phyper(y-1, k, N-k, n, lower.tail = FALSE))
	}
	else{
		pvalue = 2*(pbinom(y, k, N-k, n))
	}

	PValue(pvalue, alpha)
	switch(readline("Plot(y/n)? "), y={})


}
