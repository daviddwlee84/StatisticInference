# Hypothesis Testing

source("PValueCriticalRegion.R")
source("PlotDiagram.R")


alpha = as.numeric(readline("Significance level(in %): "))
alpha = alpha/100

func = menu(c("p-value", "Critical Region"), title="Select inference you want to make")

dist = menu(c("Binomial Distribution", "Negative-binomial Distribution"), title="Select the distribution of the Sample Statistic")

if(dist == 1){
	sce <- menu(c("X tagged in N random survey"), title="Select the scenario of Sample Statistic")

	if(func == 1){
		p = as.numeric(readline("Hypothesis of population proportion: "))
		x = as.numeric(readline("Observed x: "))
		N = as.numeric(readline("Total random surveys: "))

		expx = as.integer(p*N) # Expected X

		if(x >= N*p){
			pvalue = 2*(pbinom(x-1, N, p, lower.tail = FALSE))
		}
		else{
			pvalue = 2*(pbinom(x, N, p))
		}
		PValue(pvalue, alpha)
		switch(readline("Plot(y/n)? "), y={HTPlotBPV(expx, N, p, x)})
	}
	if(func == 2){  # Haven't test yet #TODO: type 1 & 2 error
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


}
if(dist == 2){
	sce <- menu(c("Found Kth tagged on Xth random servey"), title="Select the scenario of Sample Statistic")
}

