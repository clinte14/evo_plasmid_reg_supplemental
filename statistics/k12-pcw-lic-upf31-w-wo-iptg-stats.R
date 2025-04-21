library("gmodels")
library("DescTools")
library("ggplot2")
library("qqplotr")
library("dplyr")
# https://stat-methods.com/home/mann-whitney-u-r/

#Import the data
dat<-read.csv("/home/clint/Dropbox/PhD/Lab/ecoli_factors_incP/growth_rates/SPECTROStarNano/k12-pbp136Km-full-del-pcwlicupf31-in-k12-dh5a-1/k12-pcw-lic-upf31-w-wo-iptg-for-stats.csv")

#Designate genotype as a categorical factor
dat$genotype<-as.factor(dat$genotype)

#Produce descriptive statistics by group
dat %>% select(genotype, mumax) %>% group_by(genotype) %>% 
  summarise(n = n(), 
            mean = mean(mumax, na.rm = TRUE), 
            sd = sd(mumax, na.rm = TRUE),
            stderr = sd/sqrt(n),
            LCL = mean - qt(1 - (0.05 / 2), n - 1) * stderr,
            UCL = mean + qt(1 - (0.05 / 2), n - 1) * stderr,
            median = median(mumax, na.rm = TRUE),
            min = min(mumax, na.rm = TRUE), 
            max = max(mumax, na.rm = TRUE),
            IQR = IQR(mumax, na.rm = TRUE),
            LCLmed = MedianCI(mumax, na.rm=TRUE)[2],
            UCLmed = MedianCI(mumax, na.rm=TRUE)[3])

#Produce Boxplots and visually check for outliers
ggplot(dat, aes(x = genotype, y = mumax, fill = genotype)) +
  stat_boxplot(geom ="errorbar", width = 0.5) +
  geom_boxplot(fill = "light blue") + 
  stat_summary(fun.y=mean, geom="point", shape=10, size=3.5, color="black") + 
  ggtitle("Boxplot of K-12(pCW-LIC-upf31) and K-12(pCW-LIC-upf31)+IPTG") + 
  theme_bw() + theme(legend.position="none")

#Test each group for normality
dat %>%
  group_by(genotype) %>%
  summarise(`W Stat` = shapiro.test(mumax)$statistic,
            p.value = shapiro.test(mumax)$p.value)

#Perform QQ plots by group
ggplot(data = dat, mapping = aes(sample = mumax, color = genotype, fill = genotype)) +
  stat_qq_band(alpha=0.5, conf=0.95, qtype=1, bandType = "boot") +
  stat_qq_line(identity=TRUE) +
  stat_qq_point(col="black") +
  facet_wrap(~ genotype, scales = "free") +
  labs(x = "Theoretical Quantiles", y = "Sample Quantiles") + theme_bw()

#Perform the Mann-Whitney U test
m1<-wilcox.test(mumax ~ genotype, data=dat, na.rm=TRUE, paired=FALSE, exact=FALSE, conf.int=TRUE)
print(m1)


#Hodges Lehmann Estimator
m1$estimate

# Two sample independent T-Test
t.test (mumax ~ genotype, var.equal=TRUE, data = dat)
