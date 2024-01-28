library(NHANES)
data("NHANES")
ls(NHANES)
library(ggplot2)
library(dplyr)
library(tableone)
library(summarytools)
library(table1)
library(tidyr)


NHANES<-NHANES[!duplicated(NHANES$ID),]

library(nhanesA)
library(tableone)
#https://cran.r-project.org/web/packages/nhanesA/vignettes/Introducing_nhanesA.html
#nhanesTables('DEMOGRAPHICS', 2010)
#nhanesTables('DIETARY', 2010)
#nhanesTables('EXAMINATION', 2010)
#nhanesTables('LABORATORY', 2010)
#nhanesTables('QUESTIONNAIRE', 2010)
View(NHANES)

df<-data.frame("ID"=NHANES$ID,"Age"=NHANES$Age, "bmi"=NHANES$BMI ,"Sleephrs"=NHANES$SleepHrsNight,"SysBP"=NHANES$BPSysAve,
               "DiaBP"=NHANES$BPDiaAve)




df$sleephrs_factor<-cut(df$Sleephrs,breaks=c(min(df$Sleephrs,na.rm=TRUE),6,9,max(df$Sleephrs,na.rm=TRUE)),levels=c("less","normal","More"))


summary(df$sleephrs_factor)
df <- na.omit(df[c("Age","sleephrs_factor", "SysBP","DiaBP","bmi","Sleephrs")])


demographics <- CreateTableOne(vars = c("Age", "bmi", "sleephrs_factor", "SysBP", "DiaBP"),
                               data = df, 
                               factorVars = c("sleephrs_factor"))
demographics

table1(~ bmi + Age + Sleephrs + sleephrs_factor + SysBP + DiaBP , data=df)




#Linear regresion for BMI AND sleep duration
ggplot(df, aes(x = Sleephrs, y = bmi)) +
  geom_point() +  
  theme_minimal() +
  labs(
    title = "Scatter Plot of BMI vs Sleep Hours",
    x = "Sleep Hours Category",
    y = "BMI"
  ) + 
  geom_smooth(method = "lm", se = FALSE) 

# Linear regression model for BMI
lm_bmi <- lm(bmi ~ sleephrs_factor, data = df)
summary(lm_bmi)

ggplot(df, aes(x = sleephrs_factor, y = bmi)) +
  geom_point() + 
  theme_minimal() +  
  labs(
    title = "Scatter Plot of BMI vs Sleep Hours",
    x = "Sleep Hours Category",
    y = "BMI"
  ) + 
  geom_smooth(method = "lm", se = FALSE) 

#Linear regresion for BP AND sleep duration
ggplot(df, aes(x = Sleephrs, y = SysBP + DiaBP)) +
  geom_point() +  
  theme_minimal() +
  labs(
    title = "Scatter Plot of Blood Pressure vs Sleep Hours",
    x = "Sleep Hours",
    y = "Blood Pressure"
  ) + 
  geom_smooth(method = "lm", se = FALSE)

# Linear regression model for Systolic Blood Pressure
lm_bp <- lm(SysBP + DiaBP ~ sleephrs_factor, data = df)
summary(lm_bp)

ggplot(df, aes(x = sleephrs_factor, y = SysBP + DiaBP)) +
  geom_point() + 
  theme_minimal() +  
  labs(
    title = "Scatter Plot of Blood Pressure vs Sleep Hours",
    x = "Sleep Hours Category",
    y = "Blood Pressure"
  ) + 
  geom_smooth(method = "lm", se = FALSE) 

#Box plot
boxplot(bmi~sleephrs_factor,data=df) 

# ANOVA for BMI
anova_bmi <- aov(bmi  ~ sleephrs_factor, data = df)
summary(anova_bmi)

TukeyHSD(anova_bmi)
plot(TukeyHSD(anova_bmi))



boxplot(SysBP + DiaBP ~sleephrs_factor,data=df)

boxplot(DiaBP~sleephrs_factor,data=df)



# ANOVA for Blood Pressure (Systolic)
anova_sysbp <- aov(SysBP + DiaBP  ~ sleephrs_factor, data = df)
summary(anova_sysbp)

# Tukey HSD for Blood Pressure (Systolic)
TukeyHSD(anova_sysbp)
plot(TukeyHSD(anova_sysbp))





