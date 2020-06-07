#Buat dataset baru
#Jumlah piring dengan warna berbeda di rumah
jumlah<-c(4,8,1,23) #buat variabel jumlah
warna<-c("Merah","Emas","Hijau","Biru") #buat variabel warna

#Buat dataset baru bernama 
ds<-data.frame(jumlah,warna) #gabung variabel jumlah dan warna

#install package vtable
vtable(ds, index=T)

#script developed from
#http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization

#install package ggplot2
library(ggplot2)

#buat barplot

bp <- ggplot(ds, aes(x="",y=jumlah,fill=warna))+
  geom_bar(width=1, stat="identity")
bp

#buat pie chart

pie <- bp + coord_polar("y", start = 0)
pie

#ubah warna pie chart
#manual

a<- pie + scale_fill_manual(values=c("blue","gold","green","red"))
a
#cek list warna 
#http://sape.inf.usi.ch/quick-reference/ggplot2/colour

b<-pie + scale_fill_manual(values=c("dodgerblue1",
                                 "gold1",
                                 "springgreen1",
                                 "red1"))
b
#atau gunakan warna lain seperti
library(ghibli)
#https://github.com/ewenme/ghibli

c<-pie + scale_fill_grey() + theme_minimal()
d<-pie + scale_fill_ghibli_d("PonyoLight", direction=1)
e<-pie + scale_fill_ghibli_d("PonyoLight", direction=-1)
c
d
e
library(scales)
f<-pie + scale_fill_ghibli_d("PonyoLight", direction=-1) + 
  theme(axis.text.x=element_blank()) +
  geom_text(aes(y = jumlah/3 + c(0, cumsum(jumlah)[-length(jumlah)]), 
                label = percent(jumlah/100)), size=4)

f
#Cara lain untuk memvisualisasikan data

tipe<-c("Jumlah piring","Jumlah piring","Jumlah piring","Jumlah piring")

ds2<-data.frame(warna,jumlah,tipe)

g <- ggplot(ds2, aes(x=tipe, y = jumlah, fill=warna)) + 
  geom_bar(stat="identity",position="stack")  + 
  theme_minimal() +
  scale_x_discrete(name = NULL,
                   expand = c(0,0)) +
  scale_fill_ghibli_d("PonyoMedium", direction=-1)+
  coord_flip() +
  geom_text(position = "stack", aes(x=tipe, y = jumlah,  label = jumlah, hjust = 0.5))+
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  labs(x = "", y = "Jumlah piring") +
  guides(fill = guide_legend(reverse = T))

g

