# This code is written for readability rather than efficiency.

# UMAP 
# df contain:
#   APC, FITC, BV650, cell type, tissue location and mice id

rm(list=ls())
gc()

library(lme4)
library(effects)


# APC
model <- lmer(Comp.APC.A ~ cell*organ + (1|mice), data = df)
performance::r2(model)

e=allEffects(model)
print(e)

model1 <- lmer(Comp.APC.A ~ cell + (1|mice), data = df)
performance::r2(model1)

model2 <- lmer(Comp.APC.A ~ organ + (1|mice), data = df)
performance::r2(model2)

anova(model1,model2,model)



# FITC
model_F <- lmer(Comp.FITC.A ~ cell*organ + (1|mice), data = df)
performance::r2(model_F)

e=allEffects(model_F)
print(e)

model1_F <- lmer(Comp.FITC.A ~ cell + (1|mice), data = df)
performance::r2(model1_F)

model2_F <- lmer(Comp.FITC.A ~ organ + (1|mice), data = df)
performance::r2(model2_F)

anova(model1_F,model2_F,model_F)



# BV650
model_B <- lmer(Comp.BV650.A ~ cell*organ + (1|mice), data = df)
performance::r2(model_B)

e=allEffects(model_B)
print(e)

model1_B <- lmer(Comp.BV650.A ~ cell + (1|mice), data = df)
performance::r2(model1_B)

model2_B <- lmer(Comp.BV650.A ~ organ + (1|mice), data = df)
performance::r2(model2_B)

anova(model1_B,model2_B,model_B)