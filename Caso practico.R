
library(tidyverse)

df <- read.csv("Titanicv2.csv")

colSums(is.na(df))
str(df)
summary(df)

df %>% 
  select(Pclass, Survived, Age, Sex, Embarked) %>% 
  filter(Survived== "Yes") 
  

df %>% 
  select(Pclass, Survived, Age, Sex, Embarked) %>% 
  filter(Pclass== "Upper Class", Survived == "Yes", Age < 30)

df %>% 
  select(Pclass, Survived, Age, Sex, Embarked) %>%
  filter(Age < 30)
  

#Explorar datos 
df %>% 
  group_by(Survived) %>% 
  summarise(edad.promedio= mean(Age, na.rm = TRUE)) %>% 
  ungroup() %>% 
  arrange(desc(edad.promedio))

df %>% 
  group_by(Pclass) %>% 
  summarise(edad.promedio= mean(Age, na.rm = TRUE)) %>% 
  ungroup() %>% 
  arrange(desc(edad.promedio))

df %>% 
  ggplot(aes(x=Age, fill = Survived)) +
  geom_histogram(alpha=0.5)

df %>% 
  ggplot(aes(x= Pclass, y= Age, fill = Age)) +
  geom_boxplot()

df %>% 
  group_by(Sex, Survived) %>% 
  summarise(
    total = n()
  ) %>% 
ungroup()

df %>% 
  ggplot(aes(x=Pclass, y= Survived, colour = Sex)) +
  geom_point(position = "Jitter")

df %>% 
  ggplot(aes(x=Pclass, y= Survived, colour = Age)) +
  geom_point(position = "Jitter")

df %>% 
  ggplot(aes(Pclass)) +
  geom_bar ()

