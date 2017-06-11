# Supply functions to determine whether to reject the Hypothesis

# p-value
# return 1 means reject; return 0 means accept
PValue <- function(pvalue, alpha) {
	if(pvalue <= alpha){
		cat("Because p-value =", pvalue, "< significance level =", alpha, "%. \nSo we should reject the Hypothesis", "\n")
		return(1)
	}
	else{
		cat("Since p-value =", pvalue, "> significance level =", alpha, "%. \nAnd therefore fail to reject the Hypothesis", "\n")
		return(0)
	}
}


# Hypothesis 1 of Critical Region
# DRorNot means whether the Expected Vale is direct ratio with Hypothesis; 1 means yes; 0 means no
# Return -1 means left-tail; Return 0 means double-tail; Return 1 means right-tail
PH1 <- function(ph0, DRorNot){
	func <- menu(c("a value", "not H0", "H1 > H0", "H1 < H0"), title="Select the characteristic of Hypothesis 1")
	
	if(func == 1){
		ph1 = as.numeric(readline("Hypothesis 1: "))
		if(DRorNot == 1){
			if(ph0 < ph1){
				return(1)
			}
			else{
				return(-1)
			}
		}
		else{
			if(ph0 < ph1){
				return(-1)
			}
			else{
				return(1)
			}
		}
	}
	if(func == 2){
		return(0)
	}
	if(func == 3){
		if(DRorNot == 1){
			return(1)
		}
		else{
			return(-1)
		}
	}
}
