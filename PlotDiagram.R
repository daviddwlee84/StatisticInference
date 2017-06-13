# Plot


# Hypothesis Testing

# Binomial Distribution
# P-value
# obsv is the observed x; expx is the expected x
HTPlotBPV <- function(expx, size, prob, obsx, pvalue) {
	x = seq(0, size)
	hx = dbinom(x, size, prob)
	df <- data.frame(stolpec1 = hx)
	df.bar <- barplot(df$stolpec1)

	## Create a vector of colors selected based on whether x is <obsx or >obsx  
	## (FALSE + 1 -> 1 -> "gray";    TRUE + 1 -> 2 -> "blue")
	if(obsx > expx){
		cols = c("gray", "blue")[(x > obsx) + 1]
	}
	else{
		cols = c("gray", "blue")[(x < obsx) + 1]
	}
	

	barplot(df$stolpec1, col=cols, xlim=c(0, size), ylim=c(-max(hx)/4, max(hx)), names.arg=x, main="Binomial Distribution")
	points(df.bar[obsx+1], 0, pch=4, col="blue", cex=3, lwd=2.5)
	text(df.bar[obsx+1], -max(hx)/6, sprintf("Observed %d", obsx), col="blue", cex=1.)
	points(df.bar[expx+1], 0, pch=17, col="darkgreen", cex=3, lwd=2.5)
	text(df.bar[expx+1],-max(hx)/8, sprintf("Expected %d", expx), col="darkgreen", cex=1.)
}
# Critical Region
HTPlotBCR <- function(expx, size, prob, c, whatTail) {
	x = seq(0, size)
	hx = dbinom(x, size, prob)
	df <- data.frame(stolpec1 = hx)
	df.bar <- barplot(df$stolpec1)
	barplot(df$stolpec1, xlim=c(0, size), ylim=c(-max(hx)/4, max(hx)), names.arg=x, main="Binomial Distribution")
	points(df.bar[expx+1], 0, pch=17, col="darkgreen", cex=3, lwd=2.5)
	text(df.bar[expx+1],-max(hx)/8, sprintf("Expected %d", expx), col="darkgreen", cex=1.)
	if(whatTail == -1){
		points(df.bar[c+1], 0, pch=4, col="blue", cex=3, lwd=2.5)
		text(df.bar[c+1], -max(hx)/10, sprintf("c = %d", c), col="blue", cex=1.)
	}
	if(whatTail == 0){
		points(df.bar[c[1]+1], 0, pch=4, col="blue", cex=3, lwd=2.5)
		text(df.bar[c[1]+1], -max(hx)/10, sprintf("c1 = %d", c[1]), col="blue", cex=1.)
		points(df.bar[c[2]+1], 0, pch=4, col="blue", cex=3, lwd=2.5)
		text(df.bar[c[2]+1], -max(hx)/10, sprintf("c2 = %d", c[2]), col="blue", cex=1.)
	}
	if(whatTail == 1){
		points(df.bar[c+1], 0, pch=4, col="blue", cex=3, lwd=2.5)
		text(df.bar[c+1], -max(hx)/10, sprintf("c = %d", c), col="blue", cex=1.)

	}
}






# Interval Estimating








# Testing For Homogeneity (share with Testing for Independence)
# P-value
TFHPlotMPV <- function(n, Q, df){
	x = rchisq(n, df)
	hx = dchisq(x, df)
	
	h <- hist(x, plot=FALSE)
	cuts <- cut(h$breaks, c(-Inf, Q, Inf))
	cols = c("gray", "blue")[cuts]
	# force to plot in density (probability)
	# h$counts=h$counts/sum(h$counts) # <= bad method
	h$counts=h$density
	plot(h, col=cols, main=paste("Histogram of Q and chi-square with degree of freedom of ",df), ylab="Density")
	
	# useless 
	# hist(x, col=c("gray", "blue")[cut(h$breaks, c(-Inf, Q, Inf))], prob=TRUE, main=paste("Histogram of Q and chi-square with degree of freedom of ",df))	

	curve(dchisq(x, df) , col='green', add=TRUE)
	points(Q, 0, pch=4, col="darkgreen", cex=3, lwd=2.5)
	text(Q, 0.05, sprintf("Q = %f", Q), col="darkgreen", cex=1.)
}

# Critical Region
TFHPlotMCR <- function(n, Q, df, c){
	x = rchisq(n, df)
	hx = dchisq(x, df)
	hist(x, prob=TRUE, main=paste("Histogram of Q and chi-square with degree of freedom of ",df))
	curve(dchisq(x, df) , col='green', add=TRUE)
	points(c, 0, pch=4, col="red", cex=3, lwd=2.5)
	text(c, 0.1, sprintf("c = %f", c), col="red", cex=1.)
	points(Q, 0, pch=4, col="blue", cex=3, lwd=2.5)
	text(Q, 0.05, sprintf("Q = %f", Q), col="blue", cex=1.)

}










