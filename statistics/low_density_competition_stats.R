library("gmodels")
library("DescTools")
library("ggplot2")
library("qqplotr")
library("dplyr")
# https://stat-methods.com/home/mann-whitney-u-r/

#Import the data
dat<-read.csv("/home/clint/Dropbox/PhD/Lab/ecoli_factors_incP/manuscript/statistics/low_density_competition.csv")

#Designate genotype as a categorical factor
dat$genotype<-as.factor(dat$genotype)

#Produce descriptive statistics by group
dat %>% select(genotype, W) %>% group_by(genotype) %>% 
  summarise(n = n(), 
            mean = mean(W, na.rm = TRUE), 
            sd = sd(W, na.rm = TRUE),
            stderr = sd/sqrt(n),
            LCL = mean - qt(1 - (0.05 / 2), n - 1) * stderr,
            UCL = mean + qt(1 - (0.05 / 2), n - 1) * stderr,
            median = median(W, na.rm = TRUE),
            min = min(W, na.rm = TRUE), 
            max = max(W, na.rm = TRUE),
            IQR = IQR(W, na.rm = TRUE),
            LCLmed = MedianCI(W, na.rm=TRUE)[2],
            UCLmed = MedianCI(W, na.rm=TRUE)[3])

#Produce Boxplots and visually check for outliers
ggplot(dat, aes(x = genotype, y = W, fill = genotype)) +
  stat_boxplot(geom ="errorbar", width = 0.5) +
  geom_boxplot(fill = "light blue") + 
  stat_summary(fun.y=mean, geom="point", shape=10, size=3.5, color="black") + 
  ggtitle("Boxplot of K-12 and K-12(pBP136KmΔupf31)") + 
  theme_bw() + theme(legend.position="none")

#Test each group for normality
dat %>%
  group_by(genotype) %>%
  summarise(`W Stat` = shapiro.test(W)$statistic,
            p.value = shapiro.test(W)$p.value)

#Perform QQ plots by group
ggplot(data = dat, mapping = aes(sample = W, color = genotype, fill = genotype)) +
  stat_qq_band(alpha=0.5, conf=0.95, qtype=1, bandType = "boot") +
  stat_qq_line(identity=TRUE) +
  stat_qq_point(col="black") +
  facet_wrap(~ genotype, scales = "free") +
  labs(x = "Theoretical Quantiles", y = "Sample Quantiles") + theme_bw()

#Perform the Mann-Whitney U test
m1<-wilcox.test(W ~ genotype, data=dat, na.rm=TRUE, paired=FALSE, exact=FALSE, conf.int=TRUE)
print(m1)


#Hodges Lehmann Estimator
m1$estimate

# Two sample independent T-Test
t.test (W ~ genotype, var.equal=TRUE, data = dat)
