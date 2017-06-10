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
	cols = c("gray", "blue")[(x > obsx) + 1]

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